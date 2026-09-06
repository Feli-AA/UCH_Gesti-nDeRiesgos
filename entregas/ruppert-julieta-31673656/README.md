# Trabajo Práctico: Gestión de Riesgos con SimpleRisk

## Seguridad de Sistemas

Trabajo práctico individual para la gestión, análisis y tratamiento de riesgos utilizando **SimpleRisk**, desarrollado en el marco de la cátedra de Seguridad.

---

## 1. Datos del estudiante

- **Nombre completo:** Julieta Ruppert
- **LU:** 31673656
- **Email institucional:** julietaruppertc@gmail.com / ruppertjulieta@uch.edu.ar
- **Comisión:** 4to año 

---

## 2. Descripción del trabajo

El objetivo de este trabajo práctico es familiarizarse con las funcionalidades de **SimpleRisk** como herramienta de gestión de riesgos en una organización.

El trabajo busca aplicar criterios profesionales para:
- Identificar riesgos realistas.
- Evaluar probabilidad e impacto.
- Justificar los niveles de riesgo.
- Definir controles existentes.
- Proponer planes de tratamiento.
- Gestionar riesgos y planes de acción mediante SimpleRisk.
- Analizar críticamente la metodología utilizada.
- Comparar SimpleRisk con metodologías alternativas de gestión de riesgos.
- Documentar una integración con herramientas externas (n8n, Jira y Telegram).

---

## 3. Instrucciones para levantar el entorno

El despliegue de SimpleRisk está automatizado mediante Docker. Para levantar el entorno en una máquina con Ubuntu, sigue estos pasos:

**Opción A: Usando el script de instalación automática**
1. Otorga permisos de ejecución al script: `chmod +x entorno/setup.sh`
2. Ejecuta el script: `./entorno/setup.sh`
3. El script instalará Docker, descargará la imagen y levantará el contenedor en los puertos 80 y 443.

**Opción B: Usando Docker Compose**
Si ya tienes Docker y Docker Compose instalados:
1. Navega a la carpeta del entorno: `cd entorno`
2. Ejecuta: `docker-compose up -d`

Una vez finalizado, ingresa a `http://localhost` (o la IP de la máquina virtual) en tu navegador web.

---

## 4. Decisiones de diseño

Para la resolución de este trabajo, se tomaron las siguientes decisiones de diseño:
* **Metodología de Evaluación:** Se optó por la matriz clásica de Probabilidad × Impacto (escala 1 a 5) integrada por defecto en SimpleRisk, por ser ideal para obtener visibilidad inmediata de los riesgos en el contexto de una clínica de tamaño medio, frente a opciones más complejas y burocráticas como NIST SP 800-30.
* **Supuestos del Escenario:** El análisis asume una clínica privada operativa con 120 empleados, una carga de 800 pacientes diarios y una alta dependencia de sistemas de historias clínicas digitales y facturación constante con Obras Sociales.

### Verificación
girasol

---

## 5. Checklist de auto-revisión

- [x] No hay credenciales en el repositorio.
- [x] El `.gitignore` está correctamente configurado.
- [x] Las capturas no muestran datos sensibles.
- [x] Los archivos `.sql` o dumps no están subidos.
- [x] El informe está en formato legible.
- [x] El reporte ejecutivo está completo.
- [x] Los mensajes de commit son descriptivos.
- [x] La branch está actualizada y funciona.
- [x] SimpleRisk puede levantarse y reproducirse siguiendo las instrucciones.
- [x] Los usuarios y permisos están documentados.
- [x] Los riesgos fueron cargados en SimpleRisk.
- [x] Se definieron al menos 3 planes de acción.
- [x] Se realizó el análisis crítico de la metodología.
- [x] Se documentó una integración con una herramienta externa.