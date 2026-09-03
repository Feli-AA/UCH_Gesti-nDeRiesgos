# Informe — TP Gestión de Riesgos con SimpleRisk

**Alumno:** Lautaro Fiochetta — LU 44309650
**Materia:** Seguridad de Sistemas — Licenciatura en Ciencias de la Computación, 4to año
**Escenario:** Responsable de seguridad de una clínica privada de 120 empleados, 800 pacientes/día, con historias clínicas digitales, datos de obras sociales y facturación.

---

## Parte A — Instalación y Configuración Básica

### A.1 Instalación reproducible

SimpleRisk se despliega localmente con Docker Compose, usando la imagen oficial `simplerisk/simplerisk-minimal` (mantenida por el equipo de SimpleRisk) junto a un contenedor de MySQL 8.0 y un contenedor SMTP para el envío de notificaciones internas de la propia herramienta.

Archivos relevantes: `entorno/docker-compose.yml` y `entorno/setup.sh`. El proceso completo (levantar el stack, esperar a que el servicio responda, e indicar la URL de acceso) queda automatizado en `setup.sh`, y los pasos manuales equivalentes están documentados en el `README.md` de esta entrega.

No se usó la imagen `simplerisk` completa (que trae LAMP + MySQL embebidos en un solo contenedor) para poder separar la base de datos como servicio independiente, lo que se acerca más a un despliegue real y facilita la persistencia de datos vía volúmenes nombrados (`simplerisk_data`, `mysql_data`).

### A.2 Usuarios y permisos

Se crearon 3 usuarios con roles diferenciados, siguiendo el principio de menor privilegio y separación de funciones. El detalle completo (rol, permisos exactos por módulo, y la justificación de cada uno) está documentado en `configuracion/usuarios.md`:

| Usuario | Rol | Resumen de permisos |
|---|---|---|
| `Lauta02` | Administrador | Acceso completo a todos los módulos (Governance, Risk Management, Compliance, Asset Management, Assessments, AI) |
| `analista_riesgos` | Analista de Riesgos | Alta/edición de riesgos de nivel bajo/medio, planes de mitigación, gestión de proyectos — sin cerrar riesgos ni tocar riesgos altos |
| `Auditor_demo` | Auditor | Revisión y aprobación de riesgos altos/muy altos, visualización de Governance/Compliance — sin permiso de creación/edición |

Ninguna contraseña se documenta en el repositorio, conforme a la regla inquebrantable del enunciado (sección 4.1).

### A.3 Primer riesgo (prueba de validación)

Antes de cargar el registro real de riesgos de la clínica, se creó un riesgo de prueba ("Riesgo de prueba — validación de instalación", categoría genérica, probabilidad/impacto mínimos) únicamente para confirmar que el flujo completo de SimpleRisk funcionaba correctamente de punta a punta: alta de riesgo → cálculo automático del nivel de riesgo → visualización en el dashboard. Una vez validado, este riesgo de prueba se eliminó del sistema para no ensuciar el registro real, que se documenta en la Parte B.

---

## Parte B — Escenario Real

### B.1 Registro de riesgos

Se identificaron **9 riesgos específicos** del contexto de la clínica (más de los 7 mínimos requeridos), cubriendo las categorías de confidencialidad, integridad, disponibilidad, legal/cumplimiento y operativo. El detalle completo de cada riesgo — descripción, activos afectados, probabilidad e impacto justificados, nivel resultante, controles existentes, plan de tratamiento y propietario — está en `configuracion/riesgos.md`.

Resumen (ordenado por score Probabilidad × Impacto):

| # | Riesgo | Categoría | P × I | Nivel |
|---|---|---|---|---|
| 1 | Acceso no autorizado a historia clínica | Confidencialidad | 4×5 = 20 | Muy alto |
| 8 | Phishing a personal administrativo | Operativo | 5×4 = 20 | Muy alto |
| 4 | Disponibilidad de datos — caída temporal del sistema | Disponibilidad | 4×4 = 16 | Alto |
| 2 | Integridad de datos en historia clínica | Integridad | 3×5 = 15 | Alto/Muy alto |
| 3 | Pérdida de datos permanente | Integridad/Disponibilidad | 3×5 = 15 | Alto/Muy alto |
| 6 | Filtración de datos de pagos | Confidencialidad | 3×5 = 15 | Alto/Muy alto |
| 5 | Destrucción insegura de información | Legal/Cumplimiento | 3×4 = 12 | Alto |
| 9 | Robo o pérdida física de dispositivo | Operativo/Físico | 3×4 = 12 | Alto |
| 7 | Accesos no dados de baja de ex-empleados | Operativo | 4×3 = 12 | Alto |

Las probabilidades se justificaron con una combinación de datos del propio contexto organizacional (120 empleados, 800 pacientes/día, ausencia de controles previos según la auditoría externa) y referencias externas — en particular el Verizon Data Breach Investigations Report para fundamentar que el phishing es el vector de ataque inicial más común, y que el sector salud es uno de los más atacados.

### B.2 Planes de acción

Se definieron 3 planes de acción para los 3 riesgos de mayor nivel (score más alto):

**Plan 1 — Control de acceso basado en roles (RBAC) + logging de accesos**
- Riesgo asociado: Riesgo 1 — Acceso no autorizado a historia clínica
- Descripción: implementar control de acceso granular por rol en el sistema de Historia Clínica Electrónica, con registro (log) inmutable de cada acceso a datos de pacientes y revisión mensual de dichos logs por el Responsable de Seguridad.
- Fecha de vencimiento: 30/11/2026
- Responsable: Jefe de Sistemas
- Presupuesto estimado: USD 3.500
- Estado inicial: No iniciado

**Plan 2 — Programa de concientización anti-phishing + MFA**
- Riesgo asociado: Riesgo 8 — Phishing a personal administrativo
- Descripción: capacitación obligatoria en concientización de seguridad para todo el personal administrativo, sumado a la implementación de autenticación multifactor (MFA) en el correo institucional y en el acceso al sistema HCE.
- Fecha de vencimiento: 31/10/2026
- Responsable: RRHH / Jefe de Sistemas
- Presupuesto estimado: USD 1.200
- Estado inicial: No iniciado

**Plan 3 — Generador eléctrico de respaldo**
- Riesgo asociado: Riesgo 4 — Disponibilidad de datos — caída temporal del sistema
- Descripción: adquisición e instalación de un generador eléctrico de respaldo, más la redacción de un protocolo de contingencia manual para continuidad asistencial durante cortes prolongados.
- Fecha de vencimiento: 15/12/2026
- Responsable: Jefe de Sistemas
- Presupuesto estimado: USD 8.000
- Estado inicial: No iniciado

Estos 3 planes se cargaron en SimpleRisk asociados a sus respectivos riesgos, en el módulo de Risk Management → Mitigations/Action Plans.

### B.3 Reporte ejecutivo

El reporte ejecutivo en PDF dirigido al directorio de la clínica está en `reporte-ejecutivo/reporte.pdf` (máximo 3 páginas), con resumen ejecutivo, top 5 riesgos por nivel, estado de los planes de acción y recomendaciones prioritarias.

---

## Parte C — Análisis Crítico y Profundización

### C.1 Comparación metodológica: SimpleRisk (matriz clásica) vs. FAIR

SimpleRisk utiliza, por defecto, una **matriz clásica de Probabilidad × Impacto** en escala ordinal (1 a 5 en este TP), donde el nivel de riesgo resultante es el producto de dos valores cualitativos asignados por el analista. Es el enfoque que se usó en todo este trabajo.

**FAIR (Factor Analysis of Information Risk)**, en cambio, es una metodología **cuantitativa**: en lugar de asignar directamente "probabilidad" e "impacto" en una escala del 1 al 5, descompone el riesgo en factores medibles — Frecuencia de Eventos de Pérdida (Loss Event Frequency) e Magnitud de Pérdida (Loss Magnitude) — y estos, a su vez, se descomponen en sub-factores (frecuencia de contacto con la amenaza, probabilidad de acción, fortaleza del control vs. capacidad del atacante, pérdida primaria y secundaria en términos monetarios). El resultado final es una distribución de pérdida económica probable (por ejemplo, expresada como un rango de dólares por año), típicamente calculada con simulaciones tipo Monte Carlo.

**Ventajas de SimpleRisk (matriz clásica) frente a FAIR:**
- Mucho más rápido de aplicar: no requiere estimar variables financieras difíciles de justificar (costo de una filtración de datos de salud, por ejemplo).
- Más accesible para equipos sin formación actuarial o financiera — cualquier analista de riesgos puede completarla con criterio cualitativo razonado.
- Suficiente para comunicar prioridades relativas ("qué atender primero") sin necesitar precisión numérica absoluta.

**Desventajas de SimpleRisk frente a FAIR:**
- La escala ordinal 1-5 es subjetiva y poco defendible ante un directorio que pide justificar presupuesto: dos analistas distintos pueden calificar el mismo riesgo de forma diferente.
- El producto Probabilidad × Impacto no es una operación matemáticamente correcta sobre escalas ordinales (mezclar "4" y "5" como si fueran cantidades continuas es un supuesto fuerte).
- No permite responder preguntas como "¿cuánto deberíamos invertir en mitigar este riesgo?" con una cifra defendible, algo que FAIR sí permite al expresar el riesgo en términos monetarios comparables directamente con el costo de los controles.

**¿En qué contexto conviene cada una?**
- SimpleRisk/matriz clásica es preferible en organizaciones chicas o medianas (como la clínica de este TP) que recién están armando su primer registro de riesgos, sin madurez de datos históricos de pérdidas ni presupuesto para un analista cuantitativo dedicado. Es exactamente el caso de este escenario.
- FAIR conviene en organizaciones más grandes o reguladas (bancos, aseguradoras, empresas que ya sufrieron incidentes y tienen datos históricos de pérdidas) donde las decisiones de inversión en seguridad se presentan directamente al comité financiero y necesitan traducirse a moneda para competir con otras líneas de inversión del negocio.

### C.2 Integración con herramienta externa: Slack (Incoming Webhooks)

**Opción evaluada primero — API REST de SimpleRisk:** la vía "oficial" para integrar SimpleRisk con sistemas externos es su API REST, documentada en `simplerisk.com/documentation`. Sin embargo, esa API es una funcionalidad de las ediciones pagas (Pro/Enterprise) y **no está disponible en la versión Community (gratuita)** usada en este TP, por lo que no se pudo usar como vía de integración real.

**Alternativa implementada — Incoming Webhooks de Slack:** como alternativa funcional, se implementó una notificación automática hacia un canal de Slack (`#alertas-riesgos`) usando un **Incoming Webhook**, que es la forma más simple que ofrece Slack para recibir mensajes desde una aplicación externa sin necesidad de una app completa ni de autenticación OAuth.

El flujo implementado es:

1. Se creó un Incoming Webhook en la app de Slack del workspace, apuntado al canal `#alertas-riesgos`.
2. La URL del webhook se guarda **únicamente** en la variable de entorno `WEBHOOK_URL` (archivo `.env`, explícitamente excluido del repositorio vía `.gitignore`), nunca hardcodeada en el script ni commiteada.
3. El script `scripts/notificar-riesgos.ps1` (PowerShell) lee esa variable de entorno, arma un mensaje formateado por cada uno de los riesgos de mayor nivel (los 3 definidos en la sección B.2) y hace un `POST` HTTP con el payload JSON esperado por Slack (`{"text": "..."}`) contra la URL del webhook.
4. Cada mensaje incluye: nombre del riesgo, categoría, cálculo de Probabilidad × Impacto, propietario y plan de tratamiento resumido — toda información no sensible, apta para verse en un canal de equipo.

La evidencia de funcionamiento (mensajes reales llegando al canal `#alertas-riesgos`) está documentada como captura de pantalla en `informe/capturas/` (ver también Parte D).

**Nota de seguridad:** el webhook de Slack, aunque no es una "contraseña" en sentido estricto, funciona como una credencial (cualquiera que lo tenga puede postear en el canal). Por eso se mantuvo exclusivamente en `.env` (gitignoreado) y se rotó luego de las pruebas, ya que durante el desarrollo estuvo expuesto en texto plano en herramientas de asistencia (más detalle en la sección de Decisiones de diseño del README).

Esta integración corresponde también a la actividad optativa **D2** de la Parte D (ver más abajo), sumando puntos extra por ser una implementación real y no solo documentada.

---

## Parte D — Actividad Optativa

**D2 — Implementación de una integración real:** desarrollada íntegramente en la sección C.2 de este informe: webhook funcional de Slack que notifica los riesgos de nivel alto/muy alto del registro, con el script `scripts/notificar-riesgos.ps1` y la evidencia en `informe/capturas/`.
