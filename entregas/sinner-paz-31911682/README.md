TRABAJO PRÁCTICO: GESTIÓN DE RIESGOS CON SIMPLERISK

Datos de la estudiante

Nombre completo: Maria Paz Sinner
LU: 31911682
Email institucional: sinnerpaz@uch.edu.ar
Comisión: 4to año
Branch: entrega/sinner-paz-31911682

Objetivo

El trabajo configura una instancia local reproducible de SimpleRisk y desarrolla el registro inicial de riesgos de una clínica privada ficticia de 120 empleados que atiende aproximadamente 800 pacientes por día.

Contenido de la entrega

- entorno/docker-compose.yml permite levantar SimpleRisk, MySQL y un servicio de correo de prueba.
- entorno/.env.example contiene las variables necesarias sin contraseñas.
- configuracion/usuarios.md documenta tres usuarios con permisos diferenciados.
- configuracion/riesgos.md documenta el riesgo de prueba, los siete riesgos del caso y los tres planes de mitigación.
- informe/informe.md desarrolla el análisis, la comparación metodológica y la integración externa propuesta.
- informe/capturas contiene las evidencias visuales revisadas.
- reporte-ejecutivo/reporte.pdf contiene el reporte dirigido al directorio.

Cómo levantar el entorno

Requisitos: Docker Desktop con Docker Compose disponible.

1. Abrir una terminal en la carpeta entorno.

2. Copiar .env.example con el nombre .env.

3. Reemplazar cada texto REEMPLAZAR_CON_CLAVE por una contraseña local distinta. No reutilizar credenciales personales o institucionales.

4. Ejecutar:

docker compose up -d

5. Verificar el estado:

docker compose ps

6. Abrir https://localhost en el navegador. El certificado es autofirmado porque la instalación se utiliza únicamente en el laboratorio local. El acceso HTTP queda disponible en http://localhost:8088 y redirige a HTTPS.

7. Iniciar sesión con el usuario administrador definido por la instalación y crear los usuarios documentados en configuracion/usuarios.md. Las contraseñas no forman parte de esta entrega.

8. Para detener los contenedores sin borrar datos:

docker compose stop

9. Para volver a iniciarlos:

docker compose start

10. No ejecutar docker compose down -v, porque elimina el volumen con la base de datos.

Decisiones de diseño

- La instalación se limita a 127.0.0.1 y no está preparada para producción.
- Se utiliza la imagen identificada de SimpleRisk y MySQL 8.0.
- Las contraseñas se almacenan únicamente en el archivo local .env, excluido por .gitignore.
- Se definieron tres perfiles: administración, análisis de riesgos y auditoría.
- La evaluación académica utiliza una matriz de probabilidad por impacto de 1 a 5.
- Los resultados académicos se distinguen de la puntuación nativa Classic de SimpleRisk.
- Los controles existentes, responsables y presupuestos corresponden a un escenario ficticio.
- SimpleRisk se utiliza como registro operativo y NIST SP 800-30 como guía para profundizar el análisis.
- La integración con Jira se presenta como diseño documentado y no como implementación real.

Checklist de auto-revisión

- [x] No hay credenciales en los archivos incluidos en la entrega.
- [x] El archivo .gitignore está correctamente configurado.
- [x] Las capturas de pantalla no muestran datos sensibles.
- [x] No se incluyen archivos SQL ni dumps.
- [x] El informe está en un formato legible.
- [x] El reporte ejecutivo está completo y tiene un máximo de tres páginas.
- [ ] Los mensajes de commit son descriptivos. Se verificará al crear el commit.
- [ ] La branch está actualizada y funciona correctamente. Se verificará antes del push.

Advertencias de publicación

No copiar ni subir entorno/.env. No subir datos persistentes de MySQL, logs, certificados, archivos comprimidos ni capturas distintas de las incluidas. Antes del commit se debe revisar git status y git diff --cached.
