# Registro de Usuarios y Permisos

A continuación se detallan los usuarios creados en el sistema SimpleRisk para la gestión de la clínica, cumpliendo con el principio de separación de roles. No se incluyen credenciales por motivos de seguridad.

| Usuario | Rol Asignado | Nivel de Permisos / Justificación |
| :--- | :--- | :--- |
| `admin_clinica` | Administrator | Control total del sistema. Encargado de la configuración general y altas/bajas. |
| `analista_sistemas` | Risk User / Analyst | Capacidad para cargar, evaluar y proponer mitigaciones para los riesgos de la clínica. (Permisos customizados en responsabilidades). |
| `auditor_ext` | Reader / Auditor | Permisos de solo lectura para revisar el estado de los riesgos sin capacidad de modificación. (Permisos customizados en responsabilidades). |