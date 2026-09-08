# Usuarios de SimpleRisk

En esta sección se documentan los tres usuarios creados en SimpleRisk para el desarrollo del trabajo práctico, indicando el rol asignado y los permisos correspondientes.

Por razones de seguridad, **no se incluyen contraseñas ni credenciales de acceso**.

## 1. Administrador

* **Usuario:** `admin`
* **Nombre:** Martín Sosa
* **Rol:** Administrador
* **Permisos:**

  * Acceso total al sistema.
  * Administración general de SimpleRisk.
  * Gestión de usuarios y configuración.
  * Creación, modificación y eliminación de riesgos.
  * Gestión de activos.
  * Creación y seguimiento de planes de mitigación.
  * Acceso a las distintas secciones del sistema.

El acceso administrativo fue otorgado mediante la opción **“Otorgar administrador”** de SimpleRisk.

## 2. Analista de Riesgos

* **Usuario:** `analista.riesgos`
* **Nombre:** Ana López
* **Rol:** Analista de Riesgos
* **Permisos:**

  * Acceso al módulo de Gestión de Riesgos.
  * Creación de nuevos riesgos.
  * Modificación de riesgos existentes.
  * Planificación y seguimiento de mitigaciones.
  * Revisión de riesgos de cualquier nivel.
  * Incorporación de comentarios en los riesgos.
  * Acceso al módulo de Gestión de Activos.

Este usuario fue configurado con permisos suficientes para realizar las tareas habituales de análisis, evaluación y tratamiento de riesgos, sin contar con privilegios de administración general del sistema.

## 3. Auditor

* **Usuario:** `auditor`
* **Nombre:** Carlos Ruiz
* **Rol:** Auditor
* **Permisos:**

  * Acceso de consulta al módulo de Gestión de Riesgos.
  * Revisión de riesgos de cualquier nivel.
  * Incorporación de comentarios.
  * Acceso a Gestión de Activos.
  * Acceso al módulo de Cumplimiento.

### Restricciones

El usuario auditor **no posee permisos para crear, modificar ni eliminar**:

* Riesgos.
* Activos.
* Planes de mitigación.
* Configuraciones del sistema.

El objetivo de este perfil es permitir la revisión y supervisión de la información registrada en SimpleRisk sin otorgar permisos que permitan alterar los datos evaluados.
