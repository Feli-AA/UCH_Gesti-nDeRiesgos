# Configuración de usuarios y roles

## Objetivo

Se configuraron siete usuarios con responsabilidades diferenciadas para representar una separación adecuada de funciones dentro de la clínica ficticia.

Los permisos fueron asignados aplicando el principio de mínimo privilegio: cada usuario dispone únicamente de los accesos necesarios para cumplir su función.

Todos los nombres, direcciones de correo y datos utilizados pertenecen al escenario ficticio. No se incluyen contraseñas ni credenciales en este documento.

## Usuarios creados

| Nombre              | Usuario                   | Rol                   | Función                                    |
| ------------------- | ------------------------- | --------------------- | ------------------------------------------ |
| Administradora Demo | `admin_demo`              | Administrador         | Administración general de SimpleRisk       |
| Solange Abraham     | `analista_riesgos`        | Analista de Riesgos   | Registro y mantenimiento de riesgos        |
| Ulises Apostolo     | `auditor_riesgos`         | Auditor               | Revisión independiente y auditoría         |
| Olivia Rodrigo      | `responsable_seguridad`   | Propietario de Riesgo | Responsable de Seguridad de la Información |
| Juliana Gattas      | `direccion_medica`        | Propietario de Riesgo | Dirección Médica                           |
| Constanza Romero    | `administracion_finanzas` | Propietario de Riesgo | Gerencia Administrativa y Financiera       |
| Frank Castle        | `responsable_ti`          | Propietario de Riesgo | Jefatura de Infraestructura y TI           |

Las cuentas asociadas a los roles Analista de Riesgos, Auditor y Propietario de Riesgo fueron configuradas con autenticación multifactor y cambio obligatorio de contraseña durante el primer inicio de sesión. No se asignaron equipos.

## Rol Administrador

La cuenta Administradora Demo fue creada durante la instalación inicial de SimpleRisk.

Este rol posee privilegios administrativos para:

* Configurar el sistema.
* Administrar usuarios y roles.
* Gestionar los diferentes módulos de SimpleRisk.
* Supervisar y cerrar riesgos.
* Realizar acciones que requieren autoridad administrativa.

Esta cuenta se reserva para tareas de configuración y decisiones que exceden las responsabilidades de los demás roles.

## Rol Analista de Riesgos

El Analista es responsable de identificar, registrar, valorar y mantener actualizados los riesgos de la organización. También puede proponer medidas de tratamiento, pero no aprobarlas ni cerrar riesgos.

### Permisos asignados

#### Risk Management

* Acceder al menú de gestión de riesgos.
* Registrar nuevos riesgos.
* Modificar los detalles de los riesgos.
* Planificar mitigaciones.
* Comentar sobre los riesgos.
* Crear reportes de riesgos guardados.

#### Asset Management

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

#### Governance

* Acceder al menú de gobierno.
* Consultar las excepciones existentes.

#### Risk Management

* Acceder al menú de gestión de riesgos.
* Revisar riesgos insignificantes.
* Revisar riesgos bajos.
* Revisar riesgos medios.
* Revisar riesgos altos.
* Revisar riesgos muy altos.
* Comentar sobre los riesgos.
* Crear reportes de riesgos guardados.

#### Compliance

* Acceder al menú de cumplimiento.
* Comentar sobre actividades de cumplimiento.
* Iniciar auditorías.
* Modificar auditorías en ejecución.

#### Asset Management

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

## Rol Propietario de Riesgo

El Propietario de Riesgo representa al responsable del área organizacional afectada. Es quien debe conocer y revisar el riesgo asignado, participar en su seguimiento y aceptar formalmente la mitigación propuesta.

### Permisos asignados

#### Risk Management

* Acceder al menú de gestión de riesgos.
* Aceptar mitigaciones.
* Revisar riesgos insignificantes.
* Revisar riesgos bajos.
* Revisar riesgos medios.
* Revisar riesgos altos.
* Revisar riesgos muy altos.
* Comentar sobre los riesgos.

### Restricciones

El Propietario de Riesgo no puede:

* Registrar nuevos riesgos.
* Modificar los detalles de los riesgos.
* Planificar mitigaciones.
* Cerrar riesgos.
* Administrar proyectos o reportes.
* Acceder a los módulos Governance, Compliance, Asset Management, Assessments o Artificial Intelligence.
* Administrar usuarios, roles o configuraciones.
* Obtener privilegios administrativos.

De esta manera, el propietario puede participar en las decisiones relacionadas con los riesgos de su área sin modificar su valoración ni administrar la plataforma.

## Criterio de separación de funciones

La distribución de responsabilidades implementada es la siguiente:

* El **Analista de Riesgos** identifica, registra, modifica y propone tratamientos.
* El **Propietario de Riesgo** representa al área responsable, revisa el riesgo y acepta la mitigación propuesta.
* El **Auditor** realiza revisiones independientes y registra observaciones sin modificar el riesgo.
* El **Administrador** configura el sistema, administra los accesos y realiza las acciones de mayor autoridad.

Esta separación reduce la posibilidad de que un único usuario controle todo el ciclo de vida de un riesgo y permite mantener trazabilidad sobre las acciones realizadas.
Aunque el Auditor y el Propietario de Riesgo poseen permisos para realizar revisiones, su finalidad es diferente. El Propietario revisa los riesgos correspondientes a su área para participar en el seguimiento y aceptar la mitigación propuesta. El Auditor realiza una revisión independiente orientada a verificar la correcta valoración, el cumplimiento de los controles y la trazabilidad del proceso, sin aceptar mitigaciones ni modificar los riesgos.

## Evidencias

Las capturas correspondientes se encuentran en el directorio `informe/capturas/`:

* `02_rol_analista.png`: permisos asignados al rol Analista de Riesgos.
* `03_rol_auditor.png`: permisos asignados al rol Auditor.
* `06_rol_propietario.png`: permisos asignados al rol Propietario de Riesgo.
