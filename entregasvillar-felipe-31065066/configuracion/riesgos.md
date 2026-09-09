# Gestión de riesgos

## 1. Contexto de la clínica

La organización analizada es una clínica médica privada ficticia, con aproximadamente 120 empleados y unas 800 atenciones diarias. Su operación depende principalmente del HIS y de las Historias Clínicas Digitales (HCD), además de servidores, estaciones de trabajo, red, copias de seguridad y correo institucional.

Los riesgos fueron registrados en SimpleRisk y los valores indicados a continuación son los valores observados en la herramienta. No se consideran valores de riesgo residual.

## 2. Riesgos identificados

La evaluación utiliza una matriz cualitativa de Probabilidad × Impacto de 5 × 5.

### Escala de probabilidad

| Valor | Descripción |
|---:|---|
| 1 | Muy baja |
| 2 | Baja |
| 3 | Media |
| 4 | Alta |
| 5 | Muy alta |

### Escala de impacto

| Valor | Descripción |
|---:|---|
| 1 | Muy bajo |
| 2 | Bajo |
| 3 | Medio |
| 4 | Alto |
| 5 | Muy alto |

### Tabla de riesgos

| ID | Nombre | Categoría | Probabilidad | Impacto | Valor observado en SimpleRisk | Tratamiento | Estado |
|---|---|---|---:|---:|---:|---|---|
| R01 | Ataque de Ransomware en Servidores de Historias Clínicas (HIS) | Technical Vulnerability Management | 4 | 5 | 8.0 | Mitigate | Mitigation Planned |
| R02 | Fuga de Historias Clínicas por Acceso No Autorizado | Sensitive Data Management | 4 | 4 | 6.4 | Mitigate | Mitigation Planned |
| R03 | Caída Prolongada del Data Center por Falla de Refrigeración | Environmental Resilience | 2 | 5 | 4.0 | Mitigate | New |
| R04 | Suplantación de Identidad (Phishing) a Personal Médico | Policy and Procedure | 5 | 3 | 6.0 | Mitigate | Mitigation Planned |
| R05 | Pérdida de Integridad en Copias de Seguridad (Backups) | Technical Vulnerability Management | 2 | 5 | 4.0 | Mitigate | New |
| R06 | Infiltración de Malware mediante Dispositivos USB no Autorizados | Physical Security | 3 | 4 | 4.8 | Mitigate | New |
| R07 | Falla en la Infraestructura de Red LAN Asistencial | Monitoring | 3 | 3 | 3.6 | Mitigate | New |

## Priorización

El ranking respeta los valores reales observados en SimpleRisk.

| Puesto | ID | Riesgo | Valor |
|---:|---|---|---:|
| 1 | R01 | Ransomware en servidores HIS | 8.0 |
| 2 | R02 | Acceso no autorizado a historias clínicas | 6.4 |
| 3 | R04 | Phishing al personal médico | 6.0 |
| 4 | R06 | Malware mediante dispositivos USB | 4.8 |
| 5 | R03 | Falla de refrigeración del Data Center | 4.0 |

R05 también presenta un valor de 4.0, mientras que R07 presenta 3.6.

## Planes de mitigación

### Plan R01 — Protección contra ransomware del HIS

- **Riesgo:** Ataque de Ransomware en Servidores de Historias Clínicas (HIS)
- **Estrategia:** Mitigate
- **Responsable en SimpleRisk:** Analista de Riesgo
- **Responsable funcional:** Responsable de Seguridad Informática
- **Fecha planificada:** 30/09/2026
- **Costo estimado:** USD 25.000
- **Porcentaje inicial:** 0 %
- **Solución:** Implementación de EDR en servidores HIS, segmentación de VLANs asistenciales y respaldo inmutable con esquema 3-2-1 guardado fuera de línea.
- **Objetivo:** Reducir la probabilidad y el impacto de un incidente de ransomware y mejorar la capacidad de recuperación de los servicios clínicos.

La estrategia combina EDR/XDR, segmentación de red, backups inmutables, una copia aislada u offline y pruebas periódicas de restauración.

### Plan R02 — Protección de historias clínicas

- **Riesgo:** Fuga de Historias Clínicas por Acceso No Autorizado
- **Estrategia:** Mitigate
- **Responsable en SimpleRisk:** Analista de Riesgo
- **Responsable funcional:** Responsable de Sistemas
- **Fecha planificada:** 15/10/2026
- **Costo estimado:** USD 15.000
- **Porcentaje inicial:** 0 %
- **Solución:** Implementación de solución DLP, autenticación multifactor (MFA) obligatoria para el personal de salud y auditoría periódica de logs de acceso a la base de datos HIS.
- **Objetivo:** Reducir el riesgo de acceso indebido y mejorar la trazabilidad sobre el uso de información clínica.

### Plan R04 — Programa de prevención de phishing

- **Riesgo:** Suplantación de Identidad (Phishing) a Personal Médico
- **Estrategia:** Mitigate
- **Responsable en SimpleRisk:** Analista de Riesgo
- **Responsable funcional:** Responsable de Seguridad Informática
- **Fecha planificada:** 15/10/2026
- **Costo estimado:** USD 5.000
- **Porcentaje inicial:** 0 %
- **Solución:** Campañas trimestrales de concientización y simulación de phishing para el personal hospitalario, acompañadas de la activación de filtros DMARC/SPF/DKIM en el servidor de correo.
- **Objetivo:** Disminuir la probabilidad de que el personal sea víctima de campañas de suplantación y mejorar la capacidad de detección.