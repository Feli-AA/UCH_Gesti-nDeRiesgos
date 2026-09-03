# Gestión de Usuarios y Control de Acceso

Para mantener la segregación de funciones dentro de la clínica, se crearon los siguientes perfiles en SimpleRisk:

**1. Usuario Administrador**
* **Username:** admin (o el nombre que hayas elegido en la instalación)
* **Rol:** System Administrator
* **Permisos:** Acceso total y control absoluto sobre la configuración de la plataforma SimpleRisk.

**2. Usuario Analista**
* **Username:** analista_riesgos
* **Rol:** Analista de Riesgos (Rol personalizado)
* **Permisos:** Acceso a los módulos "Risk Management" y "Asset Management". Privilegios completos para la carga, edición y seguimiento de riesgos y mitigaciones. Sin acceso a la configuración troncal del sistema.

**3. Usuario Auditor**
* **Username:** auditor_externo
* **Rol:** Auditor Externo (Rol personalizado)
* **Permisos:** Acceso estricto de solo lectura a "Risk Management" y "Compliance". Permite visualizar la matriz de riesgos y los controles existentes sin capacidad de alteración de datos ni creación de planes de mitigación.

> **Nota de seguridad:** Las contraseñas de estos usuarios han sido omitidas de este documento cumpliendo con las políticas de seguridad.
