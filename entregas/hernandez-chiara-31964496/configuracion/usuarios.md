# Configuración de usuarios y roles

## Objetivo

Se configuraron tres usuarios con responsabilidades diferenciadas para representar una separación adecuada de funciones dentro de la clínica ficticia.

Los permisos fueron asignados aplicando el principio de mínimo privilegio: cada usuario dispone únicamente de los accesos necesarios para cumplir su función.

No se incluyen contraseñas ni credenciales en este documento.

## Usuarios creados

| Nombre              | Usuario            | Rol                 |
| ------------------- | ------------------ | ------------------- |
| Administradora Demo | `admin_demo`       | Administrador       |
| Solange Abraham     | `analista_riesgos` | Analista de Riesgos |
| Ulises Apostolo     | `auditor_riesgos`  | Auditor             |

Los usuarios Analista y Auditor fueron configurados con autenticación multifactor y cambio obligatorio de contraseña en el primer inicio de sesión. No se asignaron equipos.

## Rol Administrador

La cuenta Administradora Demo fue creada durante la instalación inicial de SimpleRisk.

Este rol posee privilegios administrativos para:

* Configurar el sistema.
* Administrar usuarios y roles.
* Gestionar los diferentes módulos de SimpleRisk.
* Supervisar, aceptar y cerrar riesgos.
* Realizar acciones que requieren autoridad administrativa.

Esta cuenta se reserva para tareas de configuración y decisiones que exceden las responsabilidades del Analista y del Auditor.

## Rol Analista de Riesgos

El Analista es responsable de identificar, registrar, valorar y mantener actualizados los riesgos de la organización. También puede proponer medidas de tratamiento, pero no aprobarlas ni cerrar riesgos.

### Permisos asignados

**Risk Management**

* Acceder al menú de gestión de riesgos.
* Registrar nuevos riesgos.
* Modificar los detalles de los riesgos.
* Planificar mitigaciones.
* Comentar sobre los riesgos.
* Crear reportes de riesgos guardados.

**Asset Management**

* Acceder al menú de gestión de activos para consultar los activos relacionados con los riesgos.

### Restricciones

El Analista no puede:

* Aceptar mitigaciones.
* Cerrar riesgos.
* Revisar formalmente riesgos.
* Eliminar proyectos o reportes.
* Administrar usuarios o configuraciones.
* Acceder a funciones de auditoría o cumplimiento.

Estas restricciones evitan que la misma persona que registra y modifica un riesgo también lo revise, apruebe, cierre o acepte formalmente.

## Rol Auditor

El Auditor es responsable de revisar de manera independiente los riesgos y verificar el cumplimiento de los controles establecidos. Puede registrar observaciones y avances de auditoría, pero no modificar los riesgos evaluados.

### Permisos asignados

**Governance**

* Acceder al menú de gobierno.
* Consultar las excepciones existentes.

**Risk Management**

* Acceder al menú de gestión de riesgos.
* Revisar riesgos insignificantes.
* Revisar riesgos bajos.
* Revisar riesgos medios.
* Revisar riesgos altos.
* Revisar riesgos muy altos.
* Comentar sobre los riesgos.
* Crear reportes de riesgos guardados.

**Compliance**

* Acceder al menú de cumplimiento.
* Comentar sobre actividades de cumplimiento.
* Iniciar auditorías.
* Modificar auditorías en ejecución.

**Asset Management**

* Acceder al menú de gestión de activos para consultar los activos involucrados en las revisiones.

### Restricciones

El Auditor no puede:

* Registrar o modificar riesgos.
* Planificar o aceptar mitigaciones.
* Cerrar riesgos.
* Crear, modificar o eliminar marcos y controles.
* Crear o aprobar excepciones.
* Eliminar o reabrir auditorías.
* Aprobar pruebas de cumplimiento.
* Administrar usuarios o configuraciones.

De esta manera, conserva independencia respecto del Analista y no puede alterar directamente la información que debe revisar.

## Criterio de separación de funciones

La distribución de responsabilidades implementada es la siguiente:

* El **Analista de Riesgos** registra, modifica y propone tratamientos.
* El **Auditor** revisa los riesgos y deja observaciones independientes.
* El **Administrador** configura el sistema y realiza acciones que requieren mayor autoridad, como aceptar mitigaciones o cerrar riesgos.

Esta separación reduce la posibilidad de que un único usuario controle todo el ciclo de vida de un riesgo y permite mantener mayor trazabilidad sobre las acciones realizadas.

## Evidencias

Las capturas correspondientes se encuentran en el directorio `informe/capturas/`:

* `02_rol_analista.png`: permisos asignados al rol Analista de Riesgos.
* `03_rol_auditor.png`: permisos asignados al rol Auditor.
* `04_usuarios_creados.png`: listado evidencia de los tres usuarios configurados.
