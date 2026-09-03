# TP — Gestión de Riesgos con SimpleRisk

## Datos personales

- **Nombre completo:** Lautaro Fiochetta
- **LU:** 44309650
- **Email institucional:** fiochettalautaro@uch.edu.ar
- **Comisión:** G
- **Branch de esta entrega:** `entrega/fiochetta-lautaro-44309650`

## Cómo levantar el entorno

Requisitos: [Docker](https://docs.docker.com/get-docker/) y Docker Compose v2 instalados y corriendo.

1. Clonar el repositorio y pararse en esta branch:
   ```bash
   git clone https://github.com/arelgueta/UCH_Gesti-nDeRiesgos.git
   cd UCH_Gesti-nDeRiesgos
   git checkout entrega/fiochetta-lautaro-44309650
   cd entregas/fiochetta-lautaro-44309650
   ```
2. Levantar el stack (SimpleRisk + MySQL + SMTP):
   ```bash
   cd entorno
   ./setup.sh
   ```
   Esto ejecuta `docker compose up -d`, espera a que el servicio responda y muestra la URL de acceso.
   Alternativa manual: `docker compose up -d` y luego esperar ~1-2 minutos a que MySQL termine de inicializar.
3. Abrir **http://localhost:8080** en el navegador. La primera vez, SimpleRisk pide completar un asistente de instalación (idioma, cuenta de administrador inicial).
4. Los 3 usuarios de este TP (roles y permisos) están documentados en `configuracion/usuarios.md` — hay que recrearlos manualmente desde el panel de administración de SimpleRisk (Users → Add User), ya que **las contraseñas nunca se documentan ni se commitean**.
5. Para reproducir la integración con Slack (sección C.2 del informe y actividad D2):
   ```powershell
   $env:WEBHOOK_URL = "https://hooks.slack.com/services/....."   # tu propio Incoming Webhook
   cd scripts
   .\notificar-riesgos.ps1
   ```
   El script nunca debe correrse con un webhook hardcodeado ni commiteado; usar siempre la variable de entorno o un `.env` local (ver `.env.example`).
6. Para bajar el entorno: `docker compose down` (agregar `-v` para además borrar los datos y reiniciar desde cero).

## Decisiones de diseño

- **Metodología de riesgos:** se usó la matriz clásica Probabilidad × Impacto (escala 1-5) nativa de SimpleRisk, ya que el escenario (clínica que recién está armando su primer registro de riesgos, sin datos históricos de pérdidas) no justifica el esfuerzo de una metodología cuantitativa como FAIR. La comparación completa entre ambos enfoques está en `informe/informe.md`, sección C.1.
- **Supuestos del escenario:** se asumió que la clínica no tenía, previo a esta auditoría, ningún control formal de logging, capacitación en seguridad, backups verificados ni generador de respaldo — coherente con el enunciado ("la auditoría externa identificó debilidades en su gestión de riesgos"). Las probabilidades de cada riesgo se justificaron combinando este contexto con fuentes externas (Verizon DBIR) cuando fue posible.
- **Imagen de Docker:** se usó `simplerisk-minimal` con MySQL como servicio separado (en vez de la imagen `simplerisk` todo-en-uno) para que el entorno se acerque más a un despliegue real y persista los datos en volúmenes nombrados independientes del contenedor de la aplicación.
- **Integración externa:** se evaluó primero la API REST oficial de SimpleRisk, mencionada en la consigna, pero es una funcionalidad de las ediciones pagas y no está disponible en la versión Community usada acá. Se implementó como alternativa funcional un Incoming Webhook de Slack (detalle en `informe/informe.md`, sección C.2), manteniendo la URL del webhook exclusivamente en `.env` (gitignoreado) y rotándola después de las pruebas.
- **Verificación:** confirmo haber leído el enunciado completo del TP, incluyendo la sección de verificación de lectura — palabra clave: **girasol**.

## Checklist de auto-revisión

- [x] No hay credenciales en el repositorio
- [x] El `.gitignore` está correctamente configurado
- [x] Las capturas no muestran datos sensibles
- [x] Los archivos `.sql` o dumps no están subidos
- [x] El informe está en formato legible
- [x] El reporte ejecutivo está completo
- [x] Los mensajes de commit son descriptivos
- [x] Mi branch está actualizada y funciona
