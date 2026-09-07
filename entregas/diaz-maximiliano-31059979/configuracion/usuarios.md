# Usuarios y roles de SimpleRisk

## Objetivo

Se configuraron tres usuarios con responsabilidades diferenciadas para representar distintos perfiles dentro de la gestión de riesgos de una organización.

> Las contraseñas no se documentan ni se almacenan en el repositorio.

## Usuarios

| Usuario | Perfil | Función |
|---|---|---|
| admin | Administrador | Administración general de SimpleRisk y gestión integral de riesgos. |
| analista | Analista de riesgos | Identificación, análisis y tratamiento de riesgos. |
| auditor | Auditor | Revisión y seguimiento de riesgos, sin permisos de modificación. |

## Permisos

### Administrador

Cuenta utilizada para administrar la plataforma y realizar tareas de configuración.

- Acceso administrativo a SimpleRisk.
- Gestión de usuarios.
- Gestión de riesgos.
- Configuración de la plataforma.
- Acceso a las funcionalidades necesarias para la administración.

### Analista de riesgos

Perfil orientado a la gestión operativa de riesgos.

- Acceso al menú Risk Management.
- Creación de nuevos riesgos.
- Modificación de información de riesgos.
- Planificación de mitigaciones.
- Revisión de riesgos según su nivel.
- Comentarios y seguimiento de la gestión de riesgos.

### Auditor

Perfil orientado a la revisión independiente.

- Acceso al menú Risk Management.
- Revisión de riesgos insignificantes, bajos, medios, altos y muy altos.
- Posibilidad de realizar comentarios.
- Sin permisos para crear, modificar o cerrar riesgos.
- Sin permisos para administrar proyectos.

## Criterio de seguridad

Las contraseñas utilizadas para las cuentas son únicamente para el entorno local de pruebas y no se incluyen en este documento ni en ningún archivo versionado del repositorio.
