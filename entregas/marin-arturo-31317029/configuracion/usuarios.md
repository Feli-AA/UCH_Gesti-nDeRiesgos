# Usuarios y Permisos — SimpleRisk

| Username | Nombre completo | Rol | Permisos asignados |
|---|---|---|---|
| `admin_demo` | Arturo Marin | Administrator | Acceso total (creado durante el setup inicial de SimpleRisk) |
| `analista_riesgos` | Ana Torres | Analista de Riesgos | Risk Management: acceso al menú, alta de riesgos, modificación de detalles, planificación de mitigaciones, comentarios, gestión de proyectos |
| `auditor_demo` | Carlos Gómez | Auditor | Governance: acceso al menú, ver excepciones. Risk Management: acceso al menú, comentar, revisar riesgos altos/muy altos. Compliance: acceso al menú, iniciar auditorías, aprobar tests |

## Criterio de diseño

SimpleRisk (en esta versión) diferencia roles vía el checklist granular de "User Responsibilities", no vía el dropdown "Role" (que solo distingue Administrator de usuario común). Se aplicó el principio de mínimo privilegio:

- **Analista de Riesgos**: puede cargar y gestionar riesgos, pero no cerrarlos, aprobarlos ni borrarlos.
- **Auditor**: solo lectura/revisión y aprobación de controles/tests, sin capacidad de crear o modificar riesgos.

Ninguna contraseña real se documenta aquí. Las contraseñas usadas son ficticias (`Passw0rd!Demo`), consistentes con la política de la cátedra.
