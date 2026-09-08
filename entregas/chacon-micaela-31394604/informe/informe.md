# Informe — Gestión de Riesgos con SimpleRisk

## 1. Introducción

En este trabajo se utilizó SimpleRisk para analizar y registrar los principales riesgos de seguridad
asociados al caso de una clínica privada.

La idea no fue solamente aprender a utilizar la herramienta, sino también aplicar un criterio de
análisis sobre un escenario concreto, identificando qué situaciones podrían afectar la información
y el funcionamiento de la organización.

A partir del caso propuesto se definieron siete riesgos, se evaluó su probabilidad e impacto y se
plantearon distintas medidas para reducirlos. También se configuraron usuarios con diferentes
niveles de permisos y se generaron planes de mitigación para algunos de los riesgos prioritarios.

---

## 2. Contexto del caso

El escenario plantea una clínica privada con 120 empleados que atiende aproximadamente
800 pacientes por día.

La organización trabaja con historias clínicas digitales, datos de obras sociales e información
de facturación. Además, una auditoría externa detectó debilidades en la forma en que se estaban
gestionando los riesgos.

A partir de esa información se realizó el análisis.

Es importante aclarar que no se asumieron tecnologías, controles de seguridad ni características
de infraestructura que no estuvieran indicadas en la consigna. Cuando fue necesario tomar una
decisión para completar el análisis, se la trató como una propuesta y no como un dato real de
la clínica.

---

## 3. Instalación y entorno utilizado

Para realizar el trabajo se instaló SimpleRisk de forma local utilizando Docker.

Se eligió Docker porque permite levantar el entorno de manera sencilla y, al mismo tiempo,
dejar documentada una forma reproducible de instalación.

La instancia utilizada durante el trabajo se ejecutó con la imagen oficial de SimpleRisk y se
accedió a la aplicación desde el navegador.

Además, se agregó al repositorio el archivo:

`entorno/docker-compose.yml`

Este archivo permite reproducir la instalación base utilizada durante la práctica.

La configuración posterior, como la creación de usuarios, riesgos y planes de mitigación,
se realizó manualmente desde la interfaz de SimpleRisk.

---

## 4. Configuración de usuarios

Para trabajar con distintos niveles de acceso se crearon tres usuarios: un administrador,
un analista de riesgos y un auditor.

La intención fue evitar que todos los usuarios tuvieran los mismos permisos.

El administrador quedó asociado a las tareas generales de configuración de la herramienta.
El analista puede registrar riesgos, modificarlos y planificar mitigaciones. El auditor, en cambio,
puede revisar la información y realizar comentarios, pero no modificar los riesgos.

Con esta configuración se buscó aplicar el principio de mínimo privilegio y mantener una
separación entre las tareas de administración, análisis y revisión.

El detalle de permisos se encuentra documentado en:

`configuracion/usuarios.md`

---

## 5. Riesgo de prueba

Antes de comenzar con los riesgos del caso de la clínica se creó un riesgo de prueba.

Su objetivo fue comprobar que la instalación funcionara correctamente y que fuera posible
registrar y evaluar riesgos dentro de SimpleRisk.

Este riesgo se utilizó solamente como validación del entorno y no forma parte de los siete
riesgos analizados para la clínica.

---

## 6. Evaluación de los riesgos

Para valorar los riesgos se utilizó la matriz de Probabilidad × Impacto indicada en la
plantilla proporcionada por la cátedra.

Tanto la probabilidad como el impacto se valoraron en una escala de 1 a 5.

El nivel se obtuvo mediante:

**Riesgo = Probabilidad × Impacto**

| Resultado | Nivel |
|:---:|:---:|
| 1 – 4 | Bajo |
| 5 – 9 | Medio |
| 10 – 15 | Alto |
| 16 – 25 | Crítico |

A partir del escenario se identificaron siete riesgos:

| ID | Riesgo | P | I | P × I | Nivel |
|:---:|---|:---:|:---:|:---:|:---:|
| R01 | Ransomware sobre historias clínicas digitales | 4 | 5 | 20 | Crítico |
| R02 | Acceso no autorizado a historias clínicas digitales | 4 | 4 | 16 | Crítico |
| R03 | Falla o pérdida de copias de seguridad | 4 | 5 | 20 | Crítico |
| R04 | Caída del sistema de gestión clínica | 4 | 5 | 20 | Crítico |
| R05 | Phishing dirigido al personal | 4 | 4 | 16 | Crítico |
| R06 | Modificación incorrecta de información médica | 3 | 5 | 15 | Alto |
| R07 | Filtración de datos de pacientes y obras sociales | 4 | 5 | 20 | Crítico |

El detalle de cada riesgo, junto con los activos involucrados, la justificación de probabilidad
e impacto y las medidas propuestas, se encuentra en:

`configuracion/riesgos.md`

---

## 7. Tratamiento propuesto

Para los riesgos identificados se eligió la estrategia de mitigación.

La decisión se tomó porque, dentro del escenario planteado, se consideró más razonable proponer
medidas que permitan reducir la probabilidad de que ocurran los incidentes o disminuir sus
consecuencias.

Por ejemplo, para los riesgos relacionados con acceso no autorizado se propusieron controles
de acceso más fuertes y mínimo privilegio. Para ransomware y pérdida de información se plantearon
medidas relacionadas con protección de los sistemas y copias de seguridad. En los riesgos
vinculados con phishing se propuso capacitación del personal y mejores controles sobre el correo.

Estas medidas representan propuestas realizadas durante el análisis. No significa que la clínica
ya cuente actualmente con ellas.
