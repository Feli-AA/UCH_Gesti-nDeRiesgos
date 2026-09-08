# Registro de Riesgos — Clínica San Rafael

En esta sección se documentan los riesgos identificados para la Clínica San Rafael y posteriormente cargados en SimpleRisk.

Para la evaluación se utilizó una matriz de **Probabilidad × Impacto**, asignando valores de 1 a 5 para cada variable.

La clasificación utilizada es la siguiente:

* **1 a 4:** Bajo
* **5 a 9:** Medio
* **10 a 15:** Alto
* **16 a 25:** Crítico

---

## R01 — Ransomware sobre el sistema de Historias Clínicas Electrónicas

**Descripción:**
Un ataque de ransomware podría comprometer el sistema de Historias Clínicas Electrónicas (HCE), cifrando la información almacenada e impidiendo que médicos y personal autorizado accedan a los antecedentes, diagnósticos e indicaciones de los pacientes.

* **Categoría:** Disponibilidad / Integridad
* **Activos afectados:** A01 — Sistema HCE y A08 — Backups de historias clínicas
* **Probabilidad:** 4 — Probable
* **Impacto:** 5 — Catastrófico
* **Valor del riesgo:** 20
* **Nivel:** Crítico
* **Propietario:** Martín Sosa

### Justificación de la probabilidad

Se asigna una probabilidad de 4 debido a que las organizaciones de salud constituyen objetivos atractivos para ataques de ransomware por la criticidad de sus sistemas y de la información que administran. En el escenario analizado, además, se considera que la clínica no cuenta inicialmente con una solución EDR ni con una estrategia completa de copias de seguridad resilientes.

### Justificación del impacto

Se asigna un impacto de 5 porque la indisponibilidad de las historias clínicas podría afectar a toda la atención médica, impidiendo consultar antecedentes, diagnósticos, tratamientos e indicaciones de los pacientes.

### Controles existentes

No se identificaron controles suficientes para reducir significativamente este riesgo en el escenario inicial.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Implementar una solución EDR en los equipos y servidores.
* Aplicar una estrategia de backups 3-2-1.
* Segmentar la red para limitar el movimiento lateral de un atacante.

---

## R02 — Acceso no autorizado al sistema HCE

**Descripción:**
Un atacante o usuario no autorizado podría acceder al sistema de Historias Clínicas Electrónicas mediante credenciales comprometidas o mal protegidas, obteniendo acceso a información médica y personal de los pacientes.

* **Categoría:** Confidencialidad / Legal
* **Activos afectados:** A01 — Sistema HCE y A02 — Base de datos de pacientes
* **Probabilidad:** 3 — Posible
* **Impacto:** 5 — Catastrófico
* **Valor del riesgo:** 15
* **Nivel:** Alto
* **Propietario:** Martín Sosa

### Justificación de la probabilidad

Se asigna una probabilidad de 3 debido al uso de autenticación basada únicamente en usuario y contraseña, sumado a la ausencia de controles suficientes de auditoría y seguimiento de accesos.

### Justificación del impacto

Se asigna un impacto de 5 porque las historias clínicas contienen información personal y datos relacionados con la salud de los pacientes. Un acceso no autorizado podría generar una exposición grave de información sensible, además de consecuencias legales y reputacionales para la clínica.

### Controles existentes

El sistema cuenta únicamente con autenticación mediante usuario y contraseña.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Implementar autenticación multifactor (MFA).
* Aplicar control de acceso basado en roles (RBAC).
* Registrar y auditar los accesos al sistema HCE.

---

## R03 — Phishing al personal administrativo

**Descripción:**
El personal administrativo podría recibir correos fraudulentos diseñados para obtener credenciales, instalar software malicioso o inducir a realizar operaciones no autorizadas.

* **Categoría:** Confidencialidad / Operativo
* **Activos afectados:** A05 — Correo institucional, A03 — Sistema de facturación y A07 — Personal administrativo
* **Probabilidad:** 4 — Probable
* **Impacto:** 3 — Moderado
* **Valor del riesgo:** 12
* **Nivel:** Alto
* **Propietario:** Federico García

### Justificación de la probabilidad

Se asigna una probabilidad de 4 debido a que el phishing es una técnica ampliamente utilizada para obtener acceso inicial a organizaciones y explota principalmente el factor humano. El personal administrativo mantiene comunicación frecuente con pacientes, obras sociales y proveedores, aumentando la exposición a correos externos.

### Justificación del impacto

Se asigna un impacto de 3 porque un ataque exitoso podría provocar robo de credenciales, fraude o pérdidas económicas. Sin embargo, se considera que el alcance inicial podría limitarse mediante controles y procedimientos internos.

### Controles existentes

Existe únicamente un filtro básico de correo no deseado.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Capacitación periódica del personal sobre phishing e ingeniería social.
* Implementación de MFA en el correo institucional.
* Doble verificación para operaciones o solicitudes sensibles.

---

## R04 — Fuga de datos de pacientes

**Descripción:**
La información almacenada en la base de datos de pacientes podría ser extraída o expuesta de manera no autorizada debido a controles insuficientes de protección de la información.

* **Categoría:** Confidencialidad / Legal
* **Activo afectado:** A02 — Base de datos de pacientes
* **Probabilidad:** 3 — Posible
* **Impacto:** 5 — Catastrófico
* **Valor del riesgo:** 15
* **Nivel:** Alto
* **Propietario:** Martín Sosa

### Justificación de la probabilidad

Se asigna una probabilidad de 3 debido a que en el escenario inicial la información almacenada no cuenta con cifrado en reposo y existen debilidades en los mecanismos de protección y auditoría de la base de datos.

### Justificación del impacto

Se asigna un impacto de 5 porque una fuga podría exponer datos personales y de salud de una gran cantidad de pacientes. Esto podría generar consecuencias legales, económicas y reputacionales para la organización.

### Controles existentes

No se identificaron controles suficientes de protección de los datos almacenados.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Cifrar la información en reposo.
* Implementar rotación periódica de credenciales.
* Registrar y auditar accesos a la base de datos.

---

## R05 — Caída del sistema de turnos por ataque DDoS

**Descripción:**
Un ataque distribuido de denegación de servicio podría saturar la plataforma de turnos online e impedir temporalmente que pacientes y personal administrativo accedan al servicio.

* **Categoría:** Disponibilidad / Operativo
* **Activo afectado:** A06 — Sistema de turnos
* **Probabilidad:** 3 — Posible
* **Impacto:** 3 — Moderado
* **Valor del riesgo:** 9
* **Nivel:** Medio
* **Propietario:** Martín Sosa

### Justificación de la probabilidad

Se asigna una probabilidad de 3 debido a que la plataforma se encuentra expuesta a Internet y en el escenario inicial no posee una protección específica frente a ataques de denegación de servicio.

### Justificación del impacto

Se asigna un impacto de 3 porque la caída impediría solicitar y administrar turnos temporalmente, generando demoras y problemas operativos. Sin embargo, la clínica podría mantener parcialmente el servicio mediante mecanismos alternativos hasta recuperar la plataforma.

### Controles existentes

No se identificaron controles específicos contra ataques DDoS.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Incorporar protección contra ataques DDoS.
* Definir un procedimiento de contingencia mediante atención telefónica mientras el sistema se encuentre fuera de servicio.

---

## R06 — Ataque a equipamiento médico conectado

**Descripción:**
Un atacante que consiga acceso a la red interna podría intentar comprometer dispositivos médicos conectados, como monitores de signos vitales o bombas de infusión, afectando su disponibilidad o funcionamiento.

* **Categoría:** Integridad / Disponibilidad / Operativo
* **Activo afectado:** A04 — Red de equipamiento médico (IoT)
* **Probabilidad:** 2 — Improbable
* **Impacto:** 5 — Catastrófico
* **Valor del riesgo:** 10
* **Nivel:** Alto
* **Propietario:** Martín Sosa

### Justificación de la probabilidad

Se asigna una probabilidad de 2 porque para comprometer estos dispositivos un atacante necesitaría superar controles previos y obtener acceso a la infraestructura de red interna de la clínica.

### Justificación del impacto

Se asigna un impacto de 5 debido a que una alteración o indisponibilidad del equipamiento médico podría afectar directamente la atención de los pacientes e incluso generar situaciones de riesgo para su seguridad física.

### Controles existentes

No se identificaron controles específicos suficientes para aislar y proteger el equipamiento médico conectado.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Crear una VLAN específica para el equipamiento médico.
* Segmentar la red administrativa de la red de dispositivos médicos.
* Mantener actualizado el firmware de los dispositivos siempre que sea técnicamente posible.

---

## R07 — Acceso no autorizado a la red WiFi interna

**Descripción:**
Una persona no autorizada podría obtener acceso a la red inalámbrica interna de la clínica y utilizarla como punto de entrada para intentar alcanzar otros sistemas y dispositivos conectados.

* **Categoría:** Confidencialidad / Disponibilidad
* **Activos afectados:** A01 — Sistema HCE, A02 — Base de datos de pacientes y A04 — Red de equipamiento médico
* **Probabilidad:** 3 — Posible
* **Impacto:** 3 — Moderado
* **Valor del riesgo:** 9
* **Nivel:** Medio
* **Propietario:** Martín Sosa

### Justificación de la probabilidad

Se asigna una probabilidad de 3 debido a la circulación diaria de pacientes, acompañantes, proveedores y otras personas dentro de la clínica. Además, en el escenario inicial se utiliza una contraseña compartida que no se modifica periódicamente.

### Justificación del impacto

Se asigna un impacto de 3 porque obtener acceso a la red WiFi no implica necesariamente comprometer de forma inmediata los sistemas críticos, pero podría ser utilizado como punto de partida para reconocimiento, movimiento lateral y nuevos ataques.

### Controles existentes

La red inalámbrica se encuentra protegida mediante una contraseña compartida, pero no existe una política adecuada de rotación.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Separar la red de invitados de la red interna mediante VLAN.
* Implementar una red específica para visitantes.
* Establecer una política de rotación periódica de credenciales de acceso.

---

## R08 — Pérdida o falla de backups

**Descripción:**
Las copias de seguridad de las historias clínicas podrían resultar inutilizables debido a fallas de almacenamiento, corrupción de datos o falta de controles periódicos sobre su integridad.

* **Categoría:** Disponibilidad / Integridad
* **Activo afectado:** A08 — Backups de historias clínicas
* **Probabilidad:** 2 — Improbable
* **Impacto:** 5 — Catastrófico
* **Valor del riesgo:** 10
* **Nivel:** Alto
* **Propietario:** Martín Sosa

### Justificación de la probabilidad

Se asigna una probabilidad de 2 debido a que una falla total del sistema de almacenamiento no se considera frecuente. Sin embargo, la ausencia de verificaciones periódicas aumenta la posibilidad de descubrir una copia defectuosa recién cuando sea necesario restaurarla.

### Justificación del impacto

Se asigna un impacto de 5 porque la imposibilidad de recuperar las historias clínicas luego de un incidente podría provocar una pérdida irreversible de información esencial para la atención y continuidad operativa de la clínica.

### Controles existentes

La clínica realiza copias de seguridad, pero no cuenta con un procedimiento periódico de verificación de integridad y restauración.

### Tratamiento propuesto

**Mitigar.**

Se propone:

* Aplicar una estrategia de copias de seguridad 3-2-1.
* Realizar verificaciones periódicas de integridad.
* Ejecutar pruebas de restauración para comprobar que las copias sean recuperables.

---

## Resumen de la evaluación

| ID  | Riesgo                              | Probabilidad | Impacto | Valor | Nivel   |
| --- | ----------------------------------- | -----------: | ------: | ----: | ------- |
| R01 | Ransomware sobre HCE                |            4 |       5 |    20 | Crítico |
| R02 | Acceso no autorizado a HCE          |            3 |       5 |    15 | Alto    |
| R03 | Phishing al personal administrativo |            4 |       3 |    12 | Alto    |
| R04 | Fuga de datos de pacientes          |            3 |       5 |    15 | Alto    |
| R05 | Caída del sistema de turnos (DDoS)  |            3 |       3 |     9 | Medio   |
| R06 | Ataque a equipamiento médico (IoT)  |            2 |       5 |    10 | Alto    |
| R07 | Acceso no autorizado a WiFi interna |            3 |       3 |     9 | Medio   |
| R08 | Pérdida o falla de backups          |            2 |       5 |    10 | Alto    |

En total se identificaron **ocho riesgos**: uno de nivel Crítico, cinco de nivel Alto y dos de nivel Medio.

R06 y R08 presentan el mismo valor de riesgo (10). Ante este empate, se prioriza R06 debido a que un compromiso del equipamiento médico podría producir una afectación directa e inmediata sobre la seguridad del paciente, mientras que R08 se encuentra principalmente relacionado con la capacidad de recuperación de la información ante un incidente.
