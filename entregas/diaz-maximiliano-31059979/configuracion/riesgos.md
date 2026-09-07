# Registro y análisis de riesgos

## Contexto

La organización analizada es una clínica privada con aproximadamente 120 empleados y una atención de 800 pacientes por día. La clínica utiliza sistemas digitales para gestionar historias clínicas, información de seguros y obras sociales y datos de facturación.

A partir de este contexto se identificaron los siguientes riesgos relevantes para la seguridad de la información y la continuidad operativa.

## Riesgos identificados

### R1 — Ransomware afecta los sistemas clínicos

- **Categoría:** Technical Vulnerability Management
- **Activos afectados:** Application, System
- **Probabilidad:** 4/5 — Likely
- **Impacto:** 5/5 — Extreme/Catastrophic
- **Nivel:** Alto
- **Tratamiento:** Mitigar
- **Responsable:** admin
- **Controles existentes:** Medidas básicas de protección de sistemas y copias de seguridad.
- **Justificación:** La clínica depende de sus sistemas digitales para gestionar historias clínicas y atender aproximadamente 800 pacientes por día. Un ataque de ransomware podría cifrar o bloquear los sistemas clínicos, afectando la disponibilidad de la información y la continuidad de la atención.

### R2 — Acceso no autorizado a historias clínicas

- **Categoría:** Access Management
- **Activos afectados:** Application, System
- **Probabilidad:** 4/5 — Likely
- **Impacto:** 5/5 — Extreme/Catastrophic
- **Nivel:** Alto
- **Tratamiento:** Mitigar
- **Responsable:** admin
- **Controles existentes:** Gestión de usuarios y permisos de acceso.
- **Justificación:** Una vulneración de las cuentas podría permitir consultar, modificar o divulgar información médica sensible de los pacientes.

### R3 — Phishing y robo de credenciales

- **Categoría:** Access Management
- **Activos afectados:** Application, System
- **Probabilidad:** 4/5 — Likely
- **Impacto:** 4/5 — Major
- **Nivel:** Medio
- **Tratamiento:** Mitigar
- **Responsable:** admin
- **Controles existentes:** Autenticación de usuarios y medidas básicas de protección del correo.
- **Justificación:** Un ataque de phishing exitoso podría permitir obtener credenciales y acceder a sistemas clínicos o cuentas institucionales.

### R4 — Filtración de datos de pacientes

- **Categoría:** Sensitive Data Management
- **Activos afectados:** Application, System
- **Probabilidad:** 4/5 — Likely
- **Impacto:** 5/5 — Extreme/Catastrophic
- **Nivel:** Alto
- **Tratamiento:** Mitigar
- **Responsable:** admin
- **Controles existentes:** Control de acceso y gestión de usuarios.
- **Justificación:** La clínica almacena historias clínicas, información de seguros y obras sociales y datos de facturación. Una filtración podría generar consecuencias legales, económicas y reputacionales. La probabilidad se considera Likely debido a la cantidad y sensibilidad de la información almacenada y procesada.

### R5 — Interrupción de los sistemas clínicos

- **Categoría:** Environmental Resilience
- **Activos afectados:** System, Network
- **Probabilidad:** 3/5 — Credible
- **Impacto:** 5/5 — Extreme/Catastrophic
- **Nivel:** Medio
- **Tratamiento:** Mitigar
- **Responsable:** admin
- **Controles existentes:** Medidas básicas de disponibilidad e infraestructura tecnológica.
- **Justificación:** Una falla de infraestructura, red, energía o servidores podría dejar temporalmente inaccesibles los sistemas utilizados para la atención de pacientes.

### R6 — Falla de copias de seguridad y recuperación

- **Categoría:** Environmental Resilience
- **Activos afectados:** System, Application
- **Probabilidad:** 3/5 — Credible
- **Impacto:** 5/5 — Extreme/Catastrophic
- **Nivel:** Medio
- **Tratamiento:** Mitigar
- **Responsable:** admin
- **Controles existentes:** Copias de seguridad.
- **Justificación:** Las copias podrían resultar incompletas, corruptas o no recuperables al momento de necesitarlas, aumentando el impacto de una pérdida o cifrado de información clínica.

### R7 — Compromiso de proveedor externo

- **Categoría:** Third-Party Management
- **Activos afectados:** Application, System
- **Probabilidad:** 3/5 — Credible
- **Impacto:** 4/5 — Major
- **Nivel:** Medio
- **Tratamiento:** Mitigar
- **Responsable:** admin
- **Controles existentes:** Gestión básica de proveedores y control de accesos.
- **Justificación:** Una vulneración de un proveedor tecnológico podría utilizarse como vía de acceso a información o sistemas de la clínica.

## Planes de acción

### PLAN-01 — Recuperación ante Ransomware

- **Riesgo asociado:** R1 — Ransomware afecta los sistemas clínicos
- **Descripción:** Implementar y verificar un esquema de copias de seguridad y recuperación ante incidentes de ransomware, incluyendo pruebas periódicas de restauración.
- **Fecha de vencimiento:** 30/10/2026
- **Responsable:** Administrador
- **Presupuesto estimado:** $500.000
- **Estado inicial:** Activo

### PLAN-02 — Protección de historias clínicas

- **Riesgo asociado:** R2 — Acceso no autorizado a historias clínicas
- **Descripción:** Fortalecer los controles de acceso a las historias clínicas mediante privilegios mínimos, revisión periódica de permisos y autenticación robusta.
- **Fecha de vencimiento:** 30/10/2026
- **Responsable:** Administrador
- **Presupuesto estimado:** $300.000
- **Estado inicial:** Activo

### PLAN-03 — Gestión de proveedores

- **Riesgo asociado:** R7 — Compromiso de proveedor externo
- **Descripción:** Evaluar los proveedores tecnológicos, establecer requisitos de seguridad y revisar los accesos e integraciones con los sistemas de la clínica.
- **Fecha de vencimiento:** 22/10/2026
- **Responsable:** Administrador
- **Presupuesto estimado:** $200.000
- **Estado inicial:** Activo
