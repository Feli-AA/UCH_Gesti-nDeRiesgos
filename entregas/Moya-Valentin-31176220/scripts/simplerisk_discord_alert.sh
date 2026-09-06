#!/usr/bin/env bash
#
# Integracion SimpleRisk -> Discord
# ----------------------------------
# Consulta la base de datos de SimpleRisk (ejecutando la query DENTRO del
# contenedor, via docker compose exec) buscando riesgos de nivel Alto o
# Critico, y notifica el resultado por webhook a un canal de Discord
# usando curl.
#
# Nota: la API REST oficial de SimpleRisk es un modulo pago ("Extra"), no
# incluida en la instalacion Core que usamos en este TP. Por eso esta
# integracion consulta directamente la base de datos interna del
# contenedor en lugar de usar una API.
#
# Variables de entorno requeridas (NO hardcodear valores reales):
#   DISCORD_WEBHOOK_URL   -> URL del webhook de Discord
#   DB_PASSWORD           -> password del usuario simplerisk en MySQL
#
# Uso: bash simplerisk_discord_alert.sh

set -euo pipefail

UMBRAL_NIVEL_ALTO="6.0"

if [ -z "${DISCORD_WEBHOOK_URL:-}" ]; then
    echo "Error: falta la variable de entorno DISCORD_WEBHOOK_URL." >&2
    exit 1
fi
if [ -z "${DB_PASSWORD:-}" ]; then
    echo "Error: falta la variable de entorno DB_PASSWORD." >&2
    exit 1
fi

RESULTADO=$(docker compose exec -T simplerisk mysql \
    -h 127.0.0.1 -P 3306 --protocol=TCP \
    -u simplerisk -p"${DB_PASSWORD}" simplerisk \
    -N -B \
    -e "SELECT r.id, r.subject, rs.calculated_risk, r.status
        FROM risks r
        JOIN risk_scoring rs ON r.id = rs.id
        WHERE rs.calculated_risk >= ${UMBRAL_NIVEL_ALTO}
        ORDER BY rs.calculated_risk DESC;" 2>/dev/null)

if [ -z "$RESULTADO" ]; then
    echo "No hay riesgos de nivel alto/critico para notificar."
    exit 0
fi

MENSAJE="ALERTA: Riesgos Altos/Criticos en SimpleRisk.\n"
MENSAJE+="Se detectaron los siguientes riesgos que requieren atencion prioritaria:\n\n"

while IFS=$'\t' read -r id subject calculated_risk status; do
    MENSAJE+="#${id} - ${subject} (nivel: ${calculated_risk}, estado: ${status})\n"
done <<< "$RESULTADO"

JSON_PAYLOAD=$(python3 -c "import json,sys; print(json.dumps({'content': sys.argv[1]}))" "$MENSAJE")

curl -s -w "\nHTTP_STATUS:%{http_code}\n" -H "Content-Type: application/json" \
    -d "$JSON_PAYLOAD" \
    "$DISCORD_WEBHOOK_URL"
