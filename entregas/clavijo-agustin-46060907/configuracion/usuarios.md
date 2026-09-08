# Usuarios, Roles y Permisos

## Usuarios creados

| Usuario | Rol | Email |
|---|---|---|
| Pepe Gonzalez | Administrador | pepe.gonzalez@gmail.com |
| Sofía Elena Álvarez | Analista de Riesgos | sofia.alvarez@gmail.com |
| Matías David Herrera | Auditor | matias.herrera@gmail.com |

## Rol: Administrador

Rol por defecto de SimpleRisk, con acceso total a todos los módulos (Governance, Risk Management, Compliance, Asset Management, Assessments, gestión de usuarios y roles). En este trabajo, además cumple la función de responsable de seguridad de la información, siendo quien aprueba los planes de mitigación mediante el Management Review.

## Rol: Analista de Riesgos (Sofía Elena Álvarez)

Diseñado para poder cargar y analizar riesgos, pero sin capacidad de aprobar ni cerrar nada de forma definitiva, siguiendo el principio de mínimo privilegio.

**Permisos habilitados:**
- Allow Access to "Risk Management" Menu
- Able to Submit New Risks
- Able to Modify Risk Details
- Able to Plan Mitigations
- Able to Review Insignificant / Low / Medium / High / Very High Risks
- Able to Comment Risk Management
- Able to Add Projects
- Able to Add Saved Risk Reports

**Permisos explícitamente NO habilitados:** Close Risks, Accept Mitigations, Delete/Manage Projects, Delete Saved Risk Reports, y todo lo relacionado a Governance, Compliance, Asset Management y Artificial Intelligence.

## Rol: Auditor (Matías David Herrera)

Rol de solo lectura, pensado para poder revisar el estado de los riesgos y el cumplimiento normativo sin capacidad de modificar nada.

**Permisos habilitados:**
- Allow Access to "Governance" Menu
- Able to View Exceptions
- Allow Access to "Risk Management" Menu
- Able to Review Insignificant / Low / Medium / High / Very High Risks
- Allow Access to "Compliance" Menu

**Permisos explícitamente NO habilitados:** cualquier acción de creación, modificación, cierre o aprobación en cualquier módulo.

## Manager (responsable de escalamiento)

Tanto Sofía Elena Álvarez (Analista) como Matías David Herrera (Auditor) tienen configurado como Manager al usuario Administrador (Pepe Gonzalez), ya que en este escenario simulado actúa como responsable de seguridad de la clínica. El usuario Administrador no tiene manager asignado, al ser la máxima autoridad dentro del sistema.