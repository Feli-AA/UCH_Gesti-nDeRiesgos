# Planes de Acción - Clínica SaludTotal

> **Fecha de elaboración:** 5 de septiembre de 2026  
> **Responsable:** Analista de Riesgo  
> **Riesgos con mitigación planificada:** Ransomware (ID 1003), Phishing (ID 1005), Filtración HCE (ID 1002)

---

## Plan de Acción PA-1003 - Mitigación de Ransomware

| Campo | Valor |
|---|---|
| **Título** | Implementación de EDR y Segmentación de Red para protección contra Ransomware |
| **Descripción** | Adquirir e implementar una solución EDR (Endpoint Detection & Response) en todos los endpoints de la clínica, segmentar la red en VLANs para aislar sistemas críticos, e implementar backups inmutables con pruebas periódicas de restauración. |
| **Riesgo asociado** | ID 1003 - Ransomware sobre servidor de facturación y HCE |
| **Nivel actual** | 8.0 (Alto) |
| **Fecha de vencimiento** | 15/12/2026 |
| **Responsable** | Director de TI |
| **Presupuesto estimado** | USD 45.000 |
| **Estado inicial** | Planned |
| **Criterios de éxito** | 100% de endpoints con EDR, red segmentada en 4+ VLANs, backups inmutables operativos |

---

## Plan de Acción PA-1005 - Mitigación de Phishing

| Campo | Valor |
|---|---|
| **Título** | Implementación de MFA y Programa de Concientización contra Phishing |
| **Descripción** | Desplegar autenticación multifactor (MFA) para todos los accesos a sistemas sensibles (HCE, correo, VPN), implementar un programa de capacitación y simulacros de phishing mensuales para todo el personal, y mejorar el filtro de correo con soluciones avanzadas. |
| **Riesgo asociado** | ID 1005 - Phishing dirigido a personal administrativo |
| **Nivel actual** | 6.4 (Medio) |
| **Fecha de vencimiento** | 30/11/2026 |
| **Responsable** | Jefe de RR.HH. (en conjunto con TI) |
| **Presupuesto estimado** | USD 15.000 |
| **Estado inicial** | Planned |
| **Criterios de éxito** | 100% de usuarios con MFA, <5% de tasa de clics en simulacros de phishing |

---

## Plan de Acción PA-1002 - Mitigación de Filtración de HCE

| Campo | Valor |
|---|---|
| **Título** | Implementación de DLP y Monitoreo de Accesos a HCE |
| **Descripción** | Implementar una solución DLP (Data Loss Prevention) para monitorear y prevenir la salida de datos sensibles, y desplegar un sistema de monitoreo de accesos a la HCE en tiempo real con alertas automáticas ante comportamientos anómalos. |
| **Riesgo asociado** | ID 1002 - Filtración de historias clínicas por acceso indebido de personal |
| **Nivel actual** | 6.0 (Medio) |
| **Fecha de vencimiento** | 15/01/2027 |
| **Responsable** | Director Médico (en conjunto con TI) |
| **Presupuesto estimado** | USD 35.000 |
| **Estado inicial** | Planned |
| **Criterios de éxito** | DLP operativo en todos los puntos de salida, alertas de accesos anómalos con respuesta <15 min |