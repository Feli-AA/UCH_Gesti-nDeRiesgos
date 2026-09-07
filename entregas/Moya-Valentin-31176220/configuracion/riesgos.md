# Registro de Riesgos - Clínica SaludTotal

> **Fecha de relevamiento:** 5 de septiembre de 2026  
> **Responsable:** Analista de Riesgo  
> **Metodología:** Matriz Probabilidad × Impacto (escala 1-5) para relevamiento manual,  
> **SimpleRisk:** aplica su propia fórmula de matriz interna (no multiplicación directa)  
> **Contexto:** Clínica privada de mediana complejidad

---

## ⚠️ Nota Técnica Importante

Durante el relevamiento manual se utilizó una escala de Probabilidad × Impacto (1-5), obteniendo valores como R2=20 o R4=16. Al cargar los mismos riesgos en SimpleRisk, la plataforma aplica su propia fórmula de matriz interna, resultando en valores como 8, 6.4 o 6. **Ambos criterios mantienen el mismo orden de prioridad** (Ransomware > Phishing > Filtración HCE), por lo que la jerarquía de riesgos no se ve afectada.

---

## Riesgo R1 (ID 1002) - Filtración de Historias Clínicas

| Campo | Valor |
|---|---|
| **ID en SimpleRisk** | 1002 |
| **Nombre** | Filtración de historias clínicas por acceso indebido de personal |
| **Descripción** | Acceso no autorizado a historias clínicas electrónicas por parte de personal interno (curiosidad, negligencia o intencional), exponiendo datos sensibles de pacientes como diagnósticos, tratamientos y datos personales. |
| **Categoría** | Confidencialidad / Legal |
| **Activos afectados** | Base de datos de HCE, pacientes, reputación de la clínica |
| **Probabilidad (manual)** | 4 - Alta (sector salud es el más afectado según Verizon DBIR 2024) |
| **Impacto (manual)** | 5 - Muy Alto (multas, demandas, pérdida de confianza) |
| **Nivel manual** | 20 (Crítico) |
| **Nivel SimpleRisk** | 6 (Medio) |
| **Controles existentes** | Autenticación básica, logs de acceso sin análisis |
| **Plan de tratamiento** | Mitigar - Implementar DLP y monitoreo de accesos en tiempo real |
| **Propietario** | Director Médico |
| **Estado en SimpleRisk** | Mitigation Planned ✅ |

---

## Riesgo R2 (ID 1003) - Ransomware

| Campo | Valor |
|---|---|
| **ID en SimpleRisk** | 1003 |
| **Nombre** | Ransomware sobre servidor de facturación y HCE |
| **Descripción** | Ataque de ransomware que cifra los sistemas críticos (servidores de HCE, facturación, gestión de turnos), paralizando la operación de la clínica y exigiendo rescate por la recuperación de los datos. |
| **Categoría** | Disponibilidad / Operativo |
| **Activos afectados** | Servidores de HCE, facturación, estaciones de trabajo, backups |
| **Probabilidad (manual)** | 4 - Alta (principal amenaza en salud según Verizon DBIR) |
| **Impacto (manual)** | 5 - Muy Alto (downtime de 5-7 días, pérdidas de USD 150k-600k) |
| **Nivel manual** | 20 (Crítico) |
| **Nivel SimpleRisk** | 8 (Alto) |
| **Controles existentes** | Antivirus básico, firewall perimetral, backups diarios |
| **Plan de tratamiento** | Mitigar - Implementar EDR, segmentación de red, backups inmutables |
| **Propietario** | Director de TI |
| **Estado en SimpleRisk** | Mitigation Planned ✅ |

---

## Riesgo R3 (ID 1005) - Phishing

| Campo | Valor |
|---|---|
| **ID en SimpleRisk** | 1005 |
| **Nombre** | Phishing dirigido a personal administrativo |
| **Descripción** | Correos electrónicos maliciosos dirigidos al personal administrativo y médico, buscando obtener credenciales de acceso o ejecutar malware que comprometa los sistemas internos de la clínica. |
| **Categoría** | Confidencialidad / Integridad |
| **Activos afectados** | Credenciales de acceso, sistemas internos, correo corporativo |
| **Probabilidad (manual)** | 4 - Alta (78% de organizaciones de salud sufrieron phishing en 2024) |
| **Impacto (manual)** | 4 - Alto (compromiso de cuentas, potencial acceso a HCE) |
| **Nivel manual** | 16 (Alto) |
| **Nivel SimpleRisk** | 6.4 (Medio) |
| **Controles existentes** | Filtro antispam básico, políticas de contraseñas sin MFA |
| **Plan de tratamiento** | Mitigar - Implementar MFA, capacitación y simulacros de phishing |
| **Propietario** | Jefe de RR.HH. (en conjunto con TI) |
| **Estado en SimpleRisk** | Mitigation Planned ✅ |

---

## Riesgo R4 (ID 1004) - Caída del Sistema

| Campo | Valor |
|---|---|
| **ID en SimpleRisk** | 1004 |
| **Nombre** | Caída del sistema durante horario de atención |
| **Descripción** | Indisponibilidad de los sistemas de HCE, facturación o gestión de turnos en horarios de alta demanda, afectando la atención a pacientes y generando pérdidas operativas. |
| **Categoría** | Disponibilidad / Operativo |
| **Activos afectados** | Sistemas de HCE, facturación, atención a pacientes |
| **Probabilidad (manual)** | 3 - Media (infraestructura con antigüedad de 4-5 años) |
| **Impacto (manual)** | 4 - Alto (pérdida de productividad, reprogramación de atenciones) |
| **Nivel manual** | 12 (Alto) |
| **Nivel SimpleRisk** | 4.8 (Medio) |
| **Controles existentes** | UPS, generador (sin mantenimiento regular) |
| **Plan de tratamiento** | Mitigar - Cluster HA, renovación de hardware |
| **Propietario** | Director de TI |
| **Estado en SimpleRisk** | New (sin planificar) |

---

## Riesgo R5 (ID 1007) - Backups sin Cifrar

| Campo | Valor |
|---|---|
| **ID en SimpleRisk** | 1007 |
| **Nombre** | Backups sin cifrar y sin pruebas de restauración |
| **Descripción** | Los backups de los sistemas críticos no están cifrados, lo que expone los datos en caso de robo físico, y no se realizan pruebas periódicas de restauración, poniendo en riesgo la recuperación ante un desastre. |
| **Categoría** | Integridad / Disponibilidad |
| **Activos afectados** | Backups, datos de pacientes, capacidad de recuperación |
| **Probabilidad (manual)** | 3 - Media |
| **Impacto (manual)** | 4 - Alto (pérdida irreversible de datos, extensión del downtime) |
| **Nivel manual** | 12 (Alto) |
| **Nivel SimpleRisk** | 4.8 (Medio) |
| **Controles existentes** | Backups diarios (sin cifrar, sin pruebas) |
| **Plan de tratamiento** | Mitigar - Cifrado de backups, pruebas trimestrales de restauración |
| **Propietario** | Director de TI |
| **Estado en SimpleRisk** | New (sin planificar) |

---

## Riesgo R6 (ID 1008) - Incumplimiento Normativo

| Campo | Valor |
|---|---|
| **ID en SimpleRisk** | 1008 |
| **Nombre** | Incumplimiento de normativa de protección de datos de salud |
| **Descripción** | La clínica no cumple completamente con la Ley de Protección de Datos Personales (N° 25.326) ni con las regulaciones específicas del sector salud, exponiéndose a sanciones y multas. |
| **Categoría** | Legal / Cumplimiento |
| **Activos afectados** | Datos de pacientes, reputación, situación financiera |
| **Probabilidad (manual)** | 3 - Media (inspecciones en aumento) |
| **Impacto (manual)** | 4 - Alto (multas de hasta 2% de facturación anual) |
| **Nivel manual** | 12 (Alto) |
| **Nivel SimpleRisk** | 4.8 (Medio) |
| **Controles existentes** | Política de privacidad básica |
| **Plan de tratamiento** | Mitigar - Auditoría legal, designar DPO |
| **Propietario** | Director Legal / Compliance |
| **Estado en SimpleRisk** | New (sin planificar) |

---

## Riesgo R7 (ID 1006) - Fuga de Datos por Proveedor Externo

| Campo | Valor |
|---|---|
| **ID en SimpleRisk** | 1006 |
| **Nombre** | Fuga de datos de obra social por proveedor externo mal auditado |
| **Descripción** | La clínica comparte datos de pacientes con proveedores externos (obra sociales, empresas de facturación, laboratorios) sin controles adecuados ni auditorías periódicas, lo que puede derivar en filtraciones de información. |
| **Categoría** | Confidencialidad / Legal |
| **Activos afectados** | Datos de pacientes, relaciones con proveedores, reputación |
| **Probabilidad (manual)** | 2 - Baja-Media |
| **Impacto (manual)** | 4 - Alto (multas, pérdida de confianza) |
| **Nivel manual** | 8 (Medio-Alto) |
| **Nivel SimpleRisk** | 3.2 (Bajo) |
| **Controles existentes** | Acuerdos de confidencialidad con proveedores |
| **Plan de tratamiento** | Mitigar - Auditoría de proveedores, cláusulas de seguridad en contratos |
| **Propietario** | Director Legal |
| **Estado en SimpleRisk** | New (sin planificar) |

---

## 📊 Resumen de Riesgos (ordenado por nivel SimpleRisk)

| ID SimpleRisk | Riesgo | Nivel SimpleRisk | Nivel Manual | Estado |
|---|---|---|---|---|
| 1003 | Ransomware | 8.0 (Alto) | 20 (Crítico) | Mitigation Planned ✅ |
| 1005 | Phishing | 6.4 (Medio) | 16 (Alto) | Mitigation Planned ✅ |
| 1002 | Filtración HCE | 6.0 (Medio) | 20 (Crítico) | Mitigation Planned ✅ |
| 1004 | Caída del Sistema | 4.8 (Medio) | 12 (Alto) | New |
| 1007 | Backups sin Cifrar | 4.8 (Medio) | 12 (Alto) | New |
| 1008 | Incumplimiento Normativo | 4.8 (Medio) | 12 (Alto) | New |
| 1006 | Fuga por Proveedor | 3.2 (Bajo) | 8 (Medio-Alto) | New |