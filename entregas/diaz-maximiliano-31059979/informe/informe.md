# Informe de Gestión de Riesgos — SimpleRisk

## 1. Introducción

El presente trabajo práctico tiene como objetivo aplicar conceptos de gestión de riesgos de seguridad de sistemas utilizando la herramienta SimpleRisk.

El análisis se desarrolla sobre el escenario de una clínica privada con aproximadamente 120 empleados y 800 pacientes diarios. La organización utiliza sistemas digitales para gestionar historias clínicas, información relacionada con seguros y obras sociales y datos de facturación.

A partir de este escenario se identifican riesgos que podrían afectar la confidencialidad, integridad y disponibilidad de la información y de los sistemas utilizados por la organización.

## 2. Objetivo

El objetivo es identificar, analizar y tratar los principales riesgos de seguridad de la información presentes en la organización, utilizando SimpleRisk como herramienta de apoyo para su gestión.

Además, se busca documentar las decisiones tomadas, los controles existentes, las estrategias de tratamiento y las acciones propuestas para reducir la exposición de la organización a los riesgos identificados.

## 3. Descripción del escenario

La organización analizada es una clínica privada que cuenta con aproximadamente 120 empleados y atiende alrededor de 800 pacientes por día.

Entre los principales activos de información se encuentran:

- Historias clínicas digitales.
- Información de pacientes.
- Datos de seguros y obras sociales.
- Información de facturación.
- Sistemas y aplicaciones utilizados para la gestión clínica.
- Infraestructura de red y servidores.

La dependencia de estos sistemas hace que la disponibilidad y protección de la información sean aspectos críticos para la continuidad de las operaciones.

Como antecedente, una auditoría externa detectó debilidades en la gestión de riesgos de la organización, por lo que resulta necesario identificar los principales escenarios de riesgo y establecer medidas de tratamiento.

## 4. Metodología

Para el análisis se utilizó la metodología de evaluación de riesgos **Classic** disponible en SimpleRisk.

La evaluación considera dos variables principales:

- **Probabilidad:** posibilidad de que ocurra el evento de riesgo.
- **Impacto:** consecuencias que tendría el evento sobre la organización.

Ambas variables se valoran mediante una escala cualitativa de cinco niveles. El nivel resultante permite priorizar los riesgos y determinar cuáles requieren mayor atención.

Para cada riesgo se documentaron:

- Descripción del escenario.
- Categoría.
- Activos afectados.
- Probabilidad.
- Impacto.
- Nivel de riesgo.
- Controles existentes.
- Estrategia de tratamiento.
- Responsable del riesgo.

Los valores asignados fueron definidos en función del escenario planteado y de las posibles consecuencias para la confidencialidad, integridad y disponibilidad de la información y los sistemas.

## 5. Configuración de SimpleRisk

SimpleRisk fue implementado en un entorno virtual utilizando Linux Mint 22.3 Cinnamon, VirtualBox, Docker y Docker Compose.

La aplicación se ejecuta mediante dos contenedores principales:

- SimpleRisk.
- MySQL.

La información de la aplicación y de la base de datos se mantiene mediante volúmenes persistentes de Docker.

Para evitar la exposición de información sensible, las credenciales utilizadas en el entorno son ficticias y no se incluyen en el repositorio.

Se configuraron tres perfiles diferenciados en SimpleRisk:

- Administrador.
- Analista de riesgos.
- Auditor.

También se creó un riesgo inicial de prueba para verificar el correcto funcionamiento de la instalación antes de cargar los riesgos correspondientes al escenario de la clínica.

### Evidencia

La configuración y el funcionamiento de la herramienta se encuentran respaldados mediante las capturas almacenadas en:

`informe/capturas/`
## 6. Identificación y evaluación de riesgos

A partir del escenario planteado se identificaron siete riesgos relevantes para la clínica. La evaluación se realizó utilizando la metodología Classic de SimpleRisk, considerando la probabilidad de ocurrencia y el impacto potencial sobre la organización.

### 6.1 Ransomware afecta los sistemas clínicos

- **Categoría:** Technical Vulnerability Management
- **Activos afectados:** Application, System
- **Probabilidad:** Likely (4/5)
- **Impacto:** Extreme/Catastrophic (5/5)
- **Nivel de riesgo:** High
- **Tratamiento:** Mitigate
- **Responsable:** admin

La clínica depende de sus sistemas digitales para gestionar historias clínicas y atender aproximadamente 800 pacientes por día. Un ataque de ransomware podría cifrar o bloquear los sistemas clínicos, impidiendo el acceso a información necesaria para la atención y afectando la continuidad operativa.

La probabilidad se considera Likely debido a la exposición a amenazas de malware y phishing. El impacto se considera Extreme/Catastrophic por la dependencia de la organización de sus sistemas digitales y las posibles consecuencias sobre la atención de pacientes y la disponibilidad de la información.

**Tratamiento propuesto:** fortalecer la protección de endpoints, mantener los sistemas actualizados, segmentar la red, restringir privilegios y disponer de copias de seguridad aisladas y verificadas.

### 6.2 Acceso no autorizado a historias clínicas

- **Categoría:** Access Management
- **Activos afectados:** Application, System
- **Probabilidad:** Likely (4/5)
- **Impacto:** Extreme/Catastrophic (5/5)
- **Nivel de riesgo:** High
- **Tratamiento:** Mitigate
- **Responsable:** admin

El acceso no autorizado a las historias clínicas podría permitir la consulta, modificación o divulgación de información médica sensible de los pacientes. La clínica procesa información clínica y datos asociados a seguros y obras sociales, por lo que una vulneración de las cuentas de usuario podría afectar gravemente la confidencialidad e integridad de la información.

La probabilidad se considera Likely debido a la cantidad de empleados con acceso a los sistemas. El impacto se considera Extreme/Catastrophic por la sensibilidad de la información involucrada y las posibles consecuencias operativas y legales.

**Tratamiento propuesto:** aplicar privilegios mínimos, revisar periódicamente los permisos y fortalecer los mecanismos de autenticación.

### 6.3 Phishing y robo de credenciales

- **Categoría:** Access Management
- **Activos afectados:** Application, System
- **Probabilidad:** Likely (4/5)
- **Impacto:** Major (4/5)
- **Nivel de riesgo:** Medium
- **Tratamiento:** Mitigate
- **Responsable:** admin

Los empleados de la clínica pueden recibir correos electrónicos fraudulentos destinados a obtener credenciales o instalar software malicioso. Un ataque de phishing exitoso podría permitir el acceso no autorizado a sistemas clínicos y cuentas institucionales.

La probabilidad se considera Likely debido a la cantidad de empleados y a la exposición habitual al correo electrónico. El impacto se considera Major porque el compromiso de una cuenta podría utilizarse para acceder a información sensible y afectar otros sistemas.

**Tratamiento propuesto:** reforzar la capacitación del personal, mejorar los mecanismos de filtrado de correo y fortalecer la autenticación de las cuentas.

### 6.4 Filtración de datos de pacientes

- **Categoría:** Sensitive Data Management
- **Activos afectados:** Application, System
- **Probabilidad:** Likely (4/5)
- **Impacto:** Extreme/Catastrophic (5/5)
- **Nivel de riesgo:** High
- **Tratamiento:** Mitigate
- **Responsable:** admin

La clínica almacena historias clínicas digitales, información de seguros y obras sociales y datos de facturación. Una filtración podría exponer información sensible de pacientes y generar consecuencias legales, económicas y reputacionales.

La probabilidad se considera Credible debido a la cantidad de información sensible almacenada y procesada. El impacto se considera Extreme/Catastrophic por la sensibilidad y volumen de los datos involucrados.

**Tratamiento propuesto:** reforzar los controles de acceso, el monitoreo y registro de actividades y las medidas de protección de la información sensible.

### 6.5 Interrupción de los sistemas clínicos

- **Categoría:** Environmental Resilience
- **Activos afectados:** System, Network
- **Probabilidad:** Credible (3/5)
- **Impacto:** Extreme/Catastrophic (5/5)
- **Nivel de riesgo:** Medium
- **Tratamiento:** Mitigate
- **Responsable:** admin

Una falla de infraestructura, red, energía o servidores podría dejar temporalmente inaccesibles los sistemas clínicos de la organización. La clínica depende de estos sistemas para gestionar historias clínicas y atender aproximadamente 800 pacientes diarios.

La probabilidad se considera Credible debido a la posibilidad de fallas técnicas o interrupciones de infraestructura. El impacto se considera Extreme/Catastrophic debido a la dependencia de los sistemas digitales para la continuidad de las operaciones.

**Tratamiento propuesto:** contar con mecanismos de redundancia, alimentación eléctrica protegida, procedimientos de contingencia y mecanismos de recuperación ante fallas.

### 6.6 Falla de copias de seguridad y recuperación

- **Categoría:** Environmental Resilience
- **Activos afectados:** System, Application
- **Probabilidad:** Credible (3/5)
- **Impacto:** Extreme/Catastrophic (5/5)
- **Nivel de riesgo:** Medium
- **Tratamiento:** Mitigate
- **Responsable:** admin

Las copias de seguridad podrían resultar incompletas, corruptas o no recuperables al momento de necesitarlas, aumentando el impacto de una pérdida o cifrado de información clínica.

La probabilidad se considera Credible debido a la posibilidad de errores de configuración, fallas de almacenamiento o ausencia de pruebas periódicas de restauración. El impacto se considera Extreme/Catastrophic porque la pérdida de información clínica podría afectar la continuidad de la atención y la capacidad de recuperación ante incidentes.

**Tratamiento propuesto:** mantener copias de seguridad periódicas, aisladas y verificadas mediante pruebas de restauración.

### 6.7 Compromiso de proveedor externo

- **Categoría:** Third-Party Management
- **Activos afectados:** Application, System
- **Probabilidad:** Credible (3/5)
- **Impacto:** Major (4/5)
- **Nivel de riesgo:** Medium
- **Tratamiento:** Mitigate
- **Responsable:** admin

Una vulneración de un proveedor que presta servicios tecnológicos, de facturación o integración podría utilizarse como vía de acceso a información o sistemas de la clínica.

La probabilidad se considera Credible debido a la dependencia de servicios y terceros para procesos tecnológicos y administrativos. El impacto se considera Major porque un incidente de un proveedor podría afectar la confidencialidad de la información y la continuidad de procesos críticos.

**Tratamiento propuesto:** evaluar los riesgos de seguridad de los proveedores, establecer requisitos de seguridad contractuales, limitar los accesos e integraciones y revisar periódicamente sus controles.

## 7. Priorización

De acuerdo con la evaluación realizada en SimpleRisk, los riesgos de mayor prioridad son:

1. Ransomware afecta los sistemas clínicos — **High**.
2. Acceso no autorizado a historias clínicas — **High**.
3. Phishing y robo de credenciales — **Medium**.
4. Filtración de datos de pacientes — **High**.
5. Interrupción de los sistemas clínicos — **Medium**.
6. Falla de copias de seguridad y recuperación — **Medium**.
7. Compromiso de proveedor externo — **Medium**.

Los dos primeros riesgos presentan el nivel más elevado y requieren especial atención debido a su potencial para afectar tanto la continuidad operativa como la protección de la información de los pacientes.

Las evidencias de la evaluación y configuración de cada riesgo se encuentran en la carpeta `informe/capturas/`.
## 8. Tratamiento de los riesgos

Luego de la evaluación, se definieron estrategias de tratamiento orientadas principalmente a la mitigación de los riesgos.

La estrategia de mitigación busca reducir la probabilidad de ocurrencia, disminuir el impacto potencial o mejorar la capacidad de recuperación de la organización.

Las principales medidas propuestas incluyen:

- Fortalecimiento de la protección contra malware y ransomware.
- Aplicación del principio de mínimo privilegio.
- Fortalecimiento de la autenticación.
- Capacitación del personal frente a ataques de phishing.
- Protección y monitoreo de información sensible.
- Implementación de mecanismos de redundancia y contingencia.
- Mejora de las copias de seguridad y pruebas de restauración.
- Evaluación y control de proveedores externos.

## 9. Planes de acción

Se definieron tres planes de acción para abordar riesgos prioritarios identificados durante el análisis.

### PLAN-01 — Recuperación ante Ransomware

- **Riesgo asociado:** Ransomware afecta los sistemas clínicos.
- **Estrategia:** Mitigar.
- **Descripción:** Implementar medidas de prevención, detección y recuperación frente a incidentes de ransomware.
- **Fecha objetivo:** 30/10/2026.
- **Responsable:** Administrador de SimpleRisk.
- **Presupuesto estimado:** $900.001 a $1.000.000.
- **Estado inicial:** 0% — planificación inicial.

Las principales acciones contemplan protección de endpoints, actualización de sistemas, segmentación de red, restricción de privilegios y mantenimiento de copias de seguridad aisladas y verificadas.

### PLAN-02 — Protección de historias clínicas

- **Riesgo asociado:** Acceso no autorizado a historias clínicas.
- **Estrategia:** Mitigar.
- **Descripción:** Fortalecer los controles de acceso a los sistemas que almacenan y procesan información clínica.
- **Fecha objetivo:** 30/10/2026.
- **Responsable:** Administrador de SimpleRisk.
- **Presupuesto estimado:** $0 a $100.000.
- **Estado inicial:** 0% — planificación inicial.

Las principales acciones contemplan revisión periódica de permisos, aplicación del principio de mínimo privilegio y fortalecimiento de los mecanismos de autenticación.

### PLAN-03 — Gestión de proveedores

- **Riesgo asociado:** Compromiso de proveedor externo.
- **Estrategia:** Mitigar.
- **Descripción:** Mejorar la evaluación de seguridad y el control de accesos de proveedores externos que interactúan con los sistemas de la clínica.
- **Fecha objetivo:** 22/10/2026.
- **Responsable:** Administrador de SimpleRisk.
- **Presupuesto estimado:** $0 a $100.000.
- **Estado inicial:** 0% — planificación inicial.

Las principales acciones contemplan evaluar los controles de seguridad de los proveedores, establecer requisitos de seguridad y limitar los accesos e integraciones según el principio de mínimo privilegio.

Los planes también fueron registrados en SimpleRisk mediante la funcionalidad de proyectos de planificación, permitiendo asociar los riesgos con actividades de tratamiento y seguimiento.

## 10. Evidencias

La implementación y configuración realizada en SimpleRisk se encuentra respaldada mediante capturas de pantalla almacenadas en:

`informe/capturas/`

Entre las evidencias se incluyen:

- Creación del riesgo de prueba.
- Carga de los siete riesgos del escenario.
- Detalle y evaluación de los riesgos.
- Planificación de mitigaciones.
- Proyectos utilizados para representar los planes de acción.
- Configuración de usuarios y roles.

## 11. Conclusión

El uso de SimpleRisk permitió organizar y documentar el proceso de identificación, evaluación y tratamiento de riesgos de seguridad de la información de la clínica.

El análisis permitió identificar riesgos relacionados con ransomware, acceso no autorizado, phishing, filtración de información, disponibilidad de sistemas, copias de seguridad y proveedores externos.

Los riesgos con mayor prioridad fueron aquellos relacionados con ransomware y acceso no autorizado a historias clínicas, debido a su potencial impacto sobre la continuidad operativa y la protección de información sensible.

Como resultado, se propusieron medidas de mitigación y planes de acción orientados a reducir la exposición de la organización y mejorar su capacidad de prevención y recuperación ante incidentes.
## 12. Comparación metodológica

### 12.1 SimpleRisk Classic

La metodología Classic utilizada en SimpleRisk permite evaluar los riesgos mediante una combinación de probabilidad e impacto.

Su principal ventaja es la simplicidad: permite obtener rápidamente una clasificación del riesgo y priorizar los escenarios que requieren tratamiento.

En este trabajo resultó adecuada para realizar una primera evaluación de los riesgos de la clínica, ya que permitió comparar los diferentes escenarios utilizando criterios comunes.

Entre sus principales ventajas se encuentran:

- Fácil de comprender y aplicar.
- Permite realizar una priorización rápida.
- Facilita la visualización del nivel de riesgo.
- Es adecuada para evaluaciones cualitativas iniciales.

Como limitación, el resultado depende en gran medida de la valoración subjetiva de la probabilidad y del impacto asignados por los responsables del análisis.

### 12.2 NIST SP 800-30

NIST SP 800-30 propone un proceso más detallado para realizar evaluaciones de riesgo. El análisis contempla la identificación de fuentes de amenaza, eventos de amenaza, vulnerabilidades y condiciones predisponentes, además de la probabilidad y el impacto.

Este enfoque permite obtener un análisis más profundo de las causas que pueden generar un riesgo y de sus posibles consecuencias.

Sus principales ventajas son:

- Proporciona un proceso estructurado para la evaluación.
- Permite analizar las amenazas y vulnerabilidades que originan los riesgos.
- Facilita justificar las estimaciones de probabilidad e impacto.
- Resulta apropiado para organizaciones que necesitan evaluaciones de riesgo más detalladas.

Como desventaja, requiere mayor cantidad de información y tiempo de análisis que una metodología cualitativa simple.

### 12.3 Comparación

| Aspecto | SimpleRisk Classic | NIST SP 800-30 |
|---|---|---|
| Complejidad | Baja | Media/Alta |
| Evaluación | Probabilidad e impacto | Amenazas, vulnerabilidades, probabilidad e impacto |
| Facilidad de aplicación | Alta | Media |
| Tiempo requerido | Bajo | Mayor |
| Nivel de detalle | Básico | Detallado |
| Priorización | Directa | Basada en un análisis más amplio |
| Uso recomendado | Evaluaciones iniciales y seguimiento | Evaluaciones formales y detalladas |

Para el presente trabajo se utilizó SimpleRisk Classic porque permite realizar una evaluación inicial de manera rápida y consistente. Para una evaluación profesional más profunda de la clínica, NIST SP 800-30 podría utilizarse como complemento para analizar con mayor detalle las amenazas, vulnerabilidades y condiciones que originan cada riesgo.

## 13. Integración con herramientas externas

Como parte del análisis se considera la integración de SimpleRisk con herramientas externas de gestión y seguimiento.

Una alternativa sería utilizar una plataforma de gestión de tickets para registrar y realizar el seguimiento de las acciones de mitigación. De esta forma, un riesgo identificado en SimpleRisk podría generar una tarea para el equipo responsable, permitiendo controlar responsables, fechas de vencimiento y estado.

En este trabajo no se implementó una integración real mediante API o webhook. La integración se plantea como una posibilidad de mejora para un entorno productivo.

Una implementación futura podría utilizar:

1. SimpleRisk como sistema central de gestión de riesgos.
2. Una herramienta de tickets para gestionar las acciones de tratamiento.
3. Una API o webhook para transmitir automáticamente los eventos.
4. El sistema de tickets para asignar responsables y realizar seguimiento.

Esta arquitectura permitiría separar la gestión del riesgo de la ejecución operativa de las acciones de mitigación.
