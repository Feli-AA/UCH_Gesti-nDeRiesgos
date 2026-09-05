# Registro de riesgos

## Riesgo de prueba

Se creó un primer riesgo para verificar el funcionamiento de la instalación y los permisos asignados al rol Analista de Riesgos.

| Campo | Valor |
|---|---|
| ID en SimpleRisk | 1001 |
| Referencia externa | TEST-001 |
| Nombre | Prueba funcional - indisponibilidad del sistema de turnos |
| Activo afectado | Sistema de gestión de turnos |
| Categoría | Environmental Resilience |
| Fuente | System |
| Responsable | Administradora Demo |
| Registrado por | Solange Abraham |
| Probabilidad | Credible |
| Impacto | Moderate |
| Método de cálculo | Classic |
| Resultado en SimpleRisk | 3.6 - Low |
| Estado inicial | New |

SimpleRisk normaliza el producto de probabilidad e impacto a una escala de 0 a 10. Para este riesgo, la combinación seleccionada produce un resultado de 3.6.

La prueba permitió validar correctamente:

- El acceso mediante un usuario no administrador.
- El cambio obligatorio de contraseña.
- La autenticación multifactor.
- Los permisos del rol Analista de Riesgos.
- La creación y asociación de un activo.
- El registro y cálculo de un riesgo.

## Evidencia

La captura del riesgo creado se encuentra en:
informe/capturas/05_riesgo_prueba.png

## Registro inicial de riesgos de la clínica

### Contexto y alcance

El análisis se realiza para una clínica privada ficticia de 120 empleados que atiende aproximadamente 800 pacientes por día y utiliza sistemas digitales para gestionar historias clínicas, turnos, datos de obras sociales y facturación.

El registro contempla riesgos relacionados con las personas, los procesos, los sistemas, los proveedores y la infraestructura física. No se incluyen equipos médicos, internación, guardia o diagnóstico por imágenes porque esos elementos no están confirmados en el escenario proporcionado.

### Asignación de propietarios

Los propietarios fueron representados mediante usuarios ficticios de SimpleRisk asociados al rol Propietario de Riesgo. Este rol permite revisar riesgos, comentar y aceptar mitigaciones, pero no registrar, modificar, planificar ni cerrar riesgos.

| Responsable organizacional | Usuario asignado en SimpleRisk |
|---|---|
| Responsable de Seguridad de la Información | Olivia Rodrigo (`responsable_seguridad`) |
| Dirección Médica | Juliana Gattas (`direccion_medica`) |
| Gerencia Administrativa y Financiera | Constanza Romero (`administracion_finanzas`) |
| Jefatura de Infraestructura y TI | Frank Castle (`responsable_ti`) |

### Supuestos sobre los controles existentes

Como la consigna no detalla la infraestructura ni los controles actuales, se adoptan los siguientes supuestos mínimos para construir el registro inicial:

* La clínica utiliza cuentas de usuario y contraseñas para acceder a sus sistemas.
* Existe un firewall perimetral y protección antivirus convencional.
* Se realizan copias de seguridad, pero no existe evidencia de que estén aisladas o sean probadas periódicamente.
* Se utiliza correo electrónico corporativo con filtrado básico.
* Existen contratos de servicio con proveedores tecnológicos y obras sociales.
* La sala técnica dispone de protección eléctrica y contra incendios básica.
* La auditoría externa identificó debilidades en la gestión de riesgos, por lo que la eficacia de estos controles debe ser verificada.

Estos controles se consideran parciales y no deben interpretarse como garantías de seguridad.

### Escala de probabilidad

| Valor | Nivel       | Criterio                                                                                              |
| ----: | ----------- | ----------------------------------------------------------------------------------------------------- |
|     1 | Remota      | Solo podría ocurrir en circunstancias excepcionales y no existen antecedentes o exposición relevante. |
|     2 | Improbable  | Puede ocurrir, pero la exposición es limitada o existen controles preventivos razonables.             |
|     3 | Posible     | El evento es técnicamente viable y la organización se encuentra expuesta periódicamente.              |
|     4 | Probable    | Existe exposición frecuente, múltiples posibles puntos de entrada o controles insuficientes.          |
|     5 | Casi segura | El evento ocurre reiteradamente o existen evidencias concretas de que es inminente.                   |

### Escala de impacto

| Valor | Nivel                  | Criterio                                                                                          |
| ----: | ---------------------- | ------------------------------------------------------------------------------------------------- |
|     1 | Insignificante         | Afectación mínima, sin interrupción relevante ni exposición de información sensible.              |
|     2 | Menor                  | Incidente localizado y de corta duración, recuperable mediante procedimientos habituales.         |
|     3 | Moderado               | Interrupción limitada, costos controlables o exposición reducida de información.                  |
|     4 | Mayor                  | Interrupción importante, exposición de datos sensibles, pérdidas económicas o consecuencias legales y reputacionales relevantes. |
|     5 | Extremo o catastrófico | Paralización prolongada de servicios críticos, pérdida masiva de información o posible afectación grave de la atención de pacientes.|

### Matriz de evaluación

El nivel de riesgo se calcula mediante:

Riesgo = Probabilidad x Impacto

| Resultado | Nivel   |
| --------: | ------- |
|     1 a 4 | Bajo    |
|     5 a 9 | Medio   |
|   10 a 15 | Alto    |
|   16 a 25 | Crítico |

SimpleRisk normaliza el resultado de la fórmula clásica a una escala de 0 a 10. Para mantener la correspondencia con la matriz de la cátedra, se configuraron los siguientes límites:

| Nivel   | Resultado | Límite mínimo en SimpleRisk | Color    |
|---      |---        |---                          |---       |
| Bajo    | 1–4       | 0.0                         | Verde    |
| Medio   | 5–9       | 2.0                         | Amarillo |
| Alto    | 10–15     | 4.0                         | Naranja  |
| Crítico | 16–25     | 6.4                         | Rojo     |

### Resumen de riesgos

| ID  | Riesgo                                                     | Probabilidad | Impacto | Resultado | Nivel   |
| --- | ---------------------------------------------------------- | -----------: | ------: | --------: | ------- |
| R01 | Ransomware sobre historias clínicas y sistemas de atención |            4 |       5 |        20 | Crítico |
| R02 | Acceso indebido a historias clínicas                       |            4 |       4 |        16 | Crítico |
| R03 | Alteración de información clínica                          |            3 |       5 |        15 | Alto    |
| R04 | Robo de credenciales mediante phishing                     |            4 |       4 |        16 | Crítico |
| R05 | Exposición de datos mediante planillas o correos           |            3 |       4 |        12 | Alto    |
| R06 | Caída de los sistemas de historias clínicas y turnos       |            3 |       4 |        12 | Alto    |
| R07 | Imposibilidad de recuperar la información desde respaldos  |            3 |       5 |        15 | Alto    |
| R08 | Indisponibilidad de la integración con obras sociales      |            3 |       4 |        12 | Alto    |
| R09 | Interrupción por fallas físicas o ambientales              |            2 |       4 |         8 | Medio   |
| R10 | Pérdida o robo de un dispositivo con información clínica   |            3 |       4 |        12 | Alto    |

---

## R01 — Ransomware sobre historias clínicas y sistemas de atención

**Nombre:** Cifrado y paralización de las historias clínicas digitales y los sistemas de atención mediante ransomware.

**Descripción:**
Un atacante podría comprometer un equipo de la clínica y propagar ransomware hacia los servidores que almacenan las historias clínicas, los turnos y la información administrativa. El ataque podría cifrar los datos, impedir el acceso a los sistemas y estar acompañado por la extracción de información sensible para extorsionar a la organización.

**Categoría del análisis:** Disponibilidad, integridad y confidencialidad.

**Categoría en SimpleRisk:** Technical Vulnerability Management.

**Fuente en SimpleRisk:** External.

**Activos afectados:**

* Sistema de historias clínicas digitales.
* Base de datos de pacientes.
* Sistema de turnos.
* Sistema de facturación.
* Servidores y almacenamiento.
* Copias de seguridad.

**Probabilidad:** 4 — Probable.

**Justificación de la probabilidad:**
La clínica posee 120 empleados que utilizan sistemas y comunicaciones digitales, lo que genera múltiples posibles puntos de entrada mediante correo malicioso, credenciales comprometidas o software vulnerable. El sector sanitario es un objetivo recurrente de ransomware según las advertencias publicadas por [HHS](https://aspr.hhs.gov/readiness-response/response-operations/healthcare-public-health-cybersecurity) y la [guía StopRansomware de CISA](https://www.cisa.gov/stopransomware/ransomware-guide). No se asigna un valor 5 porque no existe evidencia de un ataque inminente o reiterado contra esta clínica.

**Impacto:** 5 — Extremo o catastrófico.

**Justificación del impacto:**
La indisponibilidad simultánea de historias clínicas, turnos y facturación podría afectar la atención de aproximadamente 800 pacientes diarios. También podría provocar pérdida o exposición masiva de datos, interrupción prolongada, costos de recuperación y daño legal y reputacional.

**Nivel resultante:** 4 × 5 = 20 — Crítico.

**Controles existentes asumidos:**

* Firewall perimetral.
* Antivirus convencional en los equipos.
* Copias de seguridad periódicas.
* Cuentas de usuario con contraseña.

No existe evidencia de segmentación, protección avanzada de endpoints o respaldos inmutables.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Implementar EDR en servidores y puestos de trabajo.
* Segmentar la red administrativa y los servidores críticos.
* Aplicar gestión periódica de parches.
* Fortalecer la seguridad del correo.
* Implementar copias de seguridad bajo el esquema 3-2-1, con una copia aislada o inmutable.
* Probar periódicamente la restauración.
* Desarrollar y ensayar un procedimiento de respuesta a ransomware.

**Propietario del riesgo:** Olivia Rodrigo — Responsable de Seguridad de la Información.

---

## R02 — Acceso indebido a historias clínicas

**Nombre:** Acceso no autorizado a historias clínicas por privilegios excesivos, cuentas compartidas o accesos no revocados.

**Descripción:**
Un empleado, proveedor o exempleado podría consultar historias clínicas que no necesita para realizar su función debido a permisos demasiado amplios, utilización de cuentas compartidas o falta de revocación de accesos después de un cambio de puesto o desvinculación.

**Categoría del análisis:** Confidencialidad y legal.

**Categoría en SimpleRisk:** Access Management.

**Fuente en SimpleRisk:** People.

**Activos afectados:**

* Historias clínicas digitales.
* Base de datos de pacientes.
* Datos identificatorios y de contacto.
* Credenciales y perfiles de usuario.
* Registros de acceso.

**Probabilidad:** 4 — Probable.

**Justificación de la probabilidad:**
Una organización con 120 empleados posee diferentes funciones médicas, administrativas y técnicas. Si los permisos no se revisan periódicamente, existe una exposición frecuente a accesos que ya no son necesarios. La probabilidad se considera alta por la cantidad de usuarios y movimientos internos, pero no casi segura porque se asume que existen cuentas y roles básicos.

**Impacto:** 4 — Mayor.

**Justificación del impacto:**
Las historias clínicas contienen información de salud considerada dato sensible por la [Ley 25.326](https://www.argentina.gob.ar/normativa/nacional/ley-25326-64790/actualizacion). Un acceso indebido podría producir reclamos, sanciones, daño reputacional y pérdida de confianza. No se asigna impacto 5 porque el evento no implica necesariamente una filtración masiva ni la paralización de la clínica.

**Nivel resultante:** 4 × 4 = 16 — Crítico.

**Controles existentes asumidos:**

* Cuentas individuales.
* Autenticación mediante contraseña.
* Roles básicos dentro del sistema.

No existe evidencia de revisiones periódicas, MFA generalizado o un proceso formal de altas, cambios y bajas.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Aplicar control de acceso basado en roles y mínimo privilegio.
* Prohibir cuentas compartidas.
* Implementar MFA.
* Revisar trimestralmente los permisos.
* Revocar inmediatamente los accesos durante las desvinculaciones.
* Registrar y monitorear consultas a historias clínicas.
* Generar alertas ante accesos inusuales o masivos.

**Propietario del riesgo:** Juliana Gattas — Dirección Médica.

---

## R03 — Alteración de información clínica

**Nombre:** Modificación accidental o maliciosa de diagnósticos, alergias o prescripciones en las historias clínicas.

**Descripción:**
Un usuario autorizado, una cuenta comprometida o un error de carga podría modificar información clínica relevante sin que el cambio sea detectado. Esto podría provocar que profesionales posteriores tomen decisiones basadas en datos incorrectos.

**Categoría del análisis:** Integridad y operativo.

**Categoría en SimpleRisk:** Sensitive Data Management.

**Fuente en SimpleRisk:** People.

**Activos afectados:**

* Historias clínicas digitales.
* Diagnósticos registrados.
* Antecedentes y alergias.
* Prescripciones y tratamientos.
* Registros de auditoría.

**Probabilidad:** 3 — Posible.

**Justificación de la probabilidad:**
La información clínica es cargada y actualizada regularmente por distintos usuarios, por lo que los errores humanos o el uso indebido de una cuenta son técnicamente posibles. No existe información que permita afirmar que estos incidentes sean frecuentes, por lo que se asigna un valor intermedio.

**Impacto:** 5 — Extremo o catastrófico.

**Justificación del impacto:**
Una alteración no detectada podría afectar directamente la calidad de la información utilizada durante la atención. Un dato incorrecto sobre alergias, antecedentes o tratamientos podría provocar una decisión clínica inadecuada, además de consecuencias legales y pérdida de trazabilidad.

**Nivel resultante:** 3 × 5 = 15 — Alto.

**Controles existentes asumidos:**

* Autenticación de usuarios.
* Validaciones básicas de los formularios.
* Copias de seguridad de la base de datos.

No existe evidencia de versionado de registros, doble validación o auditoría inalterable.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Mantener un historial de versiones de cada modificación.
* Registrar usuario, fecha, hora y contenido modificado.
* Proteger los logs contra alteraciones.
* Incorporar validaciones para campos clínicos críticos.
* Solicitar confirmación adicional para cambios sensibles.
* Revisar periódicamente modificaciones inusuales.
* Capacitar al personal en calidad e integridad de datos.

**Propietario del riesgo:** Juliana Gattas — Dirección Médica.

---

## R04 — Robo de credenciales mediante phishing

**Nombre:** Obtención de credenciales mediante correos de phishing dirigidos al personal de la clínica.

**Descripción:**
Un atacante podría enviar mensajes que simulen provenir de la clínica, una obra social o un proveedor para inducir a empleados médicos o administrativos a ingresar sus credenciales en un sitio falso o abrir un archivo malicioso.

**Categoría del análisis:** Confidencialidad y humano.

**Categoría en SimpleRisk:** Policy and Procedure.

**Fuente en SimpleRisk:** External.

**Activos afectados:**

* Cuentas de usuario.
* Correo electrónico corporativo.
* Puestos de trabajo.
* Historias clínicas.
* Sistema de facturación.
* Datos de pacientes y obras sociales.

**Probabilidad:** 4 — Probable.

**Justificación de la probabilidad:**
Los 120 empleados se comunican con pacientes, proveedores y obras sociales, por lo que reciben contenido externo con frecuencia. HHS recomienda específicamente capacitar al personal sanitario para reconocer intentos de phishing, y CISA incluye el uso de MFA y la prevención del phishing entre sus prácticas esenciales. [HHS HICP](https://hhscyber.hhs.gov/cornerstone-hicp.html) y [CISA Secure Our World](https://www.cisa.gov/secure-our-world).

**Impacto:** 4 — Mayor.

**Justificación del impacto:**
Una cuenta comprometida podría permitir el acceso a datos sensibles, el envío de nuevos mensajes fraudulentos o el ingreso inicial para otros ataques. Se asigna 4 porque el robo de una cuenta produce una afectación importante, pero no implica automáticamente una interrupción total o pérdida masiva.

**Nivel resultante:** 4 × 4 = 16 — Crítico.

**Controles existentes asumidos:**

* Filtrado básico de correo no deseado.
* Antivirus convencional.
* Uso de contraseñas.

No existe evidencia de MFA generalizado, simulaciones de phishing o capacitación periódica.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Implementar MFA.
* Configurar SPF, DKIM y DMARC.
* Mejorar el filtrado de enlaces y archivos.
* Capacitar periódicamente al personal.
* Realizar simulaciones de phishing.
* Incorporar un mecanismo sencillo para reportar correos sospechosos.
* Bloquear rápidamente cuentas comprometidas.
* Utilizar un gestor corporativo de contraseñas.

**Propietario del riesgo:** Olivia Rodrigo — Responsable de Seguridad de la Información.

---

## R05 — Exposición de datos mediante planillas o correos

**Nombre:** Exposición accidental de datos de pacientes y obras sociales mediante planillas, exportaciones o correos sin protección.

**Descripción:**
Durante procesos administrativos o de facturación, un empleado podría exportar datos de pacientes y obras sociales y enviarlos al destinatario equivocado, almacenarlos en una ubicación compartida sin restricciones o transmitirlos sin cifrado.

**Categoría del análisis:** Confidencialidad y legal.

**Categoría en SimpleRisk:** Sensitive Data Management.

**Fuente en SimpleRisk:** Process.

**Activos afectados:**

* Datos personales de pacientes.
* Datos de salud.
* Padrones de obras sociales.
* Información de facturación.
* Correo corporativo.
* Archivos y planillas exportadas.

**Probabilidad:** 3 — Posible.

**Justificación de la probabilidad:**
El escenario incluye intercambio y procesamiento habitual de datos de obras sociales y facturación. Los errores de destinatario, permisos o almacenamiento son posibles durante tareas repetitivas, aunque no existe evidencia de que ocurran de manera frecuente.

**Impacto:** 4 — Mayor.

**Justificación del impacto:**
Una planilla puede contener información de múltiples pacientes y combinar datos identificatorios, de salud y cobertura. Su exposición podría producir incumplimientos de confidencialidad, reclamos y daño reputacional. La Ley 25.326 exige especial protección para los datos de salud.

**Nivel resultante:** 3 × 4 = 12 — Alto.

**Controles existentes asumidos:**

* Correo corporativo.
* Carpetas compartidas protegidas mediante usuario y contraseña.
* Procedimientos administrativos informales.

No existe evidencia de clasificación, DLP, cifrado obligatorio o restricciones de exportación.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Clasificar la información sensible.
* Restringir las exportaciones masivas.
* Implementar DLP.
* Cifrar archivos y comunicaciones.
* Utilizar un portal seguro para intercambiar información.
* Confirmar destinatarios antes del envío.
* Establecer plazos de eliminación para copias temporales.
* Registrar descargas y exportaciones masivas.

**Propietario del riesgo:** Constanza Romero — Gerencia Administrativa y Financiera.

---

## R06 — Caída de los sistemas de historias clínicas y turnos

**Nombre:** Indisponibilidad de las historias clínicas y del sistema de turnos por falla de la infraestructura principal.

**Descripción:**
Una falla de hardware, almacenamiento, sistema operativo, aplicación o base de datos podría dejar inaccesibles las historias clínicas y los turnos si los componentes críticos no poseen redundancia o mecanismos de conmutación.

**Categoría del análisis:** Disponibilidad y operativo.

**Categoría en SimpleRisk:** Environmental Resilience.

**Fuente en SimpleRisk:** System.

**Activos afectados:**

* Aplicación de historias clínicas.
* Base de datos de pacientes.
* Sistema de turnos.
* Servidores y almacenamiento.
* Infraestructura de red.

**Probabilidad:** 3 — Posible.

**Justificación de la probabilidad:**
Todo componente tecnológico puede fallar y los sistemas son utilizados diariamente. Como no se dispone de evidencia sobre redundancia, se considera posible una interrupción, pero no probable porque se asume que existe mantenimiento técnico básico.

**Impacto:** 4 — Mayor.

**Justificación del impacto:**
La caída dificultaría consultar antecedentes y gestionar turnos para aproximadamente 800 pacientes diarios. La clínica podría recurrir temporalmente a procedimientos manuales, por lo que se considera un impacto mayor pero no necesariamente catastrófico.

**Nivel resultante:** 3 × 4 = 12 — Alto.

**Controles existentes asumidos:**

* Monitoreo técnico básico.
* Mantenimiento reactivo.
* Soporte del proveedor.
* Copias de seguridad.

No existe evidencia de alta disponibilidad, redundancia o pruebas de conmutación.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Implementar redundancia en componentes críticos.
* Definir mecanismos de failover.
* Monitorear servidores, almacenamiento y base de datos.
* Mantener repuestos o soporte con tiempos garantizados.
* Definir RTO y RPO.
* Documentar un procedimiento manual de contingencia.
* Realizar pruebas periódicas de caída y recuperación.

**Propietario del riesgo:** Frank Castle — Jefatura de Infraestructura y TI.

---

## R07 — Imposibilidad de recuperar la información

**Nombre:** Imposibilidad de restaurar las historias clínicas y sistemas críticos debido a respaldos dañados, cifrados o no probados.

**Descripción:**
Después de un ataque, error o falla técnica, la clínica podría descubrir que sus copias de seguridad están incompletas, dañadas, fueron cifradas junto con los sistemas principales o no pueden restaurarse dentro del tiempo requerido.

**Categoría del análisis:** Disponibilidad y continuidad operativa.

**Categoría en SimpleRisk:** Environmental Resilience.

**Fuente en SimpleRisk:** Process.

**Activos afectados:**

* Copias de seguridad.
* Historias clínicas digitales.
* Base de datos de pacientes.
* Sistema de turnos.
* Sistema de facturación.
* Procedimientos de recuperación.

**Probabilidad:** 3 — Posible.

**Justificación de la probabilidad:**
Se asume que existen respaldos, pero no hay evidencia de aislamiento ni pruebas periódicas. CISA advierte que numerosas variantes de ransomware intentan localizar, eliminar o cifrar los respaldos accesibles. [CISA StopRansomware](https://www.cisa.gov/stopransomware/ransomware-guide).

**Impacto:** 5 — Extremo o catastrófico.

**Justificación del impacto:**
La imposibilidad de restaurar podría transformar una interrupción temporal en pérdida prolongada o permanente de historias clínicas y datos administrativos. También impediría cumplir los objetivos de recuperación y reanudar la atención normal.

**Nivel resultante:** 3 × 5 = 15 — Alto.

**Controles existentes asumidos:**

* Copias de seguridad programadas.
* Almacenamiento de respaldo accesible desde la infraestructura principal.

No existe evidencia de copias inmutables, aislamiento o pruebas completas de restauración.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Implementar el esquema 3-2-1.
* Mantener una copia desconectada o inmutable.
* Separar las credenciales de respaldo.
* Cifrar las copias.
* Definir RTO y RPO por sistema.
* Probar restauraciones completas trimestralmente.
* Registrar y corregir los resultados de cada prueba.
* Monitorear automáticamente la ejecución de las copias.

**Propietario del riesgo:** Frank Castle — Jefatura de Infraestructura y TI.

---

## R08 — Indisponibilidad de la integración con obras sociales

**Nombre:** Interrupción de la validación y facturación con obras sociales por fallas del proveedor, del servicio o de la conectividad.

**Descripción:**
La clínica podría perder temporalmente la comunicación con los servicios utilizados para validar coberturas, solicitar autorizaciones o presentar prestaciones debido a fallas de terceros, errores de integración o interrupciones del enlace de Internet.

**Categoría del análisis:** Operativo, financiero y terceros.

**Categoría en SimpleRisk:** Third-Party Management.

**Fuente en SimpleRisk:** External.

**Activos afectados:**

* Integración con obras sociales.
* Sistema de facturación.
* Enlace de Internet.
* Datos de cobertura.
* Registros de prestaciones y autorizaciones.
* Ingresos de la clínica.

**Probabilidad:** 3 — Posible.

**Justificación de la probabilidad:**
La operación depende diariamente de servicios y redes que la clínica no controla completamente. Pueden ocurrir caídas del proveedor o de conectividad, pero no existen antecedentes que permitan considerarlas frecuentes. HHS recomienda identificar, evaluar y mitigar riesgos relacionados con productos y servicios de terceros. [HHS Cybersecurity Performance Goals](https://hhscyber.hhs.gov/cybersecurity-performance-goals.html).

**Impacto:** 4 — Mayor.

**Justificación del impacto:**
Una interrupción podría generar demoras en admisión, imposibilidad de validar cobertura y pérdidas económicas por prestaciones no autorizadas o no facturadas. El volumen aproximado de 800 pacientes diarios amplifica la afectación.

**Nivel resultante:** 3 × 4 = 12 — Alto.

**Controles existentes asumidos:**

* Contratos con los proveedores.
* Soporte técnico.
* Reintentos manuales de las operaciones.
* Conectividad principal a Internet.

No existe evidencia de enlaces redundantes, SLA específicos de seguridad o procedimientos formales de contingencia.

**Tratamiento propuesto:** Transferir parcialmente y mitigar el riesgo residual.

**Medidas propuestas:**

* Incorporar SLA de disponibilidad y tiempos de recuperación.
* Establecer cláusulas de seguridad y notificación de incidentes.
* Contratar un enlace secundario de Internet.
* Implementar colas y reintentos automáticos.
* Mantener un procedimiento temporal de validación.
* Conciliar posteriormente las operaciones realizadas durante la caída.
* Evaluar periódicamente la seguridad de los proveedores.

**Propietario del riesgo:** Constanza Romero — Gerencia Administrativa y Financiera.

---

## R09 — Interrupción por fallas físicas o ambientales

**Nombre:** Indisponibilidad de servidores y comunicaciones por corte eléctrico, temperatura, incendio o filtración de agua.

**Descripción:**
Un evento físico o ambiental podría afectar la sala que aloja servidores o equipos de red, producir un apagado inesperado, dañar componentes y dejar indisponibles los sistemas de la clínica.

**Categoría del análisis:** Disponibilidad y físico.

**Categoría en SimpleRisk:** Physical Security.

**Fuente en SimpleRisk:** External.

**Activos afectados:**

* Sala técnica.
* Servidores.
* Almacenamiento.
* Equipos de red.
* UPS.
* Sistemas de historias clínicas y turnos.

**Probabilidad:** 2 — Improbable.

**Justificación de la probabilidad:**
Se asume que existen una UPS y protección básica contra incendios, lo que reduce la posibilidad de una interrupción. Sin embargo, el evento continúa siendo posible si los equipos no son mantenidos o monitoreados. NIST contempla amenazas naturales, errores humanos y fallas estructurales dentro de la gestión de controles físicos y ambientales. [NIST SP 800-53 Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final).

**Impacto:** 4 — Mayor.

**Justificación del impacto:**
El daño de servidores o equipos de red podría dejar inaccesibles los sistemas durante varias horas o días, provocar corrupción de datos y requerir reemplazos costosos. Se asigna 4 porque se asume que existen respaldos y procedimientos básicos de recuperación.

**Nivel resultante:** 2 × 4 = 8 — Medio.

**Controles existentes asumidos:**

* UPS.
* Extintores convencionales.
* Acceso físico restringido.
* Mantenimiento básico.

No existe evidencia de sensores, supresión automática, generador probado o monitoreo ambiental continuo.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Probar periódicamente la UPS y el generador.
* Incorporar monitoreo de temperatura y humedad.
* Instalar sensores de humo y agua.
* Implementar protección contra incendios adecuada para equipamiento.
* Elevar equipos y cableado respecto del nivel del suelo.
* Controlar y registrar el acceso físico.
* Evaluar periódicamente los riesgos de la ubicación.
* Incorporar el escenario al plan de continuidad.

 **Propietario del riesgo:** Frank Castle — Jefatura de Infraestructura y TI.

---

## R10 — Pérdida o robo de un dispositivo

**Nombre:** Exposición de información clínica por pérdida o robo de una notebook o dispositivo sin cifrado.

**Descripción:**
Un empleado podría perder o sufrir el robo de una notebook u otro dispositivo utilizado para acceder o almacenar temporalmente información clínica. Si el dispositivo no posee cifrado y controles adecuados, un tercero podría acceder a datos o credenciales.

**Categoría del análisis:** Confidencialidad, físico y legal.

**Categoría en SimpleRisk:** Sensitive Data Management.

**Fuente en SimpleRisk:** People.

**Activos afectados:**

* Notebooks y dispositivos portátiles.
* Archivos clínicos almacenados localmente.
* Credenciales y sesiones.
* Datos personales y de salud.
* Acceso remoto a los sistemas de la clínica.

**Probabilidad:** 3 — Posible.

**Justificación de la probabilidad:**
En una organización de 120 empleados es razonable que existan dispositivos portátiles para tareas administrativas o técnicas. La pérdida o robo es posible durante el traslado o trabajo fuera del puesto habitual, pero no existe evidencia de incidentes frecuentes.

**Impacto:** 4 — Mayor.

**Justificación del impacto:**
El dispositivo podría contener datos de salud o credenciales válidas. La exposición produciría consecuencias legales y reputacionales relevantes. No se asigna impacto 5 porque el alcance puede limitarse a un dispositivo y reducirse mediante la revocación rápida de accesos.

**Nivel resultante:** 3 × 4 = 12 — Alto.

**Controles existentes asumidos:**

* Contraseña de inicio de sesión.
* Inventario básico de equipos.
* Bloqueo manual de sesión.

No existe evidencia de cifrado completo, administración centralizada o borrado remoto.

**Tratamiento propuesto:** Mitigar.

**Medidas propuestas:**

* Habilitar cifrado completo de disco.
* Implementar administración centralizada de dispositivos.
* Configurar bloqueo automático.
* Permitir borrado remoto.
* Evitar el almacenamiento local de historias clínicas.
* Mantener actualizado el inventario.
* Revocar inmediatamente credenciales y sesiones.
* Establecer un procedimiento obligatorio de reporte de pérdida o robo.

**Propietario del riesgo:** Frank Castle — Jefatura de Infraestructura y TI.
---

## Evidencias

Las capturas correspondientes se encuentran en `informe/capturas/`:

- `07_riesgo_R01.png`: detalle del riesgo crítico de ransomware.
- `08_riesgo_R02.png`: detalle del riesgo crítico de acceso indebido.
- `09_riesgo_R04.png`: detalle del riesgo crítico de phishing.
- `10_riesgos.png`: registro general de los diez riesgos definidos para la clínica.

## Planes de acción

Se crearon tres planes de acción asociados a riesgos clasificados como altos. Los planes fueron registrados en SimpleRisk con estrategia de mitigación, responsables diferenciados, fechas de vencimiento, presupuesto estimado y estado inicial.

SimpleRisk representa el presupuesto mediante rangos generales. Por ese motivo, el rango seleccionado en los tres casos fue `$0 to $100,000`, mientras que el importe estimado específico se incorporó en los requisitos de cada plan.

El estado inicial se registró como `Mitigation Planned` con un porcentaje de avance del 0%, lo que indica que los planes fueron definidos pero todavía no comenzaron a ejecutarse.

### PA01 — Implementación de respaldos 3-2-1 y pruebas de restauración

* **Riesgo asociado:** R07 — Imposibilidad de recuperar la información desde respaldos.
* **Descripción:** implementar una arquitectura de respaldo que permita recuperar las historias clínicas y los sistemas críticos después de un ataque, error o falla de infraestructura. Se mantendrán tres copias de la información, en dos medios diferentes, con al menos una copia aislada o inmutable.
* **Estrategia:** Mitigar.
* **Fecha de vencimiento:** 31/10/2026.
* **Responsable:** Frank Castle — Jefatura de Infraestructura y TI.
* **Esfuerzo estimado:** Significant.
* **Rango de costo en SimpleRisk:** `$0 to $100,000`.
* **Presupuesto estimado:** USD 8.000.
* **Estado inicial:** Mitigation Planned — 0% de avance.

Las actividades principales incluyen separar las credenciales de respaldo, cifrar las copias, definir objetivos de recuperación, realizar pruebas trimestrales de restauración y monitorear automáticamente la ejecución de las copias.

### PA02 — Trazabilidad y control de modificaciones en historias clínicas

* **Riesgo asociado:** R03 — Alteración de información clínica.
* **Descripción:** implementar controles que permitan identificar, reconstruir y verificar cada modificación realizada sobre diagnósticos, alergias, antecedentes, prescripciones y tratamientos.
* **Estrategia:** Mitigar.
* **Fecha de vencimiento:** 15/12/2026.
* **Responsable:** Juliana Gattas — Dirección Médica.
* **Esfuerzo estimado:** Significant.
* **Rango de costo en SimpleRisk:** `$0 to $100,000`.
* **Presupuesto estimado:** USD 12.000.
* **Estado inicial:** Mitigation Planned — 0% de avance.

El sistema deberá registrar el usuario, fecha, hora, valor anterior y nuevo valor de cada modificación. Los registros deberán protegerse contra alteraciones y los cambios sobre información clínica crítica requerirán confirmación adicional e historial de versiones.

### PA03 — Continuidad de la integración con obras sociales

* **Riesgo asociado:** R08 — Indisponibilidad de la integración con obras sociales.
* **Descripción:** implementar medidas técnicas y contractuales que permitan mantener o recuperar la validación de coberturas, autorizaciones y facturación ante fallas del proveedor, de la integración o del enlace principal de Internet.
* **Estrategia:** Mitigar.
* **Fecha de vencimiento:** 15/11/2026.
* **Responsable:** Constanza Romero — Gerencia Administrativa y Financiera.
* **Esfuerzo estimado:** Significant.
* **Rango de costo en SimpleRisk:** `$0 to $100,000`.
* **Presupuesto estimado:** USD 7.500.
* **Estado inicial:** Mitigation Planned — 0% de avance.

Las actividades incluyen incorporar un segundo enlace de Internet con conmutación automática, establecer compromisos contractuales de disponibilidad y recuperación, implementar reintentos automáticos y documentar un procedimiento temporal de validación durante interrupciones.

## Evidencias de los planes de acción

Las capturas correspondientes se encuentran en `informe/capturas/`:

* `11_plan_R07_respaldos.png`: plan de respaldos 3-2-1 y pruebas de restauración.
* `12_plan_R03_integridad.png`: plan de trazabilidad y control de modificaciones.
* `13_plan_R08_obras_sociales.png`: plan de continuidad de la integración con obras sociales.

## Fuentes de referencia

* [Ley 25.326 de Protección de los Datos Personales](https://www.argentina.gob.ar/normativa/nacional/ley-25326-64790/actualizacion).
* [Ley 26.529 de Derechos del Paciente e Historia Clínica](https://www.argentina.gob.ar/normativa/nacional/norma-160432/actualizacion).
* [HHS — Healthcare and Public Health Cybersecurity](https://aspr.hhs.gov/readiness-response/response-operations/healthcare-public-health-cybersecurity).
* [HHS — Healthcare Cybersecurity Performance Goals](https://hhscyber.hhs.gov/cybersecurity-performance-goals.html).
* [HHS — Health Industry Cybersecurity Practices](https://hhscyber.hhs.gov/cornerstone-hicp.html).
* [CISA — StopRansomware Guide](https://www.cisa.gov/stopransomware/ransomware-guide).
* [CISA — Secure Our World](https://www.cisa.gov/secure-our-world).
* [NIST SP 800-53 Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final).
* [NIST SP 800-34 — Contingency Planning Guide](https://www.nist.gov/privacy-framework/nist-sp-800-34).
