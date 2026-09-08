# Configuración de Usuarios

## Objetivo

Se crearon tres usuarios con funciones diferenciadas dentro de SimpleRisk con el objetivo de
aplicar separación de responsabilidades y principio de mínimo privilegio.

No se incluyen contraseñas en este documento ni en el repositorio.



## 1. Administrador

**Usuario:** `admin_demo`

**Nombre:** Administrador SimpleRisk

**Rol funcional:** Administrador

**Descripción:**

Usuario encargado de la configuración general de SimpleRisk y de la administración del entorno.

**Permisos principales:**

- Administración general de la aplicación.
- Creación y gestión de usuarios.
- Configuración de roles y permisos.
- Acceso completo a los módulos de gestión de riesgos.
- Creación, modificación y cierre de riesgos.
- Gestión de planes de mitigación.
- Acceso a configuración y administración del sistema.

**Justificación:**

Este usuario requiere permisos elevados debido a que es responsable de administrar la herramienta
y su configuración.



## 2. Analista de Riesgos

**Usuario:** `analista_riesgos`

**Nombre:** Analista de Riesgos

**Rol funcional:** Analista de Riesgos

**Descripción:**

Usuario responsable de registrar, evaluar y realizar el seguimiento de los riesgos identificados
en la organización.

**Permisos configurados en Risk Management:**

- Acceso al menú de Gestión de Riesgos.
- Crear nuevos riesgos.
- Modificar los detalles de los riesgos.
- Planificar mitigaciones.
- Revisar riesgos de nivel bajo.
- Revisar riesgos de nivel medio.
- Revisar riesgos de nivel alto.
- Revisar riesgos de nivel muy alto.
- Agregar comentarios a los riesgos.

**Permisos no asignados:**

- Cerrar riesgos.
- Aceptar mitigaciones.
- Crear, eliminar o administrar proyectos.
- Eliminar reportes de riesgo.
- Acceso administrativo general.

**Justificación:**

El analista puede identificar, evaluar y proponer tratamientos para los riesgos, pero no posee
permisos administrativos ni capacidad para cerrar riesgos o aprobar sus propias mitigaciones.

Esto permite aplicar segregación de funciones.



## 3. Auditor

**Usuario:** `auditor_demo`

**Nombre:** Auditor de Riesgos

**Rol funcional:** Auditor

**Descripción:**

Usuario destinado a realizar tareas de revisión y seguimiento de los riesgos sin modificar su
contenido.

**Permisos configurados en Risk Management:**

- Acceso al menú de Gestión de Riesgos.
- Revisar riesgos de nivel bajo.
- Revisar riesgos de nivel medio.
- Revisar riesgos de nivel alto.
- Revisar riesgos de nivel muy alto.
- Agregar comentarios a los riesgos.

**Permisos no asignados:**

- Crear nuevos riesgos.
- Modificar riesgos existentes.
- Cerrar riesgos.
- Planificar mitigaciones.
- Aceptar mitigaciones.
- Crear, eliminar o administrar proyectos.
- Acceso administrativo.

**Justificación:**

El auditor debe poder consultar y revisar la información sin modificar el registro de riesgos.
De esta manera se mantiene independencia entre quien administra o analiza los riesgos y quien
los revisa.


# Resumen de Roles

| Usuario            | Rol                 | Función principal                                    |
| `admin_demo`       | Administrador       | Configuración y administración general de SimpleRisk |
| `analista_riesgos` | Analista de Riesgos | Registrar, analizar y planificar mitigaciones        |
| `auditor_demo`     | Auditor             | Revisar y comentar riesgos sin modificarlos          |


# Principios aplicados

## Mínimo privilegio

Cada usuario recibió únicamente los permisos necesarios para cumplir su función.

## Segregación de funciones

Se separaron las tareas de administración, análisis y auditoría para evitar que un único usuario
controle todo el ciclo de gestión de riesgos.

## Manejo de credenciales

Las contraseñas utilizadas durante la configuración no se documentan ni se almacenan en el
repositorio.

## Evidencia

Las siguientes capturas muestran la configuración de usuarios y permisos realizada en SimpleRisk.

| Evidencia | Archivo |
|---|---|
| Creación y configuración del usuario administrador | [`usuario_admin.png`](../informe/capturas/usuario_admin.png) |
| Permisos configurados para el Analista de Riesgos | [`usuario_analista_permisos.png`](../informe/capturas/usuario_analista_permisos.png) |
| Creación correcta del Analista de Riesgos | [`usuario_analista_creado.png`](../informe/capturas/usuario_analista_creado.png) |
| Permisos configurados para el Auditor | [`usuario_auditor_permisos.png`](../informe/capturas/usuario_auditor_permisos.png) |
| Creación correcta del Auditor | [`usuario_auditor_creado.png`](../informe/capturas/usuario_auditor_creado.png) |

Las capturas se encuentran almacenadas en:

`informe/capturas/`

