# Registro de Riesgos - Clínica Privada

Contexto: clínica privada de 120 empleados que atiende 800 pacientes por día, con historias
clínicas digitales, datos de obras sociales y facturación. Tras una auditoría externa que
identificó debilidades en su gestión de riesgos, se relevaron los siguientes 7 riesgos

---

## R01 — Ransomware sobre el servidor de Historias Clínicas Electrónicas (HCE)

- **Categoría (SimpleRisk):** Technical Vulnerability Management
- **Activos afectados:** Servidor HCE, Backups
- **Probabilidad:** Likely (4) — el sector salud es uno de los más atacados por ransomware a
  nivel mundial (ref. Verizon DBIR)
- **Impacto:** Major (4) — paralización total de la atención, posible pérdida de historias
  clínicas, riesgo legal por normativa de protección de datos
- **Nivel resultante:** 6.4 — **Alto**
- **Controles existentes:** Backups no verificados ni aislados de la red principal
- **Plan de tratamiento:** Mitigar — backups 3-2-1 con copia offline, EDR, segmentación de red,
  capacitación anti-phishing
- **Propietario:** Responsable de Seguridad (admin_demo)

## R02 — Phishing dirigido al personal administrativo

- **Categoría:** Access Management
- **Activos afectados:** Sistema de Facturación, Personal Administrativo
- **Probabilidad:** Credible (3) — sin capacitación de concientización reportada
- **Impacto:** Major (4) — acceso no autorizado a datos financieros y de pacientes
- **Nivel resultante:** 4.8 — **Alto**
- **Controles existentes:** Ninguno (sin MFA, sin filtro anti-phishing avanzado)
- **Plan de tratamiento:** Mitigar — MFA obligatorio, filtrado de correo, capacitación periódica
- **Propietario:** Analista de Riesgos

## R03 — Cuentas de ex-empleados no dadas de baja

- **Categoría:** Access Management
- **Activos afectados:** Sistema HCE, Sistema de Facturación
- **Probabilidad:** Credible (3) — hallazgo común en organizaciones sin proceso de offboarding
- **Impacto:** Moderate (3) — acceso indebido a datos, detectable si hay logs
- **Nivel resultante:** 3.6 — **Medio**
- **Controles existentes:** Ninguno (sin revisión periódica de cuentas activas)
- **Plan de tratamiento:** Mitigar — revisión trimestral de usuarios activos, baja inmediata
  vinculada a RRHH
- **Propietario:** Responsable de Seguridad

## R04 — Exposición de historias clínicas por base de datos mal configurada

- **Categoría:** Sensitive Data Management
- **Activos afectados:** Base de Datos de Pacientes
- **Probabilidad:** Unlikely (2) — requiere un error de configuración específico
- **Impacto:** Extreme/Catastrophic (5) — dato de salud especialmente protegido, alto daño
  reputacional y legal
- **Nivel resultante:** 4.0 — **Alto**
- **Controles existentes:** Cifrado en tránsito parcial (a validar)
- **Plan de tratamiento:** Mitigar — cifrado en reposo, mínimo privilegio, auditoría de accesos
- **Propietario:** Responsable de Seguridad

## R05 — Corte de energía sin respaldo (UPS/generador)

- **Categoría:** Environmental Resilience
- **Activos afectados:** Servidor HCE, Estaciones de Trabajo
- **Probabilidad:** Credible (3) — riesgo común no contemplado en clínicas medianas
- **Impacto:** Moderate (3) — interrupción temporal, riesgo de corrupción de datos
- **Nivel resultante:** 3.6 — **Medio**
- **Controles existentes:** Ninguno
- **Plan de tratamiento:** Mitigar — UPS para servidores críticos, plan de continuidad operativa
- **Propietario:** Responsable de Seguridad

## R06 — Robo o pérdida de equipo con datos de pacientes

- **Categoría:** Physical Security
- **Activos afectados:** Estaciones de Trabajo, Base de Datos de Pacientes
- **Probabilidad:** Unlikely (2) — depende de controles de acceso físico existentes
- **Impacto:** Major (4) — exposición de datos sensibles, incumplimiento legal
- **Nivel resultante:** 3.2 — **Medio**
- **Controles existentes:** Acceso físico controlado en recepción (asumido)
- **Plan de tratamiento:** Mitigar — cifrado de disco completo, bloqueo automático, inventario
  de equipos
- **Propietario:** Analista de Riesgos

## R07 — Dependencia crítica de proveedor externo (obra social/facturación)

- **Categoría:** Third-Party Management
- **Activos afectados:** Sistema de Facturación
- **Probabilidad:** Credible (3) — sin auditoría de proveedores reportada
- **Impacto:** Moderate (3) — impacto operativo y legal ante brecha del tercero
- **Nivel resultante:** 3.6 — **Medio**
- **Controles existentes:** Ninguno (sin cláusulas de seguridad en contratos)
- **Plan de tratamiento:** Transferir/Mitigar — cláusulas contractuales, evaluación periódica
  del proveedor, seguro de ciberriesgo
- **Propietario:** Responsable de Seguridad

---

## Resumen por nivel

| Nivel | Cantidad | Riesgos            |
|-------|----------|--------------------|
| Alto  | 3        | R01, R02, R04      |
| Medio | 4        | R03, R05, R06, R07 |
| Bajo  | 0        | —                  |

## Planes de acción asociados (riesgos de nivel Alto)

| Plan                             | Riesgo | Responsable      | Presupuesto estimado | Fecha planificada |
|----------------------------------|--------|------------------|----------------------|-------------------|
| Backups aislados y EDR           | R01    | admin_demo       | $700.000–800.000     | 60 días           |
| Capacitación anti-phishing + MFA | R02    | analista_riesgos | $100.000–200.000     | 45 días           |
| Auditoría y hardening de BD      | R04    | admin_demo       | $200.000–300.000     | 30 días           |
