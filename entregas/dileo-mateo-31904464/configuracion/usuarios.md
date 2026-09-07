\# Usuarios y permisos



Para el escenario de la clínica privada se configuraron tres usuarios con responsabilidades diferenciadas. No se incluyen contraseñas ni credenciales de acceso en este documento.



\## Usuarios configurados



| Usuario | Nombre completo | Rol funcional | Permisos principales |

|---|---|---|---|

| `admin\_clinica` | Administrador de Seguridad | Administrador | Administración general de SimpleRisk, configuración y gestión de usuarios. |

| `analista\_riesgos` | Analista de Riesgos | Analista | Registro y modificación de riesgos, planificación de mitigaciones, comentarios y acceso a activos. |

| `auditor\_clinica` | Auditor de Seguridad | Auditor | Consulta y revisión de riesgos de todos los niveles, comentarios y acceso a activos. |



\## Separación de responsabilidades



La distribución de permisos se realizó aplicando el principio de mínimo privilegio:



\- El administrador gestiona la configuración general y las cuentas de usuario.

\- El analista identifica, registra y modifica riesgos, además de proponer planes de mitigación.

\- El auditor revisa los riesgos y registra observaciones, pero no puede crearlos, modificarlos, cerrarlos ni aprobar sus tratamientos.



Esta separación evita que una misma persona pueda registrar, modificar y aprobar individualmente todas las decisiones relacionadas con un riesgo.

