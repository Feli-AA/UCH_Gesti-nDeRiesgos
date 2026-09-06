# Registro de Riesgos y Planes de Tratamiento

## 1. Registro Detallado y Justificación de Riesgos

A continuación se definen los riesgos identificados, su descripción, y la justificación de la valoración (Probabilidad e Impacto en escala 1-5).

*   **R01: Infección por Ransomware**
    *   **Descripción:** Ataque de software malicioso que cifra las bases de datos de pacientes y servidores, bloqueando la operación de la clínica y exigiendo un rescate económico.
    *   **Justificación:** *Probabilidad 4:* El sector salud es uno de los principales objetivos de este malware por la urgencia de sus datos. *Impacto 5:* Detención total de la atención médica (800 pacientes diarios), poniendo en riesgo la salud de los pacientes por falta de historias clínicas.
*   **R02: Exposición por exceso de privilegios**
    *   **Descripción:** Acceso no autorizado a historias clínicas debido al uso de cuentas genéricas y contraseñas compartidas en los puestos de recepción.
    *   **Justificación:** *Probabilidad 3:* Práctica operativa diaria y común por rotación de turnos. *Impacto 4:* Brecha de confidencialidad que viola la Ley 25.326 de Protección de Datos Personales, conllevando graves sanciones legales y daño reputacional.
*   **R03: Interrupción de Obras Sociales (Corte de ISP)**
    *   **Descripción:** Caída del enlace principal de internet que impide al sistema conectarse a los servidores externos para validar coberturas médicas y autorizar prácticas.
    *   **Justificación:** *Probabilidad 3:* Conexión estándar sin redundancia expuesta a cortes físicos externos. *Impacto 4:* Imposibilidad de facturar las atenciones en tiempo real, generando fuertes retrasos operativos y demoras en los ingresos de caja.
*   **R04: Robo de dispositivos físicos**
    *   **Descripción:** Sustracción de notebooks de las áreas de guardia o consultorios, las cuales carecen de cifrado de disco y controles de seguridad física robustos.
    *   **Justificación:** *Probabilidad 3:* Las clínicas tienen un flujo constante y masivo de personas externas sin controles de acceso estrictos en pasillos. *Impacto 3:* Pérdida del valor del hardware e interrupción temporal para el médico afectado; posible exposición de datos cacheados.
*   **R05: Apagón general del Data Center**
    *   **Descripción:** Corte prolongado del suministro eléctrico de red que supera la escasa autonomía de las UPS locales, forzando un apagado abrupto de servidores.
    *   **Justificación:** *Probabilidad 2:* Los cortes prolongados en la zona son poco frecuentes, pero probables. *Impacto 5:* Caída total del sistema de gestión hospitalaria con alto riesgo de corrupción en las bases de datos por apagado sucio.
*   **R06: Fraude financiero por Phishing**
    *   **Descripción:** Empleados del área financiera comprometen sus credenciales bancarias o de correo tras interactuar con correos electrónicos engañosos.
    *   **Justificación:** *Probabilidad 4:* La ingeniería social sigue siendo el vector de ataque líder debido al factor humano. *Impacto 4:* Pérdida directa de capital de la clínica y posible robo de información contable sensible.
*   **R07: Destrucción de equipos por incendio**
    *   **Descripción:** Daño catastrófico al Data Center local provocado por un incendio originado por fallas de refrigeración o problemas eléctricos.
    *   **Justificación:** *Probabilidad 1:* El riesgo de fuego estructural es raro debido a normativas de construcción modernas. *Impacto 5:* Pérdida total de la infraestructura (Servidores), exigiendo reposición completa de hardware.

### Matriz Resumen (Niveles y Controles)

| ID | Riesgo | Categoría | Activos Afectados | Prob. | Imp. | Puntaje | Controles Existentes | Tratamiento | Propietario |
|---|---|---|---|---|---|---|---|---|---|
| **R01** | Infección por Ransomware | Disp., Conf. | Servidores físicos, BD pacientes | 4 | 5 | **20 (Crítico)** | Antivirus tradicional, backups locales en red | Mitigar | Gerente de TI |
| **R02** | Excesos de privilegios | Conf., Integ. | Historias clínicas, HIS | 3 | 4 | **12 (Alto)** | Contraseñas genéricas compartidas | Mitigar | Jefe de Recepción |
| **R03** | Interrupción de ISP | Disponibilidad | Enlace de red, Serv. facturación | 3 | 4 | **12 (Alto)** | Enlace fibra óptica estándar (sin backup) | Mitigar | Ger. de Operaciones |
| **R04** | Robo de dispositivos | Conf., Disp. | Notebooks de guardia | 3 | 3 | **9 (Medio)** | Cámaras en pasillos generales | Mitigar | Seg. Física |
| **R05** | Apagón del Data Center | Disponibilidad | Servidores, Switch, Refrigeración | 2 | 5 | **10 (Alto)** | UPS de escritorio (<10 min autonomía) | Transf. | Jefe Infraestructura |
| **R06** | Fraude por Phishing | Integ., Conf. | Correos, cuentas bancarias | 4 | 4 | **16 (Crítico)** | Filtro antispam nativo | Mitigar | Gerente Financiero |
| **R07** | Destrucción por incendio | Disp., Integ. | Servidores físicos | 1 | 5 | **5 (Medio)** | Extintores manuales ABC, humo | Mitigar | Facilities |

---

## 2. Planes de Acción (Riesgos Críticos y Altos)

### Plan de Acción 1: Mitigación de Ransomware (Asociado a R01)
* **Título:** Implementación de Arquitectura de Backups 3-2-1 Inmutables y EDR.
* **Descripción:** Despliegue de copias de seguridad bajo la regla 3-2-1, asegurando una copia inmutable y offline. Reemplazo del antivirus tradicional por una plataforma EDR (Endpoint Detection and Response) para análisis heurístico.
* **Fecha de vencimiento:** 30/10/2026.
* **Responsable:** Gerente de TI.
* **Presupuesto estimado:** $5,500 USD (Suscripciones anuales).
* **Estado inicial:** Planificado.

### Plan de Acción 2: Mitigación de Fraude por Phishing (Asociado a R06)
* **Título:** Despliegue Obligatorio de MFA y Programa de Concientización.
* **Descripción:** Activación forzada de Autenticación Multifactor obligatoria para todo el acceso al correo corporativo y plataformas financieras. Implementación de simulacros de phishing trimestrales.
* **Fecha de vencimiento:** 15/10/2026.
* **Responsable:** Gerente Financiero.
* **Presupuesto estimado:** $1,200 USD (Tokens físicos y plataforma educativa).
* **Estado inicial:** En curso (Fase de evaluación de proveedores).

### Plan de Acción 3: Mitigación de Exposición de Datos (Asociado a R02)
* **Título:** Transición a RBAC y Eliminación de Cuentas Compartidas en Recepción.
* **Descripción:** Auditoría y eliminación de cuentas genéricas en el sistema de gestión. Migración a credenciales individuales implementando Control de Acceso Basado en Roles, restringiendo la visibilidad de datos médicos sensibles al área de recepción.
* **Fecha de vencimiento:** 15/11/2026.
* **Responsable:** Jefe de Recepción.
* **Presupuesto estimado:** $0 (Se absorbe mediante horas operativas del área técnica interna).
* **Estado inicial:** Planificado.