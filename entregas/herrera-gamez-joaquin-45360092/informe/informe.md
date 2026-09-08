## Parte A: Instalación y Configuración Básica

### Instalación reproducible

SimpleRisk se instaló mediante Docker Compose, con 3 servicios: `db` (MySQL 8.0), `simplerisk` (imagen `simplerisk/simplerisk-minimal`) y `mailhog` (servidor SMTP simulado, usado en la Parte D). El archivo completo está en `entorno/docker-compose.yml` y el entorno se levanta con:

```bash
cd entorno/
docker compose up -d
```

**Por qué se accede por el puerto 8443 y no por el 8080:** SimpleRisk fuerza redirección a HTTPS al completar el instalador. El puerto 8080 solo expone HTTP (el puerto 80 del contenedor), por lo que el navegador queda esperando una respuesta en el puerto 443 que no estaba mapeado. Se agregó el mapeo `8443:443` para exponer también el puerto HTTPS del contenedor, permitiendo completar la instalación (con la advertencia esperable de certificado autofirmado, propia de un entorno de prueba local).

**Incidencia durante la instalación:** el instalador de SimpleRisk creó el usuario de base de datos `simplerisk_app` con permiso restringido al host `db`. Sin embargo, MySQL tenía activado el modo `skip-name-resolve`, que ignora nombres de host y solo reconoce direcciones IP, dejando ese permiso inoperante. Se corrigió recreando el usuario con host comodín (`%`), permitiendo la conexión desde la IP real del contenedor de la aplicación.

### Usuarios y permisos

Se crearon 3 usuarios con roles diferenciados: **Administrador**, **Analista de Riesgos** y **Auditor**, documentados en detalle en `configuracion/usuarios.md`.

**Por qué solo estos 3 roles y no los adicionales mencionados en la Parte B** (Dirección Médica, Gerencia Administrativa y Financiera, Jefatura de TI, RRHH): el enunciado exige "al menos 3 usuarios con roles diferenciados" en SimpleRisk, requisito que estos 3 roles cumplen aplicando separación de funciones (quien carga un riesgo no es quien lo revisa, y solo el Administrador tiene control total). Los roles adicionales que aparecen como "propietario" de cada riesgo en la Parte B son roles organizacionales conceptuales de la clínica ficticia (a quién le correspondería responder por ese riesgo en la vida real), no usuarios técnicos del sistema SimpleRisk, de ahí que no
se haya creado una cuenta para cada uno.

### Primer riesgo de prueba

Se cargó un riesgo de prueba (ID #1001) utilizando el usuario Analista, validando que el flujo completo de alta de riesgos, cálculo de nivel y permisos del rol funcionan correctamente. Documentado en `configuracion/riesgos.md`.

## Parte B: Escenario Real (Clínica Privada)

### Contexto

Se trabajó sobre el escenario propuesto: una clínica privada de 120 empleados que atiende aproximadamente 800 pacientes por día, con historias clínicas digitales, datos de obras sociales y facturación, tras una auditoría externa que identificó debilidades en su gestión de riesgos.

### Activos y riesgos identificados

Se definieron 7 activos críticos de la clínica (historias clínicas, base de datos de facturación, personal, sistema de turnos, backups, equipamiento médico conectado y credenciales de acceso), y a partir de ellos se identificaron 7 riesgos específicos (no genéricos), cada uno con descripción, categoría, activos afectados, probabilidad e impacto justificados, nivel resultante, controles existentes, tratamiento propuesto y propietario organizacional. El detalle completo, junto con el riesgo residual tras aplicar salvaguardas, está en `configuracion/riesgos.md`.

Resumen de niveles: 1 riesgo Crítico (R07 — contraseñas débiles o reutilizadas), 2 Altos (R01 — acceso indebido a historias clínicas; R06 — equipamiento médico IoT como puerta de entrada) y 4 Medios (R02, R03, R04, R05). Los 7 riesgos se cargaron en SimpleRisk (IDs #1002 a #1008), con evidencia en `informe/capturas/`.

### Planes de acción

Se definieron 3 planes de acción para los riesgos de mayor nivel (R01, R06 y R07), cada uno con responsable, presupuesto estimado, fecha de vencimiento y estado inicial `Mitigation Planned` (0%), cargados en SimpleRisk vía Risk Management → Plan Mitigation. Detalle completo en `configuracion/riesgos.md`.

### Reporte ejecutivo

Se elaboró un reporte ejecutivo en PDF (`reporte-ejecutivo/reporte.pdf`), de 2 páginas, dirigido al Directorio de la clínica, con resumen ejecutivo, Top 5 riesgos por nivel, estado de los planes de acción y 5 recomendaciones prioritarias.

## Parte C.1 : Comparación metodológica: SimpleRisk vs. ISO/IEC 27005

### ¿Qué es SimpleRisk?

SimpleRisk es una plataforma de software para gestión de riesgos que implementa una matriz clásica de Probabilidad × Impacto (escala 1-5), calculando automáticamente el nivel de riesgo resultante. No es una metodología con nombre propio, sino una herramienta que aplica una técnica de cálculo genérica, compatible con marcos como ISO 27005 o NIST SP 800-30.

### ¿Qué es ISO/IEC 27005?

La norma ISO 27005 es un estándar internacional que brinda un marco de referencia para la correcta gestión y tratamiento de riesgos de seguridad de la información. A diferencia de una herramienta con fórmula fija, no impone un método de cálculo único: cada organización puede definir su propia escala de probabilidad e impacto, siempre que siga el proceso ordenado que la norma establece. Es, además, la norma que le da el "cómo" a la ISO 27001 (que sí es certificable) para que una organización pueda demostrar una gestión de riesgos formal y documentada.

### Ventajas de SimpleRisk frente a ISO 27005

- Puede utilizarse como soporte operativo de marcos como ISO 27005, ya que viene con todo un entorno y flujo de trabajo preparado (carga de riesgos, cálculo automático de nivel, planes de mitigación, reportes), listo para usar de forma inmediata, sin necesidad de que la organización diseñe su propio proceso documental desde cero.
- Es simple e intuitivo de usar: puede ser operado tanto por un responsable técnico (Jefe de IT) como por personal administrativo, para consultar riesgos y planes de mitigación sin necesitar formación especializada previa.

### Desventajas de SimpleRisk frente a ISO 27005

- Tener una plataforma dedicada exclusivamente a la gestión de riesgos implica un costo de administración adicional (mantenimiento del sistema, otro acceso a gestionar, otro lugar a revisar) en lugar de integrar ese proceso a las herramientas que la empresa ya utiliza en su operación diaria.
- SimpleRisk no exige (ni deja en evidencia) que la organización piense y justifique su propio criterio de valoración de riesgos — simplemente ofrece una escala predefinida. ISO 27005, en cambio, obliga a la empresa a definir y documentar explícitamente sus propios criterios de probabilidad e impacto, lo que genera un análisis más adaptado a su realidad, aunque exige más esfuerzo inicial.

### ¿En qué contexto conviene cada una?

SimpleRisk conviene cuando una organización no tiene el tamaño o los recursos para invertir en una gestión de riesgos especializada y formal, y opta por una herramienta lista para usar, con bajo costo de implementación, que le permite ordenar y priorizar
riesgos rápidamente, como es el caso de la clínica de este TP, que recién comienza a formalizar su gestión de riesgos tras una auditoría externa.

ISO 27005, en cambio, conviene cuando la organización está dispuesta a invertir en construir un proceso de gestión de riesgos completo y documentado (definición de criterios propios, roles, responsables, revisión periódica), generalmente porque busca certificarse en ISO 27001 o porque su tamaño/regulación exige un enfoque más riguroso. Vale aclarar que ambos enfoques no son excluyentes: una organización que adopta ISO 27005 como marco puede perfectamente usar SimpleRisk (u otra herramienta similar) como soporte operativo de ese proceso formal.

### Dato adicional

Vale la pena mencionar que el propio Estado argentino, a través de la Oficina Nacional de Tecnologías de Información (ONTI) y su Disposición 1/2015, no impone una metodología de análisis de riesgos propia para la administración pública: exige que cada organismo diseñe la suya, siempre que sea compatible con ISO 27001/27005. Esto refuerza la idea de que ISO 27005 funciona como un marco de referencia ampliamente adoptado, incluso en contextos donde no existe un desarrollo metodológico local propio.

## Parte C.2: Integración con herramienta externa

### Herramienta elegida: SMTP (correo electrónico)

Se optó por **SMTP** por ser el protocolo de notificación más universal: prácticamente cualquier plataforma de trabajo (Microsoft 365, Google Workspace, Apple, Notion, sistemas de tickets, SIEM) puede recibir o reenviar alertas por correo, lo que hace de esta integración la más portable entre distintos entornos organizacionales, sin atarse a un proveedor específico.

### Objetivo de la integración

Actualmente, un riesgo de nivel Alto o Crítico en SimpleRisk solo se detecta si alguien entra manualmente a revisar el dashboard. La integración busca que la creación de un riesgo de ese nivel dispare automáticamente una notificación por correo al equipo de seguridad de la clínica, reduciendo el tiempo entre la detección y la reacción.

### Arquitectura propuesta

1. Un script (Python, usando la librería `smtplib`) consulta periódicamente los riesgos registrados en SimpleRisk, ya sea mediante su **API REST** (activable en Configure → API Settings) o mediante una consulta directa de solo lectura a la base de datos MySQL que utiliza la aplicación.
2. El script filtra los riesgos con nivel Alto o Crítico que sean nuevos o que hayan cambiado de estado desde la última consulta.
3. Por cada riesgo que cumple esa condición, arma un correo con asunto `[SimpleRisk] Alerta: {nombre del riesgo} - Nivel {nivel}` y el detalle del riesgo en el cuerpo, y lo envía vía SMTP a una casilla del equipo de seguridad.

### Consideraciones de seguridad

- Si se opta por consultar la base de datos directamente, se debe crear un usuario MySQL dedicado con permisos únicamente de `SELECT` (principio de mínimo privilegio), igual criterio aplicado a los roles de usuario de la Parte A.
- Para el entorno de prueba de este Trabajo, se utiliza un servidor SMTP simulado (ver Parte D) en lugar de una cuenta de correo real, evitando exponer credenciales o información personal.

### Valor de la integración

Cierra el circuito entre la identificación del riesgo (SimpleRisk) y su comunicación efectiva al equipo responsable, sin depender de que alguien revise el sistema manualmente, y sin atar la solución a un proveedor de mensajería específico.

## Parte D: Actividad Optativa

### D2. Integración real: alertas por correo (SMTP) via MailHog

Se implementó de forma funcional la integración documentada en la Parte C.2, usando:

- **MailHog** como servidor SMTP simulado (contenedor Docker adicional), para no depender de una cuenta de correo real ni exponer credenciales verdaderas.
- Un usuario MySQL de solo lectura (`alertas_reader`, permisos `SELECT` únicamente) sobre la base `simplerisk_app`, ya que la API REST de SimpleRisk resultó ser una funcionalidad "Extra" no disponible en la licencia open-source utilizada, una limitación real de la herramienta, documentada aquí como hallazgo del proceso.
- Un script en Python (`scripts/alertas_riesgos.py`) que consulta los riesgos con puntaje calculado (`calculated_risk`) mayor o igual a 4.0 (equivalente a Alto/Crítico en la escala normalizada de SimpleRisk), evita reenviar alertas ya notificadas (registro en `scripts/riesgos_notificados.json`), y envía un correo por cada riesgo nuevo que supera el umbral.
- Las credenciales (usuario de base de datos, host SMTP) se gestionan mediante un archivo `.env` no versionado (excluido por `.gitignore`), cargado con `python-dotenv`; el código fuente no contiene ningún valor sensible.

**Resultado de la prueba:** el script detectó correctamente los 3 riesgos de nivel Alto/Crítico (R01, R06 y R07) y las 3 alertas se recibieron en la bandeja de MailHog (evidencia en `informe/capturas/14_mailhog_alertas.png`).

### D4. Propuesta de mejora a SimpleRisk

**Título:** Habilitar notificaciones por webhook/SMTP en la edición Community

**Tipo:** Feature request

**Problema:** La API REST de SimpleRisk (necesaria para integraciones externas automatizadas) está disponible únicamente como "Extra" de pago, lo que obliga a equipos con licencia Community a recurrir a consultas directas a la base de datos para construir integraciones (como se documentó en la Parte C.2 y D2 de este TP), generando una dependencia frágil de la estructura interna de tablas.

**Propuesta:** Incluir en la edición Community un mecanismo básico y de solo lectura para notificaciones (webhook genérico o envío SMTP nativo) que se dispare cuando un riesgo alcance nivel Alto o Crítico, sin requerir la API REST completa.

**Beneficio esperado:** organizaciones pequeñas podrían implementar alertas automáticas sin depender de accesos directos a la base de datos ni de una licencia paga, reduciendo el tiempo de reacción ante riesgos críticos.