# Usuarios y permisos configurados en SimpleRisk

Documentación de las cuentas creadas en la instancia de SimpleRisk y de los
permisos asignados a cada una, correspondiente al punto 2 de la Parte A del
trabajo práctico.

> **Nota sobre credenciales.** Todas las cuentas utilizan datos ficticios. El
> dominio `clinica-demo.local` corresponde a un TLD reservado que no resuelve en
> internet, por lo que las direcciones no pertenecen a ninguna persona real.
> **Las contraseñas no se incluyen en este repositorio ni en ningún archivo
> versionado**, conforme a las consideraciones de seguridad de la consigna.

## 1. Cuentas creadas

| Usuario | Nombre completo | Rol funcional | Cambio de contraseña obligatorio |
|---|---|---|---|
| `admin_demotp` | Administrador Demo | Administrador técnico de la herramienta | No (cuenta inicial del instalador) |
| `analista_demo` | Analista de Riesgos Demo | Identificación y evaluación de riesgos | Sí |
| `auditor_demo` | Auditor Interno Demo | Revisión independiente, solo lectura | Sí |
| `responsable_demo` | Responsable de Tratamiento Demo | Aprobación y cierre de riesgos | Sí |

En las tres cuentas creadas manualmente se activó la opción **Require password
change on login**, de modo que la contraseña establecida durante el alta debe ser
reemplazada por el usuario en su primer acceso. Esto evita que la credencial
inicial, conocida por quien creó la cuenta, permanezca vigente.

## 2. Permisos asignados

### admin_demo — Administrador técnico

Cuenta creada por el instalador de SimpleRisk durante el primer acceso a la
aplicación. Posee privilegios administrativos completos sobre la instancia.

Su uso se limita a la administración de la herramienta —alta de usuarios,
configuración del sistema— y no participa del circuito funcional de gestión de
riesgos.

### analista_demo — Analista de riesgos

| Sección | Permisos otorgados |
|---|---|
| Risk Management | Allow Access to "Risk Management" Menu |
| Risk Management | Able to Submit New Risks |
| Risk Management | Able to Modify Risk Details |
| Risk Management | Able to Plan Mitigations |
| Risk Management | Able to Comment Risk Management |

Puede registrar riesgos, editar su valoración y proponer planes de mitigación.
**No** posee los permisos `Able to Accept Mitigations` ni `Able to Close Risks`,
de manera que no puede aprobar ni dar por cerrado su propio análisis.

### auditor_demo — Auditor interno

| Sección | Permisos otorgados |
|---|---|
| Risk Management | Allow Access to "Risk Management" Menu |
| Risk Management | Able to Comment Risk Management |
| Governance | Allow Access to "Governance" Menu |
| Governance | Able to View Exceptions |
| Compliance | Allow Access to "Compliance" Menu |
| Compliance | Able to Comment Compliance |

Acceso de solo lectura sobre los módulos de riesgos, gobernanza y cumplimiento,
con capacidad de dejar observaciones mediante comentarios. No tiene otorgado
ningún permiso de alta, modificación o eliminación en ninguna sección de la
aplicación.

### responsable_demo — Responsable de tratamiento

| Sección | Permisos otorgados |
|---|---|
| Risk Management | Allow Access to "Risk Management" Menu |
| Risk Management | Able to Accept Mitigations |
| Risk Management | Able to Close Risks |
| Risk Management | Able to Review Medium Risks |
| Risk Management | Able to Review High Risks |
| Risk Management | Able to Review Very High Risks |
| Risk Management | Able to Comment Risk Management |

Puede revisar los riesgos según su nivel, aprobar los planes de mitigación
propuestos y cerrar riesgos. **No** posee el permiso `Able to Submit New Risks`,
por lo que no puede crear los riesgos que luego debe aprobar.

## 3. Criterios de diseño aplicados

### Segregación de funciones

El esquema de permisos distribuye entre tres cuentas distintas las funciones de
**analizar**, **aprobar** y **controlar**:

- `analista_demo` identifica y valora riesgos, pero no puede aprobarlos.
- `responsable_demo` aprueba y cierra, pero no puede crear riesgos.
- `auditor_demo` revisa ambas actividades sin capacidad de modificar nada.

La finalidad es que ninguna cuenta concentre el ciclo completo de un riesgo. Si
un mismo usuario pudiera registrar un riesgo, valorarlo y darlo por cerrado, la
gestión de riesgos perdería capacidad de control: el registro reflejaría lo que
esa persona decide y no habría instancia independiente de verificación.

En el contexto de la clínica analizada, esta separación se corresponde con roles
organizacionales diferenciados: el área de Sistemas propone y ejecuta, la
Dirección aprueba las medidas y su presupuesto, y la auditoría interna verifica.

### Principio de mínimo privilegio

La instalación de SimpleRisk ofrece un único rol predefinido en el desplegable
correspondiente: **Administrator**. La alternativa más simple habría sido asignar
ese rol a las tres cuentas, lo que habría resultado en cuatro administradores con
control total sobre la instancia.

En su lugar se optó por dejar el campo de rol sin asignar y configurar los
permisos de forma individual mediante la sección *User Responsibilities*,
otorgando a cada cuenta únicamente los permisos necesarios para cumplir su
función. Ninguna de las tres cuentas creadas recibió privilegios administrativos.

La decisión implica un alta más laboriosa, pero evita que la comodidad de la
configuración por defecto derive en una asignación excesiva de privilegios, que
es precisamente uno de los hallazgos habituales en auditorías de control de
accesos.

### Independencia de la cuenta administrativa

La cuenta `admin_demotp` conserva privilegios completos por ser la cuenta técnica
de administración de la herramienta, pero se mantiene fuera del circuito
funcional de gestión de riesgos. De este modo, la administración de la plataforma
y la operación sobre el registro de riesgos permanecen separadas.
