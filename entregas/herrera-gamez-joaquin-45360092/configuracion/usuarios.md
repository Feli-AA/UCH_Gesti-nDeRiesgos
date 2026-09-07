# Usuarios

## Objetivo
Se crearon 3 usuarios con roles diferenciados aplicando el principio de mínimo privilegio y
separación de funciones. Cada rol representa una etapa distinta del ciclo de vida de un
riesgo (configurar el sistema, cargarlo y darle seguimiento, o revisarlo de forma
independiente), evitando que una sola persona controle todo el proceso sin control cruzado.
Ninguna contraseña real se documenta en este archivo; todas son ficticias y exclusivas de
este entorno de prueba.

## Usuarios creados

| Usuario   | Nombre completo | Rol                  | Manager |
|-----------|------------------|----------------------|---------|
| admin     | Admin Demo       | Administrador        | —  |
| analista  | Analista Demo    | Analista de Riesgos  | admin   |
| auditor   | Auditor Demo     | Auditor              | admin   |



## Rol Administrador
Permisos: Control total del sistema (usuario creado durante la instalación).
Justificación: Se reserva para tareas de configuración de la plataforma y decisiones que
exceden las responsabilidades de los demás roles (crear/eliminar usuarios, cambiar
configuración general, etc). No se usa para la operación diaria de carga o revisión de riesgos,
para mantener trazabilidad de quién hizo qué.

## Rol Analista de Riesgos
Permisos asignados: Submit New Risks, Modify Risk Details, Plan Mitigations.
Puede: Cargar riesgos nuevos, modificar sus detalles y planificar cómo mitigarlos.
No puede: cerrar riesgos, aceptar mitigaciones formalmente, ni revisar/aprobar lo que él
mismo cargó.
Justificación: Identifica y documenta los riesgos día a día, pero no tiene
autoridad para darlos por resueltos evitando que
la misma persona que registra un riesgo también lo cierre sin control externo o sin revision del equipo.

## Rol Auditor
Permisos asignados: Review Insignificant/Low/Medium/High/Very High Risks, Approve Tests
(Compliance).
Puede: Revisar riesgos de todos los niveles de severidad y aprobar tests de cumplimiento.
No puede: cargar, modificar ni cerrar riesgos, ni planificar mitigaciones.
Justificación: Controla de forma independiente lo que otros cargaron, no
generar contenido propio. Su revisión es objetiva
y no esté influenciada por haber participado en la carga original del riesgo.

## Criterio de separación de funciones
Esta distribución asegura que ninguna persona controle todo el ciclo de vida de un riesgo
por sí sola: el Analista identifica y propone, el Auditor controla de forma independiente, y
el Administrador gestiona el sistema sin intervenir en el contenido operativo.

## Evidencias
Capturas en `informe/capturas/`:
- `01_lista_usuarios.png`: lista de los 3 usuarios creados con sus roles.
- `02_permisos_analista.png`: permisos asignados al rol Analista.
- `03_permisos_auditor.png`: permisos asignados al rol Auditor.