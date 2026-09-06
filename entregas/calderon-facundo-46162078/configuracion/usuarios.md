# Usuarios del Sistema

Se crearon 3 usuarios con roles diferenciados, aplicando el principio de separación de
funciones. Ninguna contraseña real se documenta en este archivo

Usuario: `admin_demo`
Full name: Administrador
Rol: Administrador / Responsable de seguridad
Permisos principales: Acceso total al sistema (Grant Admin)
Justificación: Responsable maximo de la gestión de riesgos y configuración de la herramienta

Usuario: `analista_riesgos`
Full name: Analista de riesgos
Rol: Analista de riesgos
Permisos principales: Submit New Risk, Modify Risk Details, Plan Mitigations, Review Insignificant/Low/Medium Risk, Add Projects
Justificación: Encargado del relevamiento diario de riesgos, no puede cerrar riesgos ni aceptar mitigaciones por si solo

Usuario: `auditor_demo`
Full name: Auditor Interno
Rol: Auditor
Permisos principales: Review (todos los niveles), Compliance: Initiate Audits, Comment Compliance
Justificación: Verifica el cumplimiento y revisa el registro sin capacidad de alterar datos

## Jerarquía (Manager)

- `admin_demo`: sin manager asignado (máximo responsable en el escenario simulado)
- `analista_riesgos`: manager = `admin_demo`
- `auditor_demo`: manager = `admin_demo`

## Configuración adicional aplicada

- **Require password change on login:** habilitado para `analista_riesgos` y `auditor_demo`,
  simulando buena práctica de primer acceso
- **Multi-Factor Authentication:** deshabilitado en este entorno de prueba por simplicidad
  **Nota de mejora:** dado que la clínica maneja datos de salud (categoría especialmente
  protegida), se recomienda habilitar MFA de forma obligatoria en un entorno productivo real
  (ver recomendaciones del Reporte Ejecutivo)
- **Team:** Information Security, asignado a los 3 usuarios
