# Usuarios y Roles — SimpleRisk

Se crearon 3 usuarios con roles diferenciados, además del usuario administrador
inicial generado en el asistente de instalación. Ninguna contraseña real se
documenta en este archivo (política de la consigna, sección 4.1).

## 1. admin_demo — Administrador

- **Rol:** Administrator (acceso total)
- **Equipo(s):** All teams
- **Responsabilidades:** todas ("Check All") — es el único usuario con permisos
  de administración completa sobre Governance, Risk Management, Compliance,
  Asset Management, Assessments y AI.
- **Justificación:** representa al responsable máximo de seguridad de la
  información en la clínica, con potestad para configurar el sistema.

## 2. analyst_demo — Analista de Riesgos

- **Rol:** permisos manuales (sin preset de Administrator)
- **Equipo(s):** Information Security
- **Responsabilidades habilitadas (Risk Management):**
  - Allow Access to "Risk Management" Menu
  - Able to Submit New Risks
  - Able to Modify Risk Details
  - Able to Plan Mitigations
  - Able to Comment Risk Management
- **Responsabilidades NO habilitadas:** todo lo de Governance, Compliance,
  Asset Management (fuera del alcance de este rol), y dentro de Risk
  Management: Close Risks, Accept Mitigations, y las revisiones periódicas
  (esas quedan para el rol de Auditor).
- **Justificación:** el analista es quien identifica y carga riesgos nuevos y
  propone mitigaciones, pero no tiene la última palabra para cerrarlos ni
  aceptarlos — eso requiere una segunda mirada (separación de funciones).

## 3. auditor_demo — Auditor

- **Rol:** permisos manuales
- **Equipo(s):** Information Security
- **Responsabilidades habilitadas:**
  - Risk Management → Allow Access to "Risk Management" Menu
  - Risk Management → Able to Review Insignificant/Low/Medium/High/Very High
    Risks
  - Risk Management → Able to Comment Risk Management
  - Compliance → Allow Access to "Compliance" Menu
  - Compliance → Able to Approve Tests
- **Responsabilidades NO habilitadas:** Submit, Modify o Close Risks — un
  auditor revisa y aprueba, no genera ni edita el contenido que audita.
- **Justificación:** mantiene independencia de criterio respecto de quien
  cargó el riesgo, evitando que la misma persona proponga y apruebe sus
  propios controles.

## Resumen de separación de funciones

| Acción | Admin | Analista | Auditor |
|---|---|---|---|
| Configurar el sistema | Sí | No | No |
| Cargar/editar riesgos | Sí | Sí | No |
| Planificar mitigaciones | Sí | Sí | No |
| Revisar y aprobar | Sí | No | Sí |

Este esquema de permisos diferenciados busca reflejar una separación de
funciones real: quien identifica y trata un riesgo no es la misma persona
que lo audita y aprueba.
