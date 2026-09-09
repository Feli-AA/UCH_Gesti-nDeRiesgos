# Usuarios configurados en SimpleRisk

## Usuarios

| Usuario | Rol | Función | Nivel de acceso |
|---|---|---|---|
| `admin` | Administrator | Administración general y configuración de SimpleRisk. | Administración completa |
| `analista.riesgos` | Risk Manager | Gestión, análisis, tratamiento y seguimiento de riesgos. | Gestión de riesgos |
| `auditor` | Risk Reviewer | Revisión y control de los riesgos. | Revisión de riesgos |

## Principio de mínimo privilegio

La asignación de roles sigue el principio de mínimo privilegio: cada usuario dispone solamente del nivel de acceso necesario para cumplir su función. De esta manera, se limita la exposición ante errores, uso indebido o compromiso de una cuenta.

La separación entre administración, gestión y revisión también facilita la trazabilidad y el control de las actividades realizadas dentro de SimpleRisk.

**NO se incluyen contraseñas en este archivo ni en el repositorio por motivos de seguridad.**

Tampoco se incluyen tokens, claves API, Webhooks reales ni otros secretos o credenciales.
