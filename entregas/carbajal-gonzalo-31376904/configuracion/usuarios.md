# Usuarios y Permisos — SimpleRisk

> Nunca incluir contraseñas reales en este archivo. Todas las credenciales usadas son
> ficticias y de uso exclusivamente local/demo.

| Usuario | Nombre completo | Rol (SimpleRisk) | Permisos / Alcance |
|---|---|---|---|
| `admin_demo` | Gonzalo Carbajal | Administrator | Acceso total: configuración del sistema, gestión de usuarios y roles, todos los módulos (Governance, Risk Management, Compliance, Asset Management, Reporting). |
| `analista_demo` | Analista Demo | Analista de Riesgos (rol custom) | Alta y modificación de riesgos, planificación y aceptación de mitigaciones, revisión de riesgos en todos los niveles, gestión de proyectos de mitigación, acceso a Asset Management. Sin acceso a configuración del sistema ni a Compliance. |
| `auditor_demo` | Auditor Demo | Auditor (rol custom) | Solo lectura/revisión y comentarios sobre riesgos (sin crear, modificar ni cerrar riesgos). Acceso a Compliance para iniciar/modificar auditorías y aprobar tests. Vista de excepciones en Governance. |

## Roles custom definidos en SimpleRisk

Se crearon dos roles nuevos en *Settings → Role Management* (además del rol
`Administrator` por defecto), siguiendo el principio de mínimo privilegio:

- **Analista de Riesgos:** acceso operativo al módulo de Risk Management (submit,
  modificar, planificar/aceptar mitigaciones, revisar riesgos de todos los niveles,
  gestionar proyectos) y acceso a Asset Management. Sin permisos administrativos.
- **Auditor:** acceso de solo revisión/comentario en Risk Management (sin crear,
  modificar, cerrar riesgos ni planificar mitigaciones) y acceso al módulo Compliance
  (iniciar/modificar auditorías, aprobar tests, comentar) más vista de excepciones en
  Governance. Rol pensado para auditoría externa/interna sin capacidad de alterar el
  registro de riesgos.
