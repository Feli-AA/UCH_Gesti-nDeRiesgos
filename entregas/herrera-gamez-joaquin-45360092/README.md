# TP: Gestión de Riesgos con SimpleRisk

## Datos del alumno

- **Nombre completo:** Joaquín Herrera Gámez
- **DNI:** 45360092
- **Email institucional:** herreragamezjoaquin@uch.edu.ar
- **Comisión:** G

## Instrucciones para levantar el entorno

1. Clonar el repositorio y ubicarse en esta carpeta de entrega.
2. Ingresar a la carpeta del entorno y levantar los contenedores:
```bash
   cd entorno/
   docker compose up -d
```
3. Verificar que los 4 servicios estén corriendo:
```bash
   docker compose ps
```
4. Acceder a SimpleRisk desde el navegador en `https://localhost:8443` (el certificado es autofirmado; el navegador va a advertir "conexión no segura",  es esperable en un entorno de prueba local, avanzar igual).
5. Acceder a la bandeja de MailHog (para ver las alertas simuladas de la actividad D2) en `http://localhost:8025`.
6. Para correr el script de alertas (Parte D2), ubicarse en `scripts/`, crear un archivo `.env` con las variables indicadas en `informe/informe.md` (Parte D2), e instalar las dependencias:
```bash
   pip install mysql-connector-python python-dotenv
   python alertas_riesgos.py
```

## Decisiones de diseño

- **Entorno:** Docker Compose con 3 servicios (MySQL, SimpleRisk, MailHog), en vez de Vagrant/OVA, por rapidez de configuración y reproducibilidad.
- **Puerto 8443 en vez de 8080:** SimpleRisk fuerza redirección a HTTPS; se expuso el puerto 443 del contenedor porque el 8080 (HTTP) no permite completar el login. Detalle completo en `informe/informe.md` (Parte A).
- **3 roles de usuario (Admin, Analista, Auditor):** cumplen el mínimo exigido por la consigna aplicando separación de funciones. Los roles adicionales mencionados en la Parte B (Dirección Médica, Jefatura de TI, etc.) son propietarios organizacionales conceptuales de cada riesgo, no usuarios técnicos del sistema, justificación completa en `informe/informe.md` (Parte A).
- **Metodología de comparación (Parte C):** se eligió ISO/IEC 27005 como alternativa a la matriz clásica de SimpleRisk, por ser la referencia adoptada incluso por el propio Estado argentino (ONTI) al no imponer una metodología propia.
- **Integración externa (Parte C.2 y D2):** se optó por SMTP en vez de Slack/Teams/Jira, por ser el protocolo de notificación más universal entre distintas plataformas de trabajo. Se implementó de forma real usando MailHog (servidor SMTP simulado) para no depender de credenciales de correo reales. La API REST de SimpleRisk se descartó por no estar disponible en la licencia Community utilizada (es un "Extra" de pago); se optó en su lugar por una consulta de solo lectura a la base de datos MySQL.
- **Actividades optativas elegidas:** D2 (integración real) y D4 (propuesta de mejora).

## Verificación

Confirmo haber revisado el documento completo del enunciado. Palabra clave: **girasol**.

## Checklist de auto-revisión

- [x] No hay credenciales reales en el repositorio.
- [x] El `.gitignore` está correctamente configurado.
- [x] Las capturas no muestran datos sensibles.
- [x] Los archivos `.sql` o dumps no están subidos al repositorio
- [x] El informe está en formato legible.
- [x] El reporte ejecutivo está completo.
- [x] Los mensajes de commit son descriptivos, prefijados por parte del enunciado
- [x] Mi branch está actualizada y funciona