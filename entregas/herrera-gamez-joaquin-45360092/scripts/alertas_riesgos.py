#Script consulta los riesgos de nivel Alto/Critico en SimpleRisk y envia una notificacion por correo (SMTP)

import smtplib
import json
import os
from email.mime.text import MIMEText
from dotenv import load_dotenv

import mysql.connector

load_dotenv()
# Variables de entorno
DB_HOST = os.environ["DB_HOST"]
DB_PORT = int(os.environ["DB_PORT"])
DB_USER = os.environ["DB_USER"]
DB_PASSWORD = os.environ["DB_PASSWORD"]
DB_NAME = os.environ["DB_NAME"]

SMTP_HOST = os.environ["SMTP_HOST"]
SMTP_PORT = int(os.environ["SMTP_PORT"])
ALERT_FROM = os.environ["ALERT_FROM"]
ALERT_TO = os.environ["ALERT_TO"]

UMBRAL_ALTO_CRITICO = 4.0
ESTADO_FILE = os.path.join(os.path.dirname(__file__), "riesgos_notificados.json")


def cargar_notificados():
    if os.path.exists(ESTADO_FILE):
        with open(ESTADO_FILE, "r") as f:
            return set(json.load(f))
    return set()


def guardar_notificados(ids):
    with open(ESTADO_FILE, "w") as f:
        json.dump(list(ids), f)


def obtener_riesgos_altos():
    conn = mysql.connector.connect(
        host=DB_HOST, port=DB_PORT, user=DB_USER,
        password=DB_PASSWORD, database=DB_NAME,
    )
    cursor = conn.cursor()
    cursor.execute("""
        SELECT r.id, r.subject, s.calculated_risk
        FROM risks r
        JOIN risk_scoring s ON r.id = s.id
        WHERE s.calculated_risk >= %s
        ORDER BY s.calculated_risk DESC
    """, (UMBRAL_ALTO_CRITICO,))
    riesgos = cursor.fetchall()
    cursor.close()
    conn.close()
    return riesgos


def enviar_alerta(risk_id, subject, score):
    cuerpo = (
        f"Se detecto un riesgo de nivel Alto/Critico en SimpleRisk.\n\n"
        f"ID: {risk_id}\n"
        f"Riesgo: {subject}\n"
        f"Puntaje calculado: {score}\n\n"
        f"Revisar en la plataforma para definir o dar seguimiento al plan de "
        f"mitigacion correspondiente."
    )
    msg = MIMEText(cuerpo, _charset="utf-8")
    msg["Subject"] = f"[SimpleRisk] Alerta: {subject} - Score {score}"
    msg["From"] = ALERT_FROM
    msg["To"] = ALERT_TO

    with smtplib.SMTP(SMTP_HOST, SMTP_PORT) as server:
        server.sendmail(ALERT_FROM, [ALERT_TO], msg.as_string())


def main():
    notificados = cargar_notificados()
    riesgos = obtener_riesgos_altos()

    nuevos = 0
    for risk_id, subject, score in riesgos:
        if risk_id in notificados:
            continue
        enviar_alerta(risk_id, subject, score)
        notificados.add(risk_id)
        nuevos += 1
        print(f"Alerta enviada: [{risk_id}] {subject} (score {score})")

    guardar_notificados(notificados)
    print(f"Listo. {nuevos} alerta(s) nueva(s) enviada(s) de {len(riesgos)} riesgos Alto/Critico.")


if __name__ == "__main__":
    main()