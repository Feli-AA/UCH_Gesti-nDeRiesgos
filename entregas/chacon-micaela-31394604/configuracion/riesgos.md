# Configuración de Riesgos

## Contexto

El análisis se realiza sobre una clínica privada de 120 empleados que atiende aproximadamente
800 pacientes por día y utiliza sistemas digitales para gestionar historias clínicas, información
de obras sociales y facturación.

La clínica atravesó una auditoría externa que identificó debilidades en su gestión de riesgos,
por lo que se definió un registro inicial de riesgos utilizando SimpleRisk.

## Criterio de evaluación

Para la evaluación se utilizó el método **Classic** de SimpleRisk.

La probabilidad y el impacto se valoraron utilizando una escala de 1 a 5:

## Probabilidad

| Valor | Nivel | Descripción |
|---:|---|---|
| 1 | Raro | El evento solo ocurriría en circunstancias excepcionales |
| 2 | Improbable | Podría ocurrir, pero no se espera que suceda |
| 3 | Posible | Existe una posibilidad real de que ocurra |
| 4 | Probable | Es muy probable que ocurra en algún momento |
| 5 | Casi seguro | Se espera que ocurra frecuentemente o ha ocurrido recientemente |

## Impacto

| Valor | Nivel | Descripción |
|---:|---|---|
| 1 | Insignificante | Impacto mínimo, sin consecuencias relevantes |
| 2 | Menor | Alteración leve de la operación y costo bajo |
| 3 | Moderado | Impacto operativo y económico apreciable, pero recuperable |
| 4 | Mayor | Impacto significativo, pérdida de operación o datos y costo alto |
| 5 | Catastrófico | Paralización total, pérdida crítica de datos o daño legal/reputacional severo |

> **Nota sobre los controles existentes:** el escenario planteado por la consigna no especifica
> qué controles técnicos se encuentran actualmente implementados. Por este motivo, se asumieron
> controles básicos habituales para una organización de estas características, como autenticación
> mediante usuario y contraseña, antivirus y copias de seguridad. Estos controles se consideran
> insuficientes o con debilidades, en línea con el resultado de la auditoría externa planteada
> en el escenario.

---

# R01 — Ransomware sobre historias clínicas digitales

**ID SimpleRisk:** 1002

**Categoría académica:** Disponibilidad / Integridad

**Categoría en SimpleRisk:** Technical Vulnerability Management

**Descripción:**

Un ataque de ransomware podría cifrar los sistemas que almacenan y procesan las historias
clínicas digitales de la clínica, impidiendo el acceso a información necesaria para la atención
de pacientes. El incidente también podría propagarse a servidores, estaciones de trabajo y
copias de seguridad conectadas.

**Activos afectados:**

- Historias clínicas digitales
- Servidor de gestión clínica
- Estaciones de trabajo
- Copias de seguridad

**Probabilidad:** 4 — Probable

**Justificación de probabilidad:**

La probabilidad se considera alta porque el ransomware puede ingresar mediante correos falsos,
contraseñas robadas o fallas de seguridad.

**Impacto:** 5 — Catastrófico

**Justificación de impacto:**

El impacto sería muy alto porque podría bloquear las historias clínicas y afectar directamente
la atención de los pacientes y el funcionamiento de la clínica.

**Nivel resultante en SimpleRisk:** High — 8

**Controles existentes asumidos:**

- Antivirus en estaciones de trabajo.
- Copias de seguridad básicas.
- Autenticación de usuarios.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

Mantener los sistemas actualizados, reforzar la protección de los equipos, utilizar copias de
seguridad aisladas y capacitar al personal para reconocer correos y archivos sospechosos.

**Propietario:** Analista de Riesgos.

---

# R02 — Acceso no autorizado a historias clínicas digitales

**ID SimpleRisk:** 1003

**Categoría académica:** Confidencialidad

**Categoría en SimpleRisk:** Access Management

**Descripción:**

Un usuario no autorizado podría acceder a historias clínicas mediante credenciales robadas,
compartidas o pertenecientes a usuarios con permisos excesivos. Esto podría exponer información
privada de los pacientes.

**Activos afectados:**

- Cuentas de usuarios
- Historias clínicas digitales
- Servidor de gestión clínica

**Probabilidad:** 4 — Probable

**Justificación de probabilidad:**

La probabilidad se considera alta porque las credenciales pueden ser robadas, compartidas o
utilizadas por personas con permisos excesivos.

**Impacto:** 4 — Mayor

**Justificación de impacto:**

El impacto es importante porque un acceso indebido podría provocar la exposición de información
privada y sensible de los pacientes.

**Nivel resultante en SimpleRisk:** Medium — 6.4

**Controles existentes asumidos:**

- Autenticación mediante usuario y contraseña.
- Permisos básicos de acceso a los sistemas.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

Aplicar políticas de contraseñas seguras, autenticación multifactor cuando sea posible, revisión
periódica de permisos y principio de mínimo privilegio.

**Propietario:** Analista de Riesgos.

---

# R03 — Falla o pérdida de copias de seguridad de información clínica

**ID SimpleRisk:** 1004

**Categoría académica:** Disponibilidad

**Categoría en SimpleRisk:** Environmental Resilience

**Descripción:**

Una falla en las copias de seguridad podría impedir recuperar historias clínicas y otros datos
importantes luego de un incidente, una falla del sistema o un ataque. Esto podría provocar pérdida
de información y afectar la continuidad de las actividades de la clínica.

**Activos afectados:**

- Copias de seguridad
- Historias clínicas digitales
- Servidor de gestión clínica

**Probabilidad:** 4 — Probable

**Justificación de probabilidad:**

La probabilidad se considera alta porque las copias de seguridad pueden fallar, quedar incompletas
o no ser probadas correctamente.

**Impacto:** 5 — Catastrófico

**Justificación de impacto:**

El impacto sería muy alto si la clínica no pudiera recuperar información necesaria para continuar
con la atención de los pacientes.

**Nivel resultante en SimpleRisk:** High — 8

**Controles existentes asumidos:**

- Realización de copias de seguridad periódicas.
- Almacenamiento de respaldos de información clínica.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

Automatizar las copias de seguridad, mantener al menos una copia aislada y realizar pruebas
periódicas de recuperación de la información.

**Propietario:** Analista de Riesgos.

---

# R04 — Caída del sistema de gestión clínica durante la atención

**ID SimpleRisk:** 1005

**Categoría académica:** Disponibilidad / Operativo

**Categoría en SimpleRisk:** Environmental Resilience

**Descripción:**

Una falla del sistema de gestión clínica podría impedir temporalmente el acceso a historias
clínicas y otra información necesaria para atender a los pacientes, provocando demoras y
afectando el funcionamiento normal de la clínica.

**Activos afectados:**

- Historias clínicas digitales
- Red de la clínica
- Servidor de gestión clínica

**Probabilidad:** 4 — Probable

**Justificación de probabilidad:**

La probabilidad se considera alta porque pueden producirse fallas en servidores, red o software.

**Impacto:** 5 — Catastrófico

**Justificación de impacto:**

El impacto sería muy alto porque el personal podría quedar sin acceso a información necesaria
para atender correctamente a los pacientes.

**Nivel resultante en SimpleRisk:** High — 8

**Controles existentes asumidos:**

- Infraestructura de servidores y red operativa.
- Mantenimiento básico de los sistemas.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

Implementar monitoreo del sistema, redundancia de los servicios críticos y procedimientos de
contingencia que permitan continuar la atención ante una interrupción.

**Propietario:** Analista de Riesgos.

---

# R05 — Phishing dirigido al personal de la clínica

**ID SimpleRisk:** 1006

**Categoría académica:** Confidencialidad / Operativo

**Categoría en SimpleRisk:** Policy and Procedure

**Descripción:**

Un empleado podría recibir un correo falso y entregar sus credenciales o abrir un archivo
malicioso. Esto podría permitir el acceso no autorizado a sistemas de la clínica o comprometer
información de pacientes.

**Activos afectados:**

- Correo electrónico corporativo
- Cuentas de usuarios
- Estaciones de trabajo

**Probabilidad:** 4 — Probable

**Justificación de probabilidad:**

La probabilidad se considera alta porque los correos de phishing son un mecanismo frecuente
para intentar engañar a los usuarios.

**Impacto:** 4 — Mayor

**Justificación de impacto:**

El impacto es importante porque una cuenta comprometida podría permitir el acceso a información
o sistemas internos de la clínica.

**Nivel resultante en SimpleRisk:** Medium — 6.4

**Controles existentes asumidos:**

- Antivirus en estaciones de trabajo.
- Filtrado básico de correo electrónico.
- Autenticación mediante usuario y contraseña.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

Capacitar al personal para identificar correos sospechosos, reforzar el filtrado del correo y
utilizar autenticación multifactor para reducir el impacto del robo de credenciales.

**Propietario:** Analista de Riesgos.

---

# R06 — Modificación incorrecta de información médica de pacientes

**ID SimpleRisk:** 1007

**Categoría académica:** Integridad

**Categoría en SimpleRisk:** Sensitive Data Management

**Descripción:**

Un empleado podría modificar por error o de forma intencional información de una historia clínica,
como antecedentes, diagnósticos u otros datos del paciente. Esto podría provocar información
incorrecta y afectar la atención médica.

**Activos afectados:**

- Datos médicos de pacientes
- Historias clínicas digitales
- Servidor de gestión clínica

**Probabilidad:** 3 — Posible

**Justificación de probabilidad:**

La probabilidad se considera media porque pueden ocurrir errores durante la carga o modificación
de información.

**Impacto:** 5 — Catastrófico

**Justificación de impacto:**

El impacto sería muy alto porque una información médica incorrecta podría afectar las decisiones
tomadas durante la atención de un paciente.

**Nivel resultante en SimpleRisk:** Medium — 6

**Controles existentes asumidos:**

- Autenticación de usuarios.
- Permisos para acceder al sistema de gestión clínica.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

Limitar los permisos de modificación, mantener registros de auditoría de los cambios y establecer
controles de validación para información clínica crítica.

**Propietario:** Analista de Riesgos.

---

# R07 — Filtración de datos de pacientes y obras sociales

**ID SimpleRisk:** 1008

**Categoría académica:** Confidencialidad / Legal

**Categoría en SimpleRisk:** Sensitive Data Management

**Descripción:**

Un atacante podría acceder y extraer información de pacientes, historias clínicas o datos de
obras sociales. Esto podría provocar la exposición de información privada y generar consecuencias
legales y reputacionales para la clínica.

**Activos afectados:**

- Cuentas de usuarios
- Datos de obras sociales
- Historias clínicas digitales
- Datos médicos de pacientes

**Probabilidad:** 4 — Probable

**Justificación de probabilidad:**

La probabilidad se considera alta porque los datos de salud constituyen información sensible y
pueden ser objetivo de ataques.

**Impacto:** 5 — Catastrófico

**Justificación de impacto:**

El impacto sería muy alto por la exposición de información privada de pacientes y por las
posibles consecuencias legales y reputacionales para la clínica.

**Nivel resultante en SimpleRisk:** High — 8

**Controles existentes asumidos:**

- Autenticación mediante cuentas de usuario.
- Restricciones básicas de acceso a los sistemas.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

Reforzar los controles de acceso, aplicar el principio de mínimo privilegio, monitorear accesos
a información sensible y proteger los datos almacenados y transmitidos.

**Propietario:** Analista de Riesgos.

---

# Resumen de riesgos

| ID | Riesgo | Prob. | Impacto | Nivel SimpleRisk | Tratamiento |
|---|---|---:|---:|---|---|
| R01 | Ransomware sobre historias clínicas | 4 | 5 | High — 8 | Mitigar |
| R02 | Acceso no autorizado a historias clínicas | 4 | 4 | Medium — 6.4 | Mitigar |
| R03 | Falla o pérdida de copias de seguridad | 4 | 5 | High — 8 | Mitigar |
| R04 | Caída del sistema de gestión clínica | 4 | 5 | High — 8 | Mitigar |
| R05 | Phishing dirigido al personal | 4 | 4 | Medium — 6.4 | Mitigar |
| R06 | Modificación incorrecta de información médica | 3 | 5 | Medium — 6 | Mitigar |
| R07 | Filtración de datos de pacientes y obras sociales | 4 | 5 | High — 8 | Mitigar |

---

---

## Evidencia

Las siguientes capturas respaldan la creación y configuración de los riesgos y planes de mitigación en SimpleRisk.

| Evidencia | Archivo |
|---|---|
| Riesgo R01 — Ransomware sobre historias clínicas digitales | [`riesgo_R01_ransomware.png`](../informe/capturas/riesgo_R01_ransomware.png) |
| Riesgo R02 — Acceso no autorizado a historias clínicas | [`riesgo_R02_acceso_no_autorizado.png`](../informe/capturas/riesgo_R02_acceso_no_autorizado.png) |
| Riesgo R03 — Falla o pérdida de copias de seguridad | [`riesgo_R03_backups.png`](../informe/capturas/riesgo_R03_backups.png) |
| Riesgo R04 — Caída del sistema de gestión clínica | [`riesgo_R04_caida_sistema.png`](../informe/capturas/riesgo_R04_caida_sistema.png) |
| Riesgo R05 — Phishing dirigido al personal | [`riesgo_R05_phishing.png`](../informe/capturas/riesgo_R05_phishing.png) |
| Riesgo R06 — Modificación incorrecta de información médica | [`riesgo_R06_modificacion_datos.png`](../informe/capturas/riesgo_R06_modificacion_datos.png) |
| Riesgo R07 — Filtración de datos de pacientes y obras sociales | [`riesgo_R07_filtracion_datos.png`](../informe/capturas/riesgo_R07_filtracion_datos.png) |
| Plan de mitigación R01 — Ransomware | [`mitigacion_R01_ransomware.png`](../informe/capturas/mitigacion_R01_ransomware.png) |
| Plan de mitigación R03 — Copias de seguridad | [`mitigacion_R03_backups.png`](../informe/capturas/mitigacion_R03_backups.png) |
| Plan de mitigación R04 — Caída del sistema | [`mitigacion_R04_caida_sistema.png`](../informe/capturas/mitigacion_R04_caida_sistema.png) |

Las capturas se encuentran almacenadas en:

`informe/capturas/`


