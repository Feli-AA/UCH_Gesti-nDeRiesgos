## Parte C.1 — Comparación metodológica: SimpleRisk vs. ISO/IEC 27005

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

## Parte C.2 — Integración con herramienta externa

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