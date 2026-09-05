# Registro de Riesgos y Planes de Tratamiento

## 1. Matriz de Riesgos Definidos

| ID | Nombre del Riesgo | Categoría | Activos Afectados | Prob. | Imp. | Nivel Resultante | Controles Existentes | Tratamiento | Propietario |
|---|---|---|---|---|---|---|---|---|---|
| **R01** | Infección por Ransomware | Disponibilidad, Confidencialidad | Servidores físicos, BD pacientes | 4 | 5 | 20 (Crítico) | Antivirus tradicional, backups locales en red | Mitigar | Gerente de TI |
| **R02** | Exposición por exceso de privilegios | Confidencialidad, Integridad | Historias clínicas, HIS (Sistema de Gestión) | 3 | 4 | 12 (Alto) | Contraseñas genéricas compartidas por turno | Mitigar | Jefe de Recepción |
| **R03** | Interrupción de Obras Sociales (ISP) | Disponibilidad | Enlace a internet, Servidor de facturación | 3 | 4 | 12 (Alto) | Conexión de fibra óptica estándar sin redundancia | Mitigar | Gerente de Operaciones |
| **R04** | Robo de dispositivos físicos | Confidencialidad, Disponibilidad | Notebooks de guardia | 3 | 3 | 9 (Medio) | Control de acceso básico, cámaras en pasillos | Mitigar | Seg. Física |
| **R05** | Apagón general del Data Center | Disponibilidad | Servidores centrales, Switch Core, Refrigeración | 2 | 5 | 10 (Alto) | UPS de escritorio (<10 min autonomía) | Transferir / Mitigar | Jefe de Infraestructura |
| **R06** | Fraude financiero por Phishing | Integridad, Confidencialidad | Cuentas de correo, cuentas bancarias | 4 | 4 | 16 (Crítico) | Filtro antispam nativo del correo | Mitigar | Gerente Financiero |
| **R07** | Destrucción de equipos por incendio | Disponibilidad, Integridad | Servidores físicos, almacenamiento SAN/NAS | 1 | 5 | 5 (Medio) | Extintores manuales ABC, detectores de humo | Mitigar | Gerencia General / Facilities |

> *Nota metodológica: La evaluación se realizó bajo el método clásico (Probabilidad x Impacto) utilizando una escala estándar de 1 a 5, según la rúbrica de la clínica.*

---

## 2. Planes de Acción (Riesgos Críticos y Altos)

### Plan de Acción 1: Mitigación de Ransomware (Asociado a R01)
* **Título:** Implementación de Arquitectura de Backups 3-2-1 Inmutables y EDR.
* **Descripción:** Despliegue de copias de seguridad bajo la regla 3-2-1, asegurando una copia inmutable y offline (air-gapped). Reemplazo del antivirus tradicional por una plataforma EDR (Endpoint Detection and Response) para análisis heurístico.
* **Fecha de vencimiento:** 30/10/2026.
* **Responsable:** Gerente de TI.
* **Presupuesto estimado:** $5,500 USD (Suscripciones anuales).
* **Estado inicial:** Planificado.

### Plan de Acción 2: Mitigación de Fraude por Phishing (Asociado a R06)
* **Título:** Despliegue Obligatorio de MFA y Programa de Concientización.
* **Descripción:** Activación forzada de Autenticación Multifactor (MFA) obligatoria para todo el acceso al correo corporativo y plataformas financieras. Implementación de simulacros de phishing trimestrales.
* **Fecha de vencimiento:** 15/10/2026.
* **Responsable:** Gerente Financiero.
* **Presupuesto estimado:** $1,200 USD (Tokens físicos y plataforma educativa).
* **Estado inicial:** En curso (Fase de evaluación de proveedores).

### Plan de Acción 3: Mitigación de Exposición de Datos (Asociado a R02)
* **Título:** Transición a RBAC y Eliminación de Cuentas Compartidas en Recepción.
* **Descripción:** Auditoría y eliminación de cuentas genéricas en el sistema de gestión. Migración a credenciales individuales implementando Control de Acceso Basado en Roles (RBAC), restringiendo la visibilidad de datos médicos sensibles al área de recepción.
* **Fecha de vencimiento:** 15/11/2026.
* **Responsable:** Jefe de Recepción.
* **Presupuesto estimado:** $0 (Se absorbe mediante horas operativas del área técnica interna).
* **Estado inicial:** Planificado.