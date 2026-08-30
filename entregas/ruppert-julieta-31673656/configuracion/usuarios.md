# Gestión de Usuarios y Roles

Para cumplir con el principio de separación de funciones y de mínimo privilegio, la configuración inicial consistió en crear primero los roles personalizados dentro del apartado **User Roles** del panel de configuración de SimpleRisk. Una vez definidos los conjuntos de permisos específicos, se procedió a dar de alta a los siguientes usuarios, asignándoles los roles correspondientes.

## 1. Ana Laura - Analista de Riesgos
* **Usuario:** analaura
* **Rol:** Analista de riesgos (Operativo)

**Permisos asignados (User Responsibilities):**
* **Risk Management:**
  * Allow Access to "Risk Management" Menu
  * Able to Submit New Risks
  * Able to Modify Risk Details
  * Able to Plan Mitigations
  * Able to Add Projects / Manage Projects

*(Nota: Se le denegaron intencionalmente los permisos para cerrar riesgos, aceptar mitigaciones o revisar riesgos, así como el acceso a los módulos de Compliance y Governance, dado que su rol es netamente de carga operativa y planificación).*

## 2. Luis Felipe - Auditor
* **Usuario:** luisfelipe
* **Rol:** Auditor (Evaluador / Control)

**Permisos asignados (User Responsibilities):**
* **Risk Management:**
  * Allow Access to "Risk Management" Menu
  * Able to Review Insignificant / Low / Medium / High / Very High Risks
  * Able to Comment Risk Management
* **Compliance:**
  * Allow Access to "Compliance" Menu
  * Able to Initiate Audits
  * Able to Modify Audits
  * Able to Define Tests

*(Nota: Se le denegaron los permisos para cargar o modificar riesgos de forma directa, garantizando así la total independencia de sus revisiones).*

## 3. Julieta Martina - Administrador
* **Usuario:** julietamartina
* **Rol:** Administrator

**Permisos asignados (User Responsibilities):**
* Perfil con acceso total e irrestricto a la plataforma.
* Al ser configurado con el rol de Administrador global, SimpleRisk bloquea la personalización de la matriz de responsabilidades, otorgando por defecto el control completo sobre la gestión de usuarios (User Management), configuración del sistema, Governance, Compliance y Asset Management.