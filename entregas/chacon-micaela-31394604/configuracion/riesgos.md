# Configuración y Matriz de Riesgos

## 1. Datos generales

| Campo | Información |
|---|---|
| **Organización analizada** | Clínica privada |
| **Rubro** | Salud |
| **Tamaño** | 120 empleados |
| **Actividad** | Atención aproximada de 800 pacientes por día |
| **Información principal** | Historias clínicas digitales, datos de obras sociales y facturación |
| **Situación inicial** | Auditoría externa con debilidades detectadas en la gestión de riesgos |
| **Alumna** | Micaela Chacón |
| **LU** | 31394604 |
| **Responsable del análisis** | Micaela Chacón |
| **Herramienta utilizada** | SimpleRisk |

---

## 2. Objetivo y alcance

El objetivo es construir un registro inicial de riesgos de seguridad de la información para el
escenario planteado y documentarlo utilizando SimpleRisk.

El análisis se concentra en los activos, información y recursos tecnológicos necesarios para
gestionar:

- Historias clínicas digitales.
- Datos médicos de pacientes.
- Datos de obras sociales.
- Facturación.
- Acceso de usuarios a los sistemas.
- Disponibilidad de la información.
- Recuperación de información.
- Comunicaciones electrónicas utilizadas por el personal.

---

# 3. Inventario y clasificación de activos

Para poder analizar los riesgos se identificaron los activos de información y tecnológicos
involucrados en los escenarios definidos.

Los responsables indicados son **responsables propuestos para el análisis**

| ID | Activo | Tipo | Responsable propuesto | Clasificación | Criticidad |
|:---:|---|---|---|:---:|:---:|
| **A01** | Historias clínicas digitales | Información | Área clínica | Restringida | Alta |
| **A02** | Datos médicos de pacientes | Información | Área clínica | Restringida | Alta |
| **A03** | Datos de obras sociales | Información | Administración | Confidencial | Alta |
| **A04** | Información de facturación | Información | Administración | Confidencial | Alta |
| **A05** | Sistema de gestión clínica | Software | Sistemas | Interna | Alta |
| **A06** | Servidor de gestión clínica | Hardware | Sistemas | Interna | Alta |
| **A07** | Copias de seguridad | Información | Sistemas | Restringida | Alta |
| **A08** | Cuentas y credenciales de usuarios | Información | Sistemas | Restringida | Alta |
| **A09** | Estaciones de trabajo | Hardware | Sistemas | Interna | Media |
| **A10** | Red de la clínica | Red | Sistemas | Interna | Alta |
| **A11** | Correo electrónico corporativo | Software | Sistemas | Interna | Media |

## Criterio utilizado para la clasificación

Las **historias clínicas digitales** y los **datos médicos de pacientes** se consideran
restringidos debido a la sensibilidad de la información de salud que contienen.

Los **datos de obras sociales** y la **información de facturación** se consideran confidenciales,
ya que contienen información administrativa y personal que no debería ser pública.

Las **copias de seguridad** se consideran restringidas porque pueden contener copias de la
información sensible de la organización.

Las **cuentas y credenciales** también se consideran restringidas debido a que permiten acceder
a los sistemas y a la información.

El sistema clínico, los servidores, la red, las estaciones de trabajo y el correo corporativo se
consideran activos internos de soporte para los riesgos analizados.

La criticidad se valoró considerando las consecuencias que tendría la pérdida de
confidencialidad, integridad o disponibilidad del activo.

---

# 4. Supuestos de trabajo sobre los controles existentes

La consigna informa que una auditoría externa encontró debilidades en la gestión de riesgos,
pero no describe en detalle qué controles técnicos se encuentran actualmente implementados.

Para poder completar el campo **“Controles existentes”** solicitado en el trabajo, se adoptan
algunos supuestos mínimos de trabajo.

Estos supuestos permiten construir el escenario inicial, pero **no deben interpretarse como
información confirmada sobre la clínica**.

Se considera para el análisis que:

- El acceso a los sistemas requiere cuentas de usuario y contraseñas.
- Existe una protección antimalware convencional en los equipos de trabajo.
- La clínica realiza algún tipo de copia de seguridad de su información.
- Se utiliza correo electrónico corporativo con mecanismos básicos de filtrado.
- Existe un control básico del acceso a la red desde el exterior.
- Existen permisos asociados a las cuentas de usuario para acceder a la información.

No se supone la existencia de controles avanzados como:

- Autenticación multifactor.
- EDR.
- Segmentación avanzada de red.
- Copias inmutables.
- Monitoreo centralizado.
- Pruebas periódicas de recuperación.
- Alta disponibilidad.

---

# 5. Identificación de amenazas y vulnerabilidades

A partir de los activos identificados se definieron las siguientes amenazas y condiciones de
exposición.

| ID | Activos relacionados | Amenaza | Tipo | Vulnerabilidad o condición asociada |
|:---:|---|---|:---:|---|
| **T01** | A01, A02, A05, A06, A07, A09 | Ransomware | Intencional | Posible compromiso de equipos, software o credenciales y afectación de información accesible |
| **T02** | A01, A02, A03, A04, A08 | Acceso no autorizado | Intencional | Posible robo, reutilización o uso indebido de credenciales y permisos |
| **T03** | A01, A02, A03, A04, A07 | Imposibilidad de recuperar información | Accidental | Copias incompletas, fallidas o que no puedan restaurarse correctamente |
| **T04** | A01, A05, A06, A10 | Indisponibilidad del sistema clínico | Accidental | Posibles fallas de software, hardware o conectividad |
| **T05** | A08, A09, A11 | Phishing | Intencional | Engaño al usuario mediante mensajes, enlaces o archivos fraudulentos |
| **T06** | A01, A02, A05, A08 | Alteración incorrecta de información médica | Accidental / Intencional | Errores humanos, modificaciones indebidas o controles insuficientes sobre cambios |
| **T07** | A01, A02, A03, A08 | Extracción o filtración de información | Intencional | Uso indebido de accesos o compromiso de mecanismos de autenticación |

---

# 6. Escalas de valoración

Se utiliza la matriz de **Probabilidad × Impacto**
indicada en la plantilla

## 6.1 Probabilidad

| Valor | Nivel | Descripción |
|:---:|---|---|
| **1** | Raro | El evento solo ocurriría en circunstancias excepcionales |
| **2** | Improbable | Podría ocurrir, pero no se espera que suceda |
| **3** | Posible | Existe una posibilidad real de que ocurra |
| **4** | Probable | Es muy probable que ocurra en algún momento |
| **5** | Casi seguro | Se espera que ocurra frecuentemente o ha ocurrido recientemente |

## 6.2 Impacto

| Valor | Nivel | Descripción |
|:---:|---|---|
| **1** | Insignificante | Impacto mínimo, sin consecuencias operativas o económicas relevantes |
| **2** | Menor | Alteración leve de la operación y costo bajo |
| **3** | Moderado | Impacto operativo y económico apreciable, pero recuperable |
| **4** | Mayor | Impacto significativo, pérdida de operación o datos y costo alto |
| **5** | Catastrófico | Paralización, pérdida crítica de datos o daño legal/reputacional severo |

---

# 7. Matriz de riesgo

El valor del riesgo se obtiene mediante:

**Riesgo = Probabilidad × Impacto**

| Probabilidad \ Impacto | 1 | 2 | 3 | 4 | 5 |
|:---:|---:|---:|---:|---:|---:|
| **5** | 5 | 10 | 15 | 20 | 25 |
| **4** | 4 | 8 | 12 | 16 | 20 |
| **3** | 3 | 6 | 9 | 12 | 15 |
| **2** | 2 | 4 | 6 | 8 | 10 |
| **1** | 1 | 2 | 3 | 4 | 5 |

## 7.1 Niveles de riesgo

| Resultado P × I | Nivel | Acción requerida |
|:---:|:---:|---|
| **1 – 4** | Bajo | Monitorear. Puede aceptarse |
| **5 – 9** | Medio | Plan de acción a mediano plazo |
| **10 – 15** | Alto | Tratamiento prioritario a corto plazo |
| **16 – 25** | Crítico | Acción inmediata y escalamiento a dirección |

---

# 8. Riesgo utilizado para validar SimpleRisk

Antes de analizar el escenario se creó un riesgo de prueba con el objetivo de verificar que la
instalación y el registro de riesgos funcionaran correctamente.

## R01 — Riesgo de prueba: indisponibilidad del sistema clínico

**ID SimpleRisk:** `1001`

**Objetivo:**

Comprobar que fuera posible:

- Crear un riesgo.
- Asignar probabilidad e impacto.
- Asociar activos.
- Definir un propietario.
- Guardar y consultar el riesgo dentro de SimpleRisk.

> R01 es únicamente una prueba técnica y **no forma parte de los siete riesgos evaluados para
> la clínica**.

---

# 9. Evaluación de riesgos de la clínica

## Resumen general

| ID | Riesgo | Categoría | P | I | P × I | Nivel |
|:---:|---|---|:---:|:---:|:---:|:---:|
| **R02** | Ransomware sobre historias clínicas digitales | Disponibilidad / Integridad | 4 | 5 | **20** | Crítico |
| **R03** | Acceso no autorizado a historias clínicas | Confidencialidad | 4 | 4 | **16** | Crítico |
| **R04** | Falla o pérdida de copias de seguridad | Disponibilidad | 4 | 5 | **20** | Crítico |
| **R05** | Caída del sistema de gestión clínica | Disponibilidad / Operativo | 4 | 5 | **20** | Crítico |
| **R06** | Phishing dirigido al personal | Confidencialidad / Operativo | 4 | 4 | **16** | Crítico |
| **R07** | Modificación incorrecta de información médica | Integridad | 3 | 5 | **15** | Alto |
| **R08** | Filtración de datos de pacientes y obras sociales | Confidencialidad / Legal | 4 | 5 | **20** | Crítico |

---

## R02 — Ransomware sobre historias clínicas digitales

**ID SimpleRisk:** `1002`

**Categoría académica:** Disponibilidad / Integridad

**Categoría utilizada en SimpleRisk:** Technical Vulnerability Management

**Amenaza asociada:** T01

### Descripción

Un ataque de ransomware podría cifrar información y sistemas utilizados por la clínica,
impidiendo el acceso a las historias clínicas digitales y a otros datos necesarios para continuar
con sus actividades.

### Activos afectados

- **A01** — Historias clínicas digitales.
- **A06** — Servidor de gestión clínica.
- **A07** — Copias de seguridad.
- **A09** — Estaciones de trabajo.

### Probabilidad

**4 — Probable**

### Justificación de probabilidad

La clínica depende de información digital para su actividad y el ransomware puede ingresar
mediante distintos mecanismos, como archivos maliciosos, mensajes fraudulentos o credenciales
comprometidas.

Por este motivo se considera razonable asignar una probabilidad **4 — Probable**.

### Impacto

**5 — Catastrófico**

### Justificación de impacto

Si las historias clínicas quedaran inaccesibles, la disponibilidad de información necesaria para
atender pacientes podría verse gravemente afectada.

Además, un ataque podría comprometer otros datos y dificultar la recuperación de la operación.

### Valor

**4 × 5 = 20**

### Nivel

**Crítico**

### Controles existentes considerados

De acuerdo con los supuestos de trabajo:

- Protección antimalware convencional.
- Acceso mediante cuentas y contraseñas.
- Existencia de copias de seguridad.

### Tratamiento propuesto

**Mitigar**

### Salvaguardas propuestas

- Mantener los sistemas actualizados.
- Fortalecer la protección de los equipos.
- Mantener copias de seguridad protegidas y separadas.
- Realizar pruebas periódicas de restauración.
- Capacitar al personal frente a archivos y mensajes sospechosos.

### Propietario

**Analista de Riesgos**

---

## R03 — Acceso no autorizado a historias clínicas digitales

**ID SimpleRisk:** `1003`

**Categoría académica:** Confidencialidad

**Categoría utilizada en SimpleRisk:** Access Management

**Amenaza asociada:** T02

### Descripción

Una persona no autorizada podría acceder a historias clínicas digitales mediante el uso de una
cuenta comprometida, credenciales obtenidas de forma indebida o permisos que otorguen más
acceso del necesario.

### Activos afectados

- **A08** — Cuentas y credenciales de usuarios.
- **A01** — Historias clínicas digitales.
- **A06** — Servidor de gestión clínica.

### Probabilidad

**4 — Probable**

### Justificación de probabilidad

Las credenciales son un mecanismo central para acceder a los sistemas y pueden ser robadas,
compartidas o utilizadas de manera indebida.

Por este motivo se considera **4 — Probable**.

### Impacto

**4 — Mayor**

### Justificación de impacto

Un acceso indebido podría exponer información médica privada y permitir consultar datos que
deberían encontrarse restringidos.

El impacto se considera significativo, aunque el riesgo analizado no implica necesariamente
la indisponibilidad total del servicio.

### Valor

**4 × 4 = 16**

### Nivel

**Crítico**

### Controles existentes considerados

Según los supuestos de trabajo:

- Acceso mediante usuario y contraseña.
- Permisos asociados a las cuentas.

### Tratamiento propuesto

**Mitigar**

### Salvaguardas propuestas

- Aplicar autenticación multifactor.
- Implementar políticas de contraseñas seguras.
- Revisar periódicamente los permisos.
- Aplicar el principio de mínimo privilegio.
- Revisar cuentas que ya no necesiten acceso.

### Propietario

**Analista de Riesgos**

---

## R04 — Falla o pérdida de copias de seguridad de información clínica

**ID SimpleRisk:** `1004`

**Categoría académica:** Disponibilidad

**Categoría utilizada en SimpleRisk:** Environmental Resilience

**Amenaza asociada:** T03

### Descripción

Una copia de seguridad podría encontrarse incompleta, dañada o no poder restaurarse correctamente
cuando sea necesaria después de una falla, pérdida de información o incidente de seguridad.

### Activos afectados

- **A07** — Copias de seguridad.
- **A01** — Historias clínicas digitales.
- **A06** — Servidor de gestión clínica.

### Probabilidad

**4 — Probable**

### Justificación de probabilidad

La existencia de una copia de seguridad no garantiza por sí sola que la información pueda ser
recuperada.

Si las copias no son verificadas mediante pruebas periódicas, existe una posibilidad relevante
de detectar problemas recién al momento de necesitar una restauración.

### Impacto

**5 — Catastrófico**

### Justificación de impacto

No poder recuperar información clínica después de un incidente podría generar una pérdida grave
de disponibilidad e impedir continuar normalmente con actividades que dependen de esos datos.

### Valor

**4 × 5 = 20**

### Nivel

**Crítico**

### Controles existentes considerados

Según los supuestos de trabajo:

- Se realizan copias de seguridad.

No se presupone que:

- Estén aisladas.
- Sean inmutables.
- Se realicen pruebas periódicas de restauración.

### Tratamiento propuesto

**Mitigar**

### Salvaguardas propuestas

- Automatizar las copias de seguridad.
- Mantener copias separadas de los sistemas principales.
- Realizar pruebas periódicas de recuperación.
- Documentar procedimientos de restauración.
- Verificar periódicamente la integridad de los respaldos.

### Propietario

**Analista de Riesgos**

---

## R05 — Caída del sistema de gestión clínica durante la atención

**ID SimpleRisk:** `1005`

**Categoría académica:** Disponibilidad / Operativo

**Categoría utilizada en SimpleRisk:** Environmental Resilience

**Amenaza asociada:** T04

### Descripción

Una interrupción del sistema de gestión clínica podría impedir temporalmente que el personal
acceda a las historias clínicas y a otra información utilizada durante la atención.

### Activos afectados

- **A01** — Historias clínicas digitales.
- **A06** — Servidor de gestión clínica.
- **A10** — Red de la clínica.

### Probabilidad

**4 — Probable**

### Justificación de probabilidad

Los sistemas digitales dependen de distintos componentes de software, hardware y conectividad.

Una falla en cualquiera de esos componentes puede provocar una interrupción temporal del servicio.

### Impacto

**5 — Catastrófico**

### Justificación de impacto

La clínica atiende aproximadamente 800 pacientes por día.

Una interrupción prolongada podría impedir el acceso a información necesaria para la atención
y afectar directamente el funcionamiento operativo de la organización.

### Valor

**4 × 5 = 20**

### Nivel

**Crítico**

### Controles existentes considerados

No se presupone la existencia de mecanismos específicos de alta disponibilidad o redundancia.

Como supuesto mínimo se considera únicamente que existe la infraestructura necesaria para
operar normalmente el sistema.

### Tratamiento propuesto

**Mitigar**

### Salvaguardas propuestas

- Implementar monitoreo de disponibilidad.
- Incorporar redundancia en componentes críticos cuando corresponda.
- Definir procedimientos de contingencia.
- Documentar procedimientos de recuperación.
- Realizar pruebas de continuidad.

### Propietario

**Analista de Riesgos**

---

## R06 — Phishing dirigido al personal de la clínica

**ID SimpleRisk:** `1006`

**Categoría académica:** Confidencialidad / Operativo

**Categoría utilizada en SimpleRisk:** Policy and Procedure

**Amenaza asociada:** T05

### Descripción

Un integrante del personal podría recibir un correo electrónico fraudulento y ser inducido a
entregar sus credenciales, ingresar en un sitio falso o abrir un archivo malicioso.

### Activos afectados

- **A11** — Correo electrónico corporativo.
- **A08** — Cuentas y credenciales de usuarios.
- **A09** — Estaciones de trabajo.

### Probabilidad

**4 — Probable**

### Justificación de probabilidad

El correo electrónico constituye un canal que puede ser utilizado para intentar engañar a los
usuarios.

La combinación de interacción humana y mensajes fraudulentos hace que exista una probabilidad
relevante de exposición.

### Impacto

**4 — Mayor**

### Justificación de impacto

El compromiso de una cuenta podría facilitar accesos indebidos a información o sistemas internos
de la clínica y utilizarse como punto de entrada para otros incidentes.

### Valor

**4 × 4 = 16**

### Nivel

**Crítico**

### Controles existentes considerados

Según los supuestos de trabajo:

- Filtrado básico del correo.
- Protección antimalware convencional.
- Autenticación mediante usuario y contraseña.

### Tratamiento propuesto

**Mitigar**

### Salvaguardas propuestas

- Capacitar al personal para reconocer intentos de phishing.
- Fortalecer el filtrado de mensajes.
- Aplicar autenticación multifactor.
- Incorporar un mecanismo sencillo para reportar mensajes sospechosos.
- Realizar actividades periódicas de concientización.

### Propietario

**Analista de Riesgos**

---

## R07 — Modificación incorrecta de información médica de pacientes

**ID SimpleRisk:** `1007`

**Categoría académica:** Integridad

**Categoría utilizada en SimpleRisk:** Sensitive Data Management

**Amenaza asociada:** T06

### Descripción

La información de una historia clínica podría modificarse de manera incorrecta, ya sea por error
humano o mediante una acción indebida.

Una modificación podría afectar antecedentes, diagnósticos u otros datos utilizados posteriormente
durante la atención.

### Activos afectados

- **A02** — Datos médicos de pacientes.
- **A01** — Historias clínicas digitales.
- **A06** — Servidor de gestión clínica.

### Probabilidad

**3 — Posible**

### Justificación de probabilidad

Existe una posibilidad real de que ocurran errores durante la carga o modificación de información.

Sin embargo, se considera menos probable que los riesgos anteriores, por lo que se asigna
**3 — Posible**.

### Impacto

**5 — Catastrófico**

### Justificación de impacto

Una información médica incorrecta podría ser utilizada posteriormente durante la atención y
afectar decisiones relacionadas con un paciente.

Por la sensibilidad de la información se considera un impacto **5 — Catastrófico**.

### Valor

**3 × 5 = 15**

### Nivel

**Alto**

### Controles existentes considerados

Según los supuestos de trabajo:

- Acceso mediante cuentas de usuario.
- Permisos asociados a las cuentas.

### Tratamiento propuesto

**Mitigar**

### Salvaguardas propuestas

- Limitar los permisos de modificación.
- Aplicar mínimo privilegio.
- Mantener registros de auditoría de los cambios.
- Incorporar controles de validación para información crítica.
- Revisar periódicamente los permisos.

### Propietario

**Analista de Riesgos**

---

## R08 — Filtración de datos de pacientes y obras sociales

**ID SimpleRisk:** `1008`

**Categoría académica:** Confidencialidad / Legal

**Categoría utilizada en SimpleRisk:** Sensitive Data Management

**Amenaza asociada:** T07

### Descripción

Una persona no autorizada podría acceder y extraer historias clínicas, datos médicos o información
relacionada con obras sociales.

La exposición de esta información afectaría directamente la privacidad de los pacientes.

### Activos afectados

- **A08** — Cuentas y credenciales de usuarios.
- **A03** — Datos de obras sociales.
- **A01** — Historias clínicas digitales.
- **A02** — Datos médicos de pacientes.

### Probabilidad

**4 — Probable**

### Justificación de probabilidad

La clínica maneja información de salud y datos personales sensibles.

El acceso indebido a cuentas o sistemas puede derivar en la extracción de información,
por lo que se considera una probabilidad **4 — Probable**.

### Impacto

**5 — Catastrófico**

### Justificación de impacto

Una filtración podría exponer información privada de pacientes y producir consecuencias
importantes tanto para las personas afectadas como para la organización.

También podría generar consecuencias legales y reputacionales.

### Valor

**4 × 5 = 20**

### Nivel

**Crítico**

### Controles existentes considerados

Según los supuestos de trabajo:

- Acceso mediante cuentas y contraseñas.
- Permisos asociados a los usuarios.
- Control básico del acceso externo a la red.

### Tratamiento propuesto

**Mitigar**

### Salvaguardas propuestas

- Aplicar autenticación multifactor.
- Reforzar los controles de acceso.
- Aplicar mínimo privilegio.
- Monitorear accesos a información sensible.
- Proteger la información almacenada y transmitida.
- Revisar periódicamente los permisos.

### Propietario

**Analista de Riesgos**

---

# 10. Tratamiento y riesgo residual

El riesgo residual representa una **estimación realizada como parte del análisis** acerca de cómo
podría quedar cada riesgo después de aplicar correctamente las salvaguardas propuestas.

No representa el estado actual de la clínica.

En varios casos las medidas reducen principalmente la **probabilidad**, mientras que el impacto
permanece elevado porque, si el incidente finalmente ocurre, la información involucrada sigue
siendo crítica.

| Riesgo | Estrategia | Salvaguardas principales | Tipo de salvaguarda | P residual | I residual | Valor residual | Nivel residual |
|:---:|:---:|---|---|:---:|:---:|:---:|:---:|
| **R02** | Mitigar | Protección de endpoints, actualización, capacitación y recuperación | Técnica / Administrativa | 2 | 4 | **8** | Medio |
| **R03** | Mitigar | MFA, revisión de permisos y mínimo privilegio | Técnica / Administrativa | 2 | 4 | **8** | Medio |
| **R04** | Mitigar | Backups separados y pruebas de recuperación | Técnica / Administrativa | 2 | 4 | **8** | Medio |
| **R05** | Mitigar | Monitoreo, redundancia y contingencia | Técnica / Administrativa | 2 | 4 | **8** | Medio |
| **R06** | Mitigar | Capacitación, filtrado y MFA | Técnica / Administrativa | 2 | 4 | **8** | Medio |
| **R07** | Mitigar | Control de permisos, auditoría y validación | Técnica / Administrativa | 2 | 5 | **10** | Alto |
| **R08** | Mitigar | MFA, mínimo privilegio y monitoreo de accesos | Técnica / Administrativa | 2 | 5 | **10** | Alto |

## Criterio utilizado para el riesgo residual

En **R07** y **R08** el impacto residual permanece en `5` porque las salvaguardas pueden reducir
la posibilidad de que el evento ocurra, pero si una modificación médica incorrecta o una
filtración de datos llega a materializarse, sus consecuencias pueden continuar siendo graves.

Por esta razón no se fuerza artificialmente a todos los riesgos a quedar en nivel Medio.

---

# 11. Planes de acción

Se configuraron tres planes de mitigación en SimpleRisk asociados a riesgos prioritarios.

## PA01 — Protección frente a ransomware

| Campo | Detalle |
|---|---|
| **Riesgo asociado** | R02 — Ransomware sobre historias clínicas digitales |
| **Descripción** | Fortalecer la prevención frente a ransomware y mejorar la capacidad de recuperación ante un incidente |
| **Estrategia** | Mitigar |
| **Fecha de vencimiento** | 05/10/2026 |
| **Responsable** | Analista de Riesgos |
| **Presupuesto configurado** | Rango `$0 – $100.000` |
| **Estado inicial** | 0 % |

### Acciones principales

- Actualización de sistemas.
- Fortalecimiento de la protección de equipos.
- Copias de seguridad protegidas.
- Pruebas de recuperación.
- Capacitación del personal.

---

## PA02 — Fortalecimiento de copias de seguridad

| Campo | Detalle |
|---|---|
| **Riesgo asociado** | R04 — Falla o pérdida de copias de seguridad |
| **Descripción** | Mejorar los mecanismos de respaldo y asegurar que la información pueda recuperarse cuando sea necesaria |
| **Estrategia** | Mitigar |
| **Fecha de vencimiento** | 15/10/2026 |
| **Responsable** | Analista de Riesgos |
| **Presupuesto configurado** | Rango `$0 – $100.000` |
| **Estado inicial** | 0 % |

### Acciones principales

- Automatizar respaldos.
- Mantener copias separadas.
- Verificar su integridad.
- Realizar pruebas periódicas de restauración.

---

## PA03 — Continuidad del sistema clínico

| Campo | Detalle |
|---|---|
| **Riesgo asociado** | R05 — Caída del sistema de gestión clínica |
| **Descripción** | Mejorar la capacidad de detectar interrupciones y continuar o recuperar la operación |
| **Estrategia** | Mitigar |
| **Fecha de vencimiento** | 20/10/2026 |
| **Responsable** | Analista de Riesgos |
| **Presupuesto configurado** | Rango `$0 – $100.000` |
| **Estado inicial** | 0 % |

### Acciones principales

- Monitoreo de disponibilidad.
- Redundancia de componentes críticos.
- Procedimientos de contingencia.
- Pruebas de recuperación.

> El rango presupuestario corresponde al valor seleccionado en SimpleRisk.
> No se asigna una moneda adicional porque la herramienta no la especifica en el registro utilizado.

---

# 12. Resumen de resultados

## 12.1 Riesgo inicial

| Nivel | Cantidad de riesgos | Porcentaje |
|:---:|:---:|:---:|
| **Crítico** | 6 | 85,7 % |
| **Alto** | 1 | 14,3 % |
| **Medio** | 0 | 0 % |
| **Bajo** | 0 | 0 % |
| **Total** | **7** | **100 %** |

## 12.2 Riesgo residual proyectado

| Nivel | Cantidad de riesgos | Porcentaje |
|:---:|:---:|:---:|
| **Crítico** | 0 | 0 % |
| **Alto** | 2 | 28,6 % |
| **Medio** | 5 | 71,4 % |
| **Bajo** | 0 | 0 % |
| **Total** | **7** | **100 %** |

---

# 13. Conclusiones y recomendaciones

El análisis inicial muestra una exposición importante debido a la sensibilidad de la información
manejada por la clínica y a la dependencia de sistemas digitales para realizar sus actividades.

De los siete riesgos correspondientes al escenario:

- Seis fueron clasificados como **Críticos**.
- Uno fue clasificado como **Alto**.

Los principales riesgos están relacionados con la disponibilidad de las historias clínicas,
el acceso no autorizado a información, la capacidad de recuperación y la exposición de datos
sensibles.

Las prioridades de tratamiento son:

1. Fortalecer la protección frente a ransomware.
2. Verificar que las copias de seguridad puedan recuperarse correctamente.
3. Mejorar la continuidad del sistema clínico.
4. Reforzar los controles de acceso.
5. Incorporar autenticación multifactor.
6. Capacitar al personal frente a phishing.
7. Mantener trazabilidad sobre modificaciones de información médica.
8. Monitorear los accesos a información sensible.

El riesgo residual muestra que implementar las salvaguardas propuestas puede reducir
considerablemente la exposición, aunque algunos riesgos mantienen un nivel **Alto** debido a
que sus consecuencias seguirían siendo importantes en caso de materializarse.

---

## Evidencia

Las siguientes capturas respaldan la creación y configuración del riesgo de prueba,
los siete riesgos correspondientes al escenario y los planes de mitigación configurados en SimpleRisk.

| Evidencia | Archivo |
|---|---|
| Riesgo R01 — Riesgo de prueba: indisponibilidad del sistema clínico | [`riesgo_R01_prueba.png`](../informe/capturas/riesgo_R01_prueba.png) |
| Riesgo R02 — Ransomware sobre historias clínicas digitales | [`riesgo_R02_ransomware.png`](../informe/capturas/riesgo_R02_ransomware.png) |
| Riesgo R03 — Acceso no autorizado a historias clínicas digitales | [`riesgo_R03_acceso_no_autorizado.png`](../informe/capturas/riesgo_R03_acceso_no_autorizado.png) |
| Riesgo R04 — Falla o pérdida de copias de seguridad | [`riesgo_R04_backups.png`](../informe/capturas/riesgo_R04_backups.png) |
| Riesgo R05 — Caída del sistema de gestión clínica | [`riesgo_R05_caida_sistema.png`](../informe/capturas/riesgo_R05_caida_sistema.png) |
| Riesgo R06 — Phishing dirigido al personal | [`riesgo_R06_phishing.png`](../informe/capturas/riesgo_R06_phishing.png) |
| Riesgo R07 — Modificación incorrecta de información médica | [`riesgo_R07_modificacion_datos.png`](../informe/capturas/riesgo_R07_modificacion_datos.png) |
| Riesgo R08 — Filtración de datos de pacientes y obras sociales | [`riesgo_R08_filtracion_datos.png`](../informe/capturas/riesgo_R08_filtracion_datos.png) |
| Plan de mitigación R02 — Ransomware | [`mitigacion_R02_ransomware.png`](../informe/capturas/mitigacion_R02_ransomware.png) |
| Plan de mitigación R04 — Copias de seguridad | [`mitigacion_R04_backups.png`](../informe/capturas/mitigacion_R04_backups.png) |
| Plan de mitigación R05 — Caída del sistema clínico | [`mitigacion_R05_caida_sistema.png`](../informe/capturas/mitigacion_R05_caida_sistema.png) |

Las capturas se encuentran almacenadas en:

`informe/capturas/`

> Las capturas utilizadas como evidencia no contienen contraseñas, tokens,
> claves API ni otra información sensible.
