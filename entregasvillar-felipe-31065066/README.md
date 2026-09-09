# Trabajo Práctico: Gestión de Riesgos con SimpleRisk

## Datos del alumno

- Felipe Villar Zuloaga
- LU 31065066
- villarfelipe@uch.edu.ar
- Comisión G
- Seguridad de Sistemas

## Descripción del TP

El presente trabajo práctico aborda la gestión de riesgos de seguridad de la información utilizando SimpleRisk desplegado mediante Docker. El análisis se aplica a una clínica médica privada ficticia, con foco en sus sistemas de información y en los riesgos que pueden afectar la confidencialidad, integridad y disponibilidad de la información.

## Descripción de la clínica

La organización analizada es una clínica médica privada ficticia de aproximadamente 120 empleados y unas 800 atenciones diarias. Sus principales sistemas son el HIS y las Historias Clínicas Digitales (HCD). La operación también depende de servidores, estaciones de trabajo, infraestructura de red, copias de seguridad y correo institucional.

## Objetivo

Identificar, registrar y priorizar riesgos de seguridad mediante SimpleRisk, documentando los tratamientos planificados y los responsables asociados. El objetivo es contar con una visión ordenada de los riesgos y establecer acciones de mitigación realistas.

## Requisitos

- Docker
- Docker Compose
- Navegador web
- Acceso a una terminal para ejecutar los comandos del entorno

## Instrucciones para levantar SimpleRisk

1. Ingresar al directorio del entorno:
`cd entorno`

2. Desplegar los contenedores:
`docker compose up -d`

Una vez iniciado el entorno, el acceso previsto es:

https://localhost:8443

La configuración de usuarios, riesgos y planes de mitigación se realiza en SimpleRisk según lo documentado en los archivos de configuracion/.

## Verificación del entorno

Para comprobar que los servicios están corriendo correctamente, ejecutar en la terminal:

`docker compose ps`

Debe verificarse que tanto la base de datos MySQL/MariaDB como el contenedor de SimpleRisk figuren con estado Up (o running).

Para revisar los logs de la aplicación ante cualquier inconveniente de conexión:

`docker compose logs -f`

## Configuración

Se configuraron tres usuarios con roles diferenciados: Administrator, Risk Manager y Risk Reviewer. También se registraron siete riesgos y tres planes de mitigación para R01, R02 y R04.

Los valores de riesgo documentados corresponden a los valores observados en SimpleRisk y no se presentan como riesgo residual. Los planes tienen un porcentaje inicial de mitigación de 0 %, ya que se encuentran planificados.

## Decisiones de diseño

Se aplicó el principio de mínimo privilegio para separar las tareas de administración, gestión y revisión. Para la evaluación de riesgos se utilizó una matriz cualitativa de Probabilidad × Impacto de 5 × 5.

La priorización se mantuvo de acuerdo con los valores observados en SimpleRisk, sin reemplazar los riesgos configurados por otros escenarios.

## Metodología

1. Identificación de activos y contexto.
2. Identificación de amenazas y riesgos.
3. Registro de los riesgos en SimpleRisk.
4. Evaluación mediante probabilidad e impacto.
5. Priorización.
6. Definición de planes de mitigación.
7. Documentación y seguimiento.

## Supuestos

- La clínica y los datos utilizados en el trabajo son ficticios.
- Los valores de riesgo corresponden a la configuración observada en SimpleRisk.
- Las mitigaciones documentadas como planificadas no se consideran controles ya implementados.
- No se incluyen credenciales ni secretos.

## Seguridad de la información

No se incluyen contraseñas, tokens, claves API, Webhooks reales, credenciales reales, datos personales de pacientes, historias clínicas reales ni bases de datos reales en el repositorio.

## Verificación

Se incluye la palabra clave girasol para confirmar la lectura completa de la consigna del trabajo práctico.

## Checklist de Auto-Revisión

Checklist completado:

- [x] No hay credenciales en el repositorio
- [x] El `.gitignore` está correctamente configurado
- [x] Las capturas no muestran datos sensibles
- [x] Los archivos `.sql` o dumps no están subidos
- [x] El informe está en formato legible
- [x] El reporte ejecutivo está completo
- [x] Los mensajes de commit son descriptivos
- [x] Mi branch está actualizada y funciona
