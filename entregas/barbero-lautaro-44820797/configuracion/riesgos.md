# Matriz de Riesgos — Clínica Privada

Trabajo Práctico: Gestión de Riesgos con SimpleRisk
Seguridad de Sistemas

---

## 1. Datos Generales

| Campo | Contenido |
|---|---|
| Nombre de la organización | Clínica privada (caso simulado) |
| Rubro / Industria | Salud — atención médica ambulatoria y de diagnóstico |
| Tamaño | 120 empleados — 800 pacientes atendidos por día |
| Alumno | Barbero, Lautaro |
| Legajo | 44820797 |
| Fecha de elaboración | Septiembre de 2026 |
| Responsable del análisis | Responsable de Seguridad de la Información |

---

## 2. Objetivo y Alcance del Análisis

### Objetivo

Elaborar el registro inicial de riesgos de seguridad de la información de la clínica, a partir de las debilidades identificadas por una auditoría externa reciente, valorando cada riesgo mediante la matriz de probabilidad × impacto y proponiendo un plan de tratamiento fundamentado.

### Alcance

Se incluyen en el análisis:

- La información de pacientes en sus tres dimensiones: clínica, identificatoria y de facturación
- El sistema de gestión clínica, su base de datos y el portal de acceso por perfiles
- La infraestructura que sostiene ese sistema: servidor local, puestos de trabajo y red interna
- El esquema de respaldo y recuperación
- El personal con acceso al sistema, en tanto agente de riesgo

Quedan fuera del alcance el equipamiento médico y de diagnóstico, la infraestructura edilicia general, la telefonía y los sistemas de gestión de recursos humanos.

### Supuestos del escenario

El enunciado no detalla la infraestructura de la clínica. Los siguientes supuestos fueron definidos como parte del análisis y son consistentes con una institución que acaba de atravesar una auditoría externa con hallazgos:

**Infraestructura.** Servidor propio alojado en la clínica, con almacenamiento físico. Solo algunos datos residen en la nube; no existe migración completa. El emplazamiento del servidor no responde a criterios técnicos de ubicación.

**Base de datos.** El esquema no está completamente normalizado, lo que permite inconsistencias entre datos de un mismo paciente. No hay garantía de integridad referencial.

**Red.** Plana, sin segmentación. El wifi de sala de espera pertenece a la misma red que utilizan administración y recepción, y en varias áreas carece de contraseña.

**Equipamiento.** Diez PCs de escritorio compartidas por turno, tanto en recepción como en consultorios. Los usuarios cambian de sesión; el equipo es el mismo. No hay restricción de navegación ni de instalación de software.

**Accesos.** El portal distingue perfiles (médico, administración, recepción). No existe control técnico que impida el uso de credenciales ajenas: la responsabilidad recae en cada empleado. No hay proceso formal de baja de cuentas al egreso del personal.

**Respaldos.** Copias parciales en disco local dentro del mismo edificio y parciales en nube, sin inventario que identifique la versión vigente. Nunca se realizó una prueba de restauración.

**Control existente.** El portal es accesible únicamente desde la red interna, con equipos de la clínica. No se llega desde internet. Su eficacia está limitada por la ausencia de segmentación de red.

**Supuesto derivado.** Al confiar en el perímetro de red como control principal, no se implementó segundo factor de autenticación ni política robusta de contraseñas.

---

## 3. Inventario y Clasificación de Activos

| ID | Descripción del Activo | Tipo | Responsable | Clasificación | Criticidad |
|---|---|---|---|---|---|
| A01 | Historia clínica digital: diagnósticos, tratamientos, medicación, estudios y evolución | Información | Resp. de Cumplimiento y Protección de Datos | Restringida | Alta |
| A02 | Datos identificatorios y de cobertura del paciente: DNI, domicilio, contacto, obra social, número de afiliado | Información | Resp. de Cumplimiento y Protección de Datos | Restringida | Alta |
| A03 | Datos de facturación y liquidación a obras sociales | Información | Resp. de Cumplimiento y Protección de Datos | Confidencial | Media |
| A04 | Sistema de gestión clínica y su base de datos | Software | Jefe de Sistemas | Interna | Alta |
| A05 | Portal web de acceso por perfil (médico / administración / recepción) | Software | Jefe de Sistemas | Interna | Media |
| A06 | Servidor local donde se aloja el sistema | Hardware | Jefe de Sistemas | Interna | Alta |
| A07 | Diez PCs de escritorio compartidas entre áreas | Hardware | Jefe de Sistemas | Interna | Media |
| A08 | Red interna sin segmentar, compartida con el wifi de pacientes | Red | Jefe de Sistemas | Interna | Alta |
| A09 | Respaldos parciales en disco local y en nube, sin restauración probada | Información | Jefe de Sistemas | Confidencial | Alta |
| A10 | Personal con acceso al sistema: médicos, administración y recepción | Humano | Resp. de Seguridad de la Información | — | Alta |
| A11 | Reputación institucional y cumplimiento normativo | Imagen | Dirección de la clínica | Pública | Alta |

**Distribución de criticidad:** 8 Alta, 3 Media, 0 Baja.

### Justificación de las criticidades asignadas

**Predominio de criticidad Alta.** Una institución de salud maneja datos que constituyen la categoría más sensible en cualquier marco normativo de protección de datos personales, y su operación es crítica en sentido estricto: una interrupción no demora un trámite administrativo, impide la atención de 800 pacientes diarios. El inventario, además, está deliberadamente acotado a los activos relevantes para la seguridad de la información. Un inventario exhaustivo incluiría equipamiento de oficina, telefonía y climatización, y mostraría un mayor número de criticidades bajas.

**A03 en criticidad Media.** Es información sensible, pero recuperable y reconstruible a partir de documentación contable y de la propia historia clínica, a diferencia de A01. Su eventual filtración expone datos económicos y de cobertura, no información médica.

**A05 en criticidad Media.** Constituye la capa de presentación. Ante su corrupción o caída puede reinstalarse; los datos y la lógica de negocio residen en A04 y A06.

**A07 en criticidad Media.** Un equipo de escritorio es reemplazable en horas y no almacena información crítica de forma permanente.

**A06 en criticidad Alta, pese a existir alternativa de migración.** La criticidad mide el grado de dependencia de la organización respecto del activo, no su reemplazabilidad. La existencia de un plan de migración a la nube no reduce la criticidad del servidor: reduce el riesgo residual una vez implementada la salvaguarda. La migración, además, depende de restaurar desde A09, cuya integridad no está verificada.

**A09 en criticidad Alta.** Un respaldo nunca restaurado no constituye una garantía sino una suposición. Su criticidad es alta precisamente porque toda la estrategia de continuidad descansa sobre él.

**Nota de trazabilidad.** A06 y A09 presentan una dependencia mutua relevante para el análisis: la recuperación del servidor depende de los respaldos, y los respaldos sin restauración probada no garantizan esa recuperación. Este acoplamiento se refleja en más de un riesgo.

---

## 4. Identificación de Amenazas y Vulnerabilidades

| ID | Activo | Descripción de la Amenaza | Tipo | Vulnerabilidad Asociada |
|---|---|---|---|---|
| T01 | A01, A02, A03 | Error de carga de datos por sobrecarga operativa | Accidental | Ratio de 800 pacientes diarios frente a 120 empleados; ausencia de validación automática y de doble control |
| T02 | A04 | Inconsistencia entre datos de un mismo paciente | Accidental | Esquema sin normalizar, sin integridad referencial |
| T03 | A08, A04 | Acceso no autorizado a la red interna desde el wifi de sala de espera | Intencional | Red plana; wifi sin contraseña; el portal confía en el perímetro como control |
| T04 | A05 | Uso de credenciales ajenas entre el personal | Intencional | Equipos compartidos; sin control técnico de identidad; sin segundo factor |
| T05 | A01, A02 | Consulta de historias clínicas sin motivo asistencial | Intencional | Sin registro de auditoría de accesos; trazabilidad comprometida |
| T06 | A05 | Ataque de fuerza bruta contra el portal | Intencional | Sin política de contraseñas robusta ni bloqueo por intentos fallidos |
| T07 | A06 | Daño al servidor por corte de energía o evento climático | Natural | Servidor físico en la clínica; sin redundancia ni respaldo eléctrico |
| T08 | A06, A04 | Saturación del servidor por volumen de datos superior al previsto | Accidental | Dimensionamiento insuficiente para el flujo operativo actual |
| T09 | A09 | Respaldos no restaurables al momento de necesitarlos | Accidental | Nunca se realizó una prueba de restauración |
| T10 | A09 | Confusión entre copias vigentes y obsoletas | Accidental | Respaldos dispersos entre disco local y nube, sin inventario |
| T11 | A09 | Robo o daño físico del medio de respaldo local | Intencional | Copias alojadas en el mismo edificio, sin control de acceso declarado |
| T12 | A07 | Uso de las PCs para fines ajenos al sistema | Accidental | Equipos sin restricción de navegación ni de instalación de software |
| T13 | A07 | Acceso físico no autorizado a equipos desatendidos | Intencional | Puestos compartidos en áreas de circulación; sin bloqueo automático de sesión |
| T14 | A08 | Degradación de la red por saturación de dispositivos | Accidental | Sin segmentación ni control de dispositivos conectados |
| T15 | A01, A02, A03 | Exfiltración deliberada de datos por personal interno | Intencional | Accesos amplios; sin auditoría; sin clasificación efectiva de la información |
| T16 | A02 | Suplantación de identidad de pacientes con datos sustraídos | Intencional | Alta rotación en recepción; sin baja efectiva de cuentas al egreso |
| T17 | A06 | Daño al servidor por incendio o inundación según su ubicación física | Natural | Servidor emplazado sin criterio técnico, expuesto a instalaciones de agua, gas o electricidad |

**Distribución por tipo:** 9 Accidentales, 6 Intencionales, 2 Naturales.

**Nota sobre A11.** Los activos de tipo Imagen no presentan amenazas propias: se ven afectados por rebote ante la materialización de amenazas sobre otros activos. El daño reputacional y las consecuencias legales se computan, por tanto, en la valoración del impacto de los riesgos correspondientes y no como una amenaza independiente.

---

## 5. Escalas de Valoración

Se adoptan las escalas definidas en la plantilla de matriz de riesgos de la cátedra, a fin de garantizar consistencia en la valoración.

### 5.1. Escala de Probabilidad

| Valor | Nivel | Descripción |
|---|---|---|
| 1 | Raro | El evento solo ocurriría en circunstancias excepcionales |
| 2 | Improbable | Podría ocurrir, pero no se espera que suceda |
| 3 | Posible | Existe una posibilidad real de que ocurra |
| 4 | Probable | Es muy probable que ocurra en algún momento |
| 5 | Casi seguro | Se espera que ocurra frecuentemente / ha ocurrido recientemente |

### 5.2. Escala de Impacto

| Valor | Nivel | Descripción |
|---|---|---|
| 1 | Insignificante | Impacto mínimo, sin consecuencias operativas ni económicas relevantes |
| 2 | Menor | Alteración leve de la operación, costo bajo |
| 3 | Moderado | Impacto operativo y económico apreciable, recuperable |
| 4 | Mayor | Impacto significativo, pérdida de operación o datos, costo alto |
| 5 | Catastrófico | Paralización total, pérdida crítica de datos, daño reputacional o legal severo |

---

## 6. Matriz de Calor (Probabilidad × Impacto)

| P ↓ / I → | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| **5** | 5 | 10 | 15 | 20 | 25 |
| **4** | 4 | 8 | 12 | 16 | 20 |
| **3** | 3 | 6 | 9 | 12 | 15 |
| **2** | 2 | 4 | 6 | 8 | 10 |
| **1** | 1 | 2 | 3 | 4 | 5 |

### 6.1. Niveles de Riesgo

| Nivel | Rango (P×I) | Acción requerida |
|---|---|---|
| Bajo | 1 – 4 | Monitorear. Puede aceptarse. |
| Medio | 5 – 9 | Plan de acción a mediano plazo. |
| Alto | 10 – 15 | Tratamiento prioritario a corto plazo. |
| Crítico | 16 – 25 | Acción inmediata. Escalar a dirección. |

---

## 7. Evaluación de Riesgos

Los diecisiete escenarios de amenaza identificados se consolidan en ocho riesgos. El criterio de agrupación es la **comunidad de tratamiento**: amenazas que se mitigan con las mismas salvaguardas se agrupan en un mismo riesgo, de modo que cada plan de acción resulte coherente y ejecutable.

### 7.1. Tabla de evaluación

| ID | Riesgo | Activos | Amenazas | Categoría | Prob. | Impacto | Valor | Nivel | Propietario |
|---|---|---|---|---|---|---|---|---|---|
| R04 | Acceso indebido a datos de pacientes por personal interno o egresado | A01, A02, A03, A10 | T05, T15, T16 | Confidencialidad / Legal | 4 | 5 | **20** | Crítico | Resp. de Cumplimiento y Protección de Datos |
| R06 | Pérdida de capacidad de recuperación ante un incidente | A09 | T09, T10, T11 | Disponibilidad | 4 | 5 | **20** | Crítico | Jefe de Sistemas |
| R01 | Pérdida de integridad de los datos clínicos y administrativos | A01, A02, A03, A04 | T01, T02 | Integridad | 4 | 4 | **16** | Crítico | Jefe de Sistemas |
| R03 | Pérdida de trazabilidad por uso de credenciales ajenas | A05, A07 | T04, T13 | Confidencialidad / Legal | 4 | 4 | **16** | Crítico | Resp. de Seguridad de la Información |
| R05 | Interrupción del servicio por falla, saturación o daño del servidor | A06, A04 | T07, T08, T17 | Disponibilidad | 3 | 5 | **15** | Alto | Jefe de Sistemas |
| R02 | Acceso no autorizado y degradación de la red interna | A08, A04 | T03, T14 | Confidencialidad / Disponibilidad | 3 | 4 | **12** | Alto | Jefe de Sistemas |
| R08 | Exposición de los equipos por ausencia de restricciones de uso | A07 | T12 | Operativo | 3 | 4 | **12** | Alto | Resp. de Seguridad de la Información |
| R07 | Compromiso del portal por debilidad en los controles de autenticación | A05 | T06 | Confidencialidad | 2 | 4 | **8** | Medio | Resp. de Seguridad de la Información |

### 7.2. Fichas de riesgo

---

#### R01 — Pérdida de integridad de los datos clínicos y administrativos

| Campo | Contenido |
|---|---|
| Amenazas | T01, T02 |
| Activos | A01, A02, A03, A04 |
| Categoría | Integridad |
| Controles existentes | Ninguno relevante |
| Probabilidad | 4 — Probable |
| Impacto | 4 — Mayor |
| Valor | 16 — Crítico |
| Propietario | Jefe de Sistemas |

**Descripción.** Los datos de pacientes, tanto clínicos como administrativos, se cargan de forma incorrecta o se vuelven inconsistentes entre sí, comprometiendo la confiabilidad de la información sobre la que se toman decisiones asistenciales y administrativas.

**Justificación de probabilidad (4).** La auditoría externa ya identificó debilidades en la gestión, lo que constituye evidencia de que el problema es real y no hipotético. A ello se suma la carga operativa: 800 pacientes diarios atendidos por 120 empleados generan presión sobre las tareas de carga, sin validación automática ni doble control que la compense.

**Justificación de impacto (4).** Aunque el error más frecuente sea de escasa gravedad, la ausencia de normalización e integridad referencial permite que un error individual se propague: duplicación de pacientes, asociación de estudios a la ficha equivocada, inconsistencia entre registros de una misma persona. En contexto clínico, un dato médico erróneo no produce un costo administrativo sino una consecuencia asistencial, con responsabilidad profesional y legal asociada.

---

#### R02 — Acceso no autorizado y degradación de la red interna

| Campo | Contenido |
|---|---|
| Amenazas | T03, T14 |
| Activos | A08, A04 |
| Categoría | Confidencialidad / Disponibilidad |
| Controles existentes | Portal restringido a la red interna (eficacia limitada por falta de segmentación) |
| Probabilidad | 3 — Posible |
| Impacto | 4 — Mayor |
| Valor | 12 — Alto |
| Propietario | Jefe de Sistemas |

**Descripción.** Una persona ajena a la organización obtiene acceso a la red interna a través del wifi de sala de espera, o el segmento se degrada por saturación de dispositivos conectados.

**Justificación de probabilidad (3).** Se valora el aprovechamiento efectivo del acceso, no la mera conexión a la red: esta última es prácticamente permanente, dado que el wifi de sala de espera carece de contraseña y por allí circulan cientos de personas por día. El aprovechamiento requiere intención y conocimientos técnicos que no posee el paciente promedio. El vector más plausible es un atacante ajeno a la organización pero con presencia física en el edificio, que puede permanecer en la sala de espera sin levantar sospechas mientras opera sobre la red.

**Justificación de impacto (4).** Situarse en la red interna otorga acceso al segmento donde reside toda la información sensible de la clínica, permite reconocimiento de la infraestructura e intentos de autenticación contra el portal, cuyo único control efectivo es precisamente estar dentro de esa red. Por el lado de la degradación por saturación, la indisponibilidad de la red impide tomar turnos y acceder al sistema, con impacto operativo directo sobre la atención. Se valora en 4 y no en 5 porque el riesgo describe la obtención de una posición de ataque y la interrupción operativa, no el compromiso consumado de los datos: ese desenlace se evalúa en R07.

**Nota metodológica.** El riesgo agrupa dos efectos de naturaleza distinta —confidencialidad (T03) y disponibilidad (T14)— que comparten la misma salvaguarda: segmentación de red y separación del wifi de invitados. Se valora por el efecto más grave, la confidencialidad.

---

#### R03 — Pérdida de trazabilidad por uso de credenciales ajenas

| Campo | Contenido |
|---|---|
| Amenazas | T04, T13 |
| Activos | A05, A07 |
| Categoría | Confidencialidad / Legal |
| Controles existentes | Autenticación por perfil (médico / administración / recepción) |
| Probabilidad | 4 — Probable |
| Impacto | 4 — Mayor |
| Valor | 16 — Crítico |
| Propietario | Resp. de Seguridad de la Información |

**Descripción.** Las acciones registradas en el sistema no pueden atribuirse con certeza a la persona que efectivamente las realizó, por uso de credenciales ajenas o por acceso a sesiones abiertas en puestos desatendidos.

**Justificación de probabilidad (4).** No existe control técnico que impida el uso de credenciales ajenas: la única barrera es la disciplina individual del personal. Con diez puestos compartidos entre áreas, rotación de usuarios por turno y ausencia de bloqueo automático de sesión, el escenario típico no requiere mala fe: una sesión que queda abierta al retirarse un profesional es utilizada por el siguiente ante la presión asistencial. Los equipos ubicados en zonas de circulación agregan el vector de acceso físico a puestos desatendidos, aunque es el menos frecuente dentro del riesgo. La auditoría externa reciente refuerza la valoración, dado que la ausencia de control de identidad es un hallazgo característico de ese tipo de revisión.

**Justificación de impacto (4).** El daño no se manifiesta el día en que ocurre el hecho, sino cuando resulta necesario investigar. Sin trazabilidad confiable es imposible determinar quién accedió o modificó una historia clínica, lo que impide identificar responsables, aplicar medidas correctivas y evitar la repetición del incidente. En el ámbito de la salud, acreditar quién accedió a qué información constituye un requisito normativo: su ausencia expone a la clínica ante auditorías, reclamos de pacientes y procesos judiciales, donde la imposibilidad de demostrar el control de accesos opera en su contra.

---

#### R04 — Acceso indebido a datos de pacientes por personal interno o egresado

| Campo | Contenido |
|---|---|
| Amenazas | T05, T15, T16 |
| Activos | A01, A02, A03, A10 |
| Categoría | Confidencialidad / Legal |
| Controles existentes | Perfiles diferenciados en el portal |
| Probabilidad | 4 — Probable |
| Impacto | 5 — Catastrófico |
| Valor | 20 — Crítico |
| Propietario | Resp. de Cumplimiento y Protección de Datos |

**Descripción.** Personal con acceso al sistema, en actividad o ya desvinculado, consulta o extrae información de pacientes sin justificación asistencial, ya sea por curiosidad, con fines de exfiltración deliberada o para suplantación de identidad.

**Justificación de probabilidad (4).** La valoración se sostiene principalmente en la consulta sin motivo asistencial y en los accesos residuales de personal egresado, no en la exfiltración deliberada, que efectivamente es infrecuente. El temor a la sanción laboral opera como disuasivo únicamente si existe probabilidad real de detección, condición que no se cumple: la trazabilidad está comprometida según se evalúa en R03, por lo que resulta difícil atribuir un acceso indebido a una persona determinada. Para el personal egresado el disuasivo directamente no aplica, ya que no conserva vínculo laboral y sus credenciales permanecen activas ante la ausencia de un proceso formal de baja. La consulta por curiosidad, además, no se percibe subjetivamente como una conducta sancionable, lo que aumenta su frecuencia.

**Justificación de impacto (5).** Es el único riesgo del registro cuyo daño recae sobre terceros que no participaron de ninguna decisión: los pacientes. La exposición de información médica es irreversible, ya que un dato de salud divulgado no puede recuperarse, y compromete la intimidad de las personas en su dimensión más sensible. Habilita responsabilidad legal directa de la clínica por incumplimiento de la normativa de protección de datos, con exposición a reclamos individuales y sanciones. El daño reputacional en una institución de salud, cuyo funcionamiento depende de la confianza del paciente, es severo y difícil de revertir.

**Relación con otros riesgos.** R03 opera como habilitador de R04: la ausencia de trazabilidad no solo permite el acceso indebido, sino que impide detectarlo, investigarlo y sancionarlo. El tratamiento de R03 reduce la probabilidad de R04.

---

#### R05 — Interrupción del servicio por falla, saturación o daño del servidor

| Campo | Contenido |
|---|---|
| Amenazas | T07, T08, T17 |
| Activos | A06, A04 |
| Categoría | Disponibilidad |
| Controles existentes | Respaldos parciales, con integridad no verificada |
| Probabilidad | 3 — Posible |
| Impacto | 5 — Catastrófico |
| Valor | 15 — Alto |
| Propietario | Jefe de Sistemas |

**Descripción.** El servidor que aloja el sistema de gestión clínica deja de operar por saturación de capacidad, corte de energía, evento climático, incendio o inundación, interrumpiendo el acceso a la información asistencial y administrativa.

**Justificación de probabilidad (3).** Se valora por la causa dominante, que es la saturación del servidor por volumen de datos (T08). El sistema sostiene actualmente el flujo operativo, lo que indica que la capacidad no está agotada, aunque el dimensionamiento se aproxima a su límite. Las causas restantes tienen frecuencia individual menor —el corte prolongado de energía (T07) es ocasional y el incendio o inundación (T17) es infrecuente— pero se computan como factores que suman al conjunto, dado que se trata de causas independientes y basta con que se materialice una. La ausencia de redundancia declarada, sin respaldo eléctrico ni servidor secundario, impide que cualquiera de ellas sea absorbida sin interrupción.

**Justificación de impacto (5).** La indisponibilidad del servidor implica la paralización total de la operación: sin acceso al sistema no hay historias clínicas disponibles para la atención, no pueden gestionarse turnos ni registrarse prestaciones, y se detiene la facturación. Con 800 pacientes diarios, la interrupción afecta de forma inmediata la capacidad asistencial. La duración de la indisponibilidad depende de la recuperación desde copias de respaldo, cuya integridad no está verificada, lo que se evalúa en R06.

**Nota metodológica.** El riesgo agrupa tres causas independientes con frecuencias dispares. Se optó por valorar la probabilidad según la causa dominante en lugar de promediar o tomar el máximo, criterio que se explicita para dejar constancia de que la valoración responde a un análisis y no a una asignación uniforme.

---

#### R06 — Pérdida de capacidad de recuperación ante un incidente

| Campo | Contenido |
|---|---|
| Amenazas | T09, T10, T11 |
| Activos | A09 |
| Categoría | Disponibilidad |
| Controles existentes | Respaldos en disco local y en nube, sin restauración probada |
| Probabilidad | 4 — Probable |
| Impacto | 5 — Catastrófico |
| Valor | 20 — Crítico |
| Propietario | Jefe de Sistemas |

**Descripción.** Ante un incidente que requiera restaurar información, las copias de respaldo resultan inutilizables, incompletas o imposibles de identificar como vigentes, convirtiendo un evento recuperable en una pérdida definitiva.

**Justificación de probabilidad (4).** A diferencia de otros riesgos del registro, aquí no se estima la ocurrencia de un evento externo sino la falla de un control cuya condición defectuosa ya está presente. Los respaldos nunca fueron restaurados, por lo que su funcionamiento no constituye un hecho verificado sino una suposición: la única circunstancia en que se comprueba su validez es aquella en que se los necesita, que es también el momento en que la falla resulta irreparable. A esto se suma la dispersión entre disco local y nube sin inventario de copias, que dificulta identificar cuál es la versión vigente, y la ubicación del medio local en el mismo edificio que el servidor, lo que expone a ambos a un mismo evento físico.

**Justificación de impacto (5).** La imposibilidad de restaurar implica la pérdida definitiva de información. La distinción relevante es que no toda la información es reconstruible: los registros de facturación pueden rehacerse a partir de documentación contable, pero la historia clínica no admite reconstrucción, ya que documenta hechos asistenciales ocurridos que ningún registro alternativo reproduce. La pérdida compromete la continuidad de la atención de pacientes con tratamientos en curso, elimina el respaldo documental de la actividad médica realizada e implica incumplimiento de la obligación legal de conservación de historias clínicas.

**Relación con otros riesgos.** R06 no produce daño de manera autónoma: opera como multiplicador del impacto de todo evento que requiera recuperación, en particular R05 y R08. La interrupción del servidor es recuperable si los respaldos funcionan; si no lo hacen, se transforma en pérdida definitiva.

---

#### R07 — Compromiso del portal por debilidad en los controles de autenticación

| Campo | Contenido |
|---|---|
| Amenazas | T06 |
| Activos | A05 |
| Categoría | Confidencialidad |
| Controles existentes | Portal no accesible desde internet |
| Probabilidad | 2 — Improbable |
| Impacto | 4 — Mayor |
| Valor | 8 — Medio |
| Propietario | Resp. de Seguridad de la Información |

**Descripción.** Un atacante obtiene credenciales válidas del portal mediante ensayo sistemático, accediendo al sistema con los privilegios del perfil comprometido.

**Justificación de probabilidad (2).** La materialización requiere una cadena de condiciones sucesivas: presencia física en el edificio, conexión a la red interna, conocimiento técnico para ejecutar el ataque y persistencia hasta obtener credenciales válidas. Cada eslabón reduce el universo de atacantes con capacidad efectiva. La restricción del portal a la red interna elimina por completo el vector remoto, que es el que concentra la mayor parte de los ataques automatizados de este tipo. La valoración es coherente con R02: si el aprovechamiento del acceso a la red se estimó en 3, un ataque que además debe vencer la autenticación necesariamente tiene probabilidad menor.

**Justificación de impacto (4).** El compromiso otorga acceso legítimo al sistema con los privilegios del perfil vulnerado, no una posición de reconocimiento. Se valora en 4 y no en 5 porque el alcance queda acotado al perfil de la cuenta obtenida: una credencial de recepción no habilita el acceso completo a historias clínicas que sí otorgaría una de perfil médico. El agravante relevante es que, ante la pérdida de trazabilidad evaluada en R03, el uso de credenciales válidas por un tercero resulta indistinguible de la actividad normal del sistema, lo que dificulta la detección y prolonga la exposición.

---

#### R08 — Exposición de los equipos por ausencia de restricciones de uso

| Campo | Contenido |
|---|---|
| Amenazas | T12 |
| Activos | A07 |
| Categoría | Operativo |
| Controles existentes | Ninguno |
| Probabilidad | 3 — Posible |
| Impacto | 4 — Mayor |
| Valor | 12 — Alto |
| Propietario | Resp. de Seguridad de la Información |

**Descripción.** Los puestos de trabajo, sin restricciones de navegación ni de instalación de software, se convierten en vía de entrada de código malicioso hacia la red interna.

**Justificación de probabilidad (3).** Se valora el compromiso efectivo del equipo y no el uso ajeno al sistema, que es prácticamente seguro dado que no existe restricción de navegación ni de instalación y el personal permanece turnos prolongados frente a los puestos. La distinción es la misma aplicada en R02: la exposición es permanente, pero su materialización en un incidente requiere que el uso derive en la ejecución de código malicioso, lo que ocurre con frecuencia menor.

**Justificación de impacto (4).** El daño relevante no es el uso indebido del equipo ni su eventual reposición, sino la vía de entrada que habilita. Los puestos operan en una red plana sin segmentación y son las mismas máquinas desde las que se accede al sistema de gestión clínica, por lo que un equipo comprometido no queda contenido: alcanza directamente el segmento donde reside el servidor y opera con credenciales válidas en uso. El desenlace característico en esta configuración es el cifrado por ransomware, cuya recuperación depende de respaldos cuya integridad no está verificada y cuyo medio local se encuentra en el mismo edificio, expuesto al mismo evento.

**Relación con otros riesgos.** R08 constituye un vector de entrada hacia R05 y encuentra en R06 su agravante: un incidente de cifrado resulta recuperable únicamente si los respaldos funcionan, condición no verificada.

---

## 8. Tratamiento de Riesgos y Riesgo Residual

### 8.1. Estrategia adoptada

Los ocho riesgos se tratan mediante **mitigación**. Las estrategias alternativas se consideraron y descartaron por los siguientes motivos:

**Evitar** implicaría discontinuar las actividades que generan los riesgos —la digitalización de historias clínicas, la atención de pacientes, el acceso del personal al sistema—, todas ellas centrales para el funcionamiento de la clínica.

**Aceptar** resulta insostenible en riesgos de nivel Crítico y Alto con implicancias legales y asistenciales.

**Transferir** es viable de forma complementaria en R04, mediante contratación de seguro de responsabilidad civil por filtración de datos. Sin embargo, la transferencia alcanza al costo económico y no a la obligación legal ni al daño causado al paciente: en materia de protección de datos personales, el responsable del tratamiento conserva su responsabilidad frente al titular. Se considera, por tanto, medida accesoria y no principal.

### 8.2. Salvaguardas propuestas

| Riesgo | Salvaguardas propuestas | Tipo |
|---|---|---|
| R01 | Normalización del esquema e implementación de integridad referencial; validación de campos críticos en la carga con verificación de formato y rangos; detección y unificación de pacientes duplicados | Técnica |
| R01 | Doble control sobre datos clínicos críticos (alergias, grupo sanguíneo, medicación); capacitación en carga de datos | Administrativa |
| R02 | Segmentación de red con VLAN separada para invitados, sin acceso al segmento interno; wifi de pacientes con contraseña y portal cautivo; control de dispositivos conectados a la red interna; monitoreo de tráfico y detección de dispositivos no autorizados | Técnica |
| R03 | Credencial nominal obligatoria por usuario; bloqueo automático de sesión por inactividad; cierre de sesión forzado al cambio de turno; segundo factor de autenticación en perfiles con acceso a historia clínica | Técnica |
| R03 | Política de uso de credenciales con responsabilidad documentada y firmada | Administrativa |
| R04 | Perfiles de acceso según mínimo privilegio: recepción con datos de contacto y cobertura, facturación con prestaciones realizadas, perfil médico con historia clínica completa restringida a pacientes en atención; registro de auditoría de accesos con usuario, fecha y hora | Técnica |
| R04 | Revisión periódica de los registros de auditoría por responsable designado, con procedimiento ante accesos sin justificación asistencial; procedimiento formal de alta y baja de cuentas vinculado a RRHH; revisión trimestral de cuentas sin actividad; capacitación anual en confidencialidad con constancia firmada | Administrativa |
| R05 | Redimensionamiento de capacidad o migración a infraestructura escalable; monitoreo de recursos con alertas por umbral | Técnica |
| R05 | Sistema de alimentación ininterrumpida con autonomía para cierre ordenado; reubicación del servidor a un ambiente adecuado, alejado de instalaciones de agua, gas y cocinas, con detección de incendio | Física |
| R05 | Plan de continuidad operativa documentado | Administrativa |
| R06 | Monitoreo automático de la ejecución de respaldos con alerta ante fallo | Técnica |
| R06 | Copia de respaldo fuera del edificio | Física |
| R06 | Política formal de respaldo con esquema definido de frecuencia y retención; pruebas de restauración periódicas documentadas; inventario de copias que identifique la versión vigente | Administrativa |
| R07 | Política de contraseñas con requisitos de complejidad y caducidad; bloqueo temporal por intentos fallidos; segundo factor de autenticación; registro y alerta de intentos de autenticación anómalos | Técnica |
| R08 | Restricción de navegación por lista blanca o filtrado de categorías; bloqueo de instalación de software sin privilegios administrativos; solución antivirus con actualización centralizada; bloqueo de puertos USB en puestos que no lo requieran | Técnica |
| R08 | Política de uso aceptable de equipos | Administrativa |

### 8.3. Riesgo residual

| Riesgo | Estrategia | Prob. inicial | Imp. inicial | Valor | Nivel | Prob. resid. | Imp. resid. | Valor resid. | Nivel resid. |
|---|---|---|---|---|---|---|---|---|---|
| R01 | Mitigar | 4 | 4 | 16 | Crítico | 3 | 3 | **9** | Medio |
| R02 | Mitigar | 3 | 4 | 12 | Alto | 2 | 4 | **8** | Medio |
| R03 | Mitigar | 4 | 4 | 16 | Crítico | 3 | 4 | **12** | Alto |
| R04 | Mitigar | 4 | 5 | 20 | Crítico | 3 | 4 | **12** | Alto |
| R05 | Mitigar | 3 | 5 | 15 | Alto | 2 | 4 | **8** | Medio |
| R06 | Mitigar | 4 | 5 | 20 | Crítico | 2 | 5 | **10** | Alto |
| R07 | Mitigar | 2 | 4 | 8 | Medio | 1 | 4 | **4** | Bajo |
| R08 | Mitigar | 3 | 4 | 12 | Alto | 2 | 3 | **6** | Medio |

### 8.4. Justificación del riesgo residual

**R01.** La probabilidad desciende de 4 a 3 porque la validación de campos y el doble control sobre datos clínicos críticos interceptan una parte sustancial de los errores de carga. No desciende más porque la carga operativa que origina el riesgo permanece inalterada, y porque la validación automática detecta formatos incorrectos o valores fuera de rango, pero no un dato formalmente válido y materialmente equivocado. El impacto desciende de 4 a 3 porque la normalización del esquema y la integridad referencial eliminan el mecanismo de propagación: el error queda contenido en el registro donde se cometió, sin generar duplicaciones ni asociaciones cruzadas.

**R02.** La probabilidad desciende de 3 a 2 porque la segmentación mediante VLAN separada elimina el vector principal: el wifi de sala de espera deja de otorgar acceso al segmento interno. El impacto se mantiene en 4 porque las salvaguardas reducen la posibilidad de alcanzar la red interna, pero no alteran la consecuencia de lograrlo.

**R03.** La probabilidad desciende de 4 a 3 porque el bloqueo automático de sesión y el cierre forzado al cambio de turno eliminan el escenario más frecuente, que es el uso de una sesión ajena dejada abierta, mientras que el segundo factor en perfiles con acceso a historia clínica impide el uso de credenciales de terceros aun conociéndolas. No desciende más porque los equipos siguen siendo compartidos y subsiste la posibilidad de que un usuario facilite voluntariamente su credencial ante la presión asistencial, conducta que solo se contiene por vía administrativa. El impacto se mantiene en 4: las salvaguardas reducen la frecuencia del uso indebido, pero no alteran la consecuencia de que un acceso quede registrado bajo una identidad que no corresponde.

**R04.** La probabilidad desciende de 4 a 3 porque el procedimiento formal de baja de cuentas elimina prácticamente el vector de accesos residuales de personal egresado, uno de los dos pilares de la valoración inicial, mientras que el registro de auditoría, su revisión periódica y la capacitación reducen la consulta por curiosidad mediante efecto disuasivo. No desciende por debajo de 3 porque subsiste el acceso indebido por parte de personal con permisos legítimos sobre la información que consulta, conducta que ningún control técnico elimina y que solo puede detectarse a posteriori. El impacto desciende de 5 a 4 porque el esquema de mínimo privilegio acota el alcance de la información accesible por perfil, limitando lo que un usuario administrativo comprometido puede exponer; no desciende más porque el perfil médico conserva acceso a historias clínicas completas, de modo que el peor caso sigue involucrando información de salud.

**R05.** La probabilidad desciende de 3 a 2 porque el redimensionamiento de capacidad neutraliza la causa dominante, el sistema de alimentación ininterrumpida absorbe los cortes de energía y la reubicación del servidor reduce la exposición a incendio e inundación. El impacto desciende de 5 a 4 porque el plan de continuidad operativa y el monitoreo con alertas por umbral acortan el tiempo de indisponibilidad y permiten anticipar la falla, aunque la interrupción del servicio sigue afectando la operación asistencial.

**R06.** La probabilidad desciende de 4 a 2 porque las pruebas de restauración periódicas transforman el funcionamiento de los respaldos de suposición no verificada en hecho comprobado, que era el fundamento central de la valoración inicial. El monitoreo con alerta ante fallo y el inventario de copias completan la corrección del estado defectuoso. Subsiste el margen de que una copia se corrompa entre dos verificaciones. El impacto se mantiene en 5 porque las salvaguardas aumentan la confiabilidad del respaldo, pero no modifican la consecuencia de que este falle: la pérdida definitiva de información no reconstruible.

**R07.** La probabilidad desciende de 2 a 1 porque el bloqueo temporal por intentos fallidos y el segundo factor de autenticación convierten el ataque de fuerza bruta en un escenario que solo se materializaría en circunstancias excepcionales. El impacto se mantiene en 4 porque las salvaguardas actúan sobre la posibilidad de obtener la credencial, no sobre el alcance del acceso una vez obtenida.

**R08.** La probabilidad desciende de 3 a 2 porque la restricción de navegación, el bloqueo de instalación sin privilegios administrativos y la solución antivirus reducen sustancialmente la posibilidad de ejecución de código malicioso. El impacto desciende de 4 a 3 principalmente por efecto de la segmentación de red propuesta en R02: un equipo comprometido en una red segmentada deja de alcanzar directamente el segmento donde reside el servidor, con lo que el incidente queda acotado al puesto afectado.

---

## 9. Resumen de Resultados

### 9.1. Distribución del riesgo inherente

| Nivel | Cantidad de riesgos | % del total |
|---|---|---|
| Crítico | 4 | 50 % |
| Alto | 3 | 37,5 % |
| Medio | 1 | 12,5 % |
| Bajo | 0 | 0 % |
| **Total** | **8** | **100 %** |

### 9.2. Distribución del riesgo residual

| Nivel | Cantidad de riesgos | % del total |
|---|---|---|
| Crítico | 0 | 0 % |
| Alto | 3 | 37,5 % |
| Medio | 4 | 50 % |
| Bajo | 1 | 12,5 % |
| **Total** | **8** | **100 %** |

### 9.3. Lectura comparada

| Nivel | Inherente | Residual | Variación |
|---|---|---|---|
| Crítico | 4 | 0 | −4 |
| Alto | 3 | 3 | = |
| Medio | 1 | 4 | +3 |
| Bajo | 0 | 1 | +1 |

La implementación del plan de tratamiento elimina la totalidad de los riesgos de nivel Crítico, sin que ninguno de los ocho riesgos supere el nivel Alto en su valoración residual. Los tres riesgos que permanecen en nivel Alto —R03, R04 y R06— corresponden a escenarios donde subsiste un componente irreductible: la conducta del personal con acceso legítimo en los dos primeros, y la consecuencia inherente a la pérdida de información no reconstruible en el tercero.

---

## 10. Planes de Acción

Se definen tres planes de acción sobre los riesgos de mayor valor, priorizados por magnitud y por su efecto sobre otros riesgos del registro.

### PA-01 — Restablecimiento de la capacidad de recuperación ante incidentes

| Campo | Contenido |
|---|---|
| Riesgo asociado | R06 (valor 20, Crítico) |
| Responsable | Jefe de Sistemas |
| Fecha de vencimiento | 15 de diciembre de 2026 |
| Presupuesto estimado | USD 4.500 |
| Estado inicial | Planificado |

**Descripción.** Formalizar la política de respaldo definiendo frecuencia, retención y alcance por tipo de dato. Implementar pruebas de restauración trimestrales con acta documentada. Confeccionar un inventario de copias que identifique inequívocamente la versión vigente y consolidar el esquema actualmente disperso entre disco local y nube. Establecer una copia fuera del edificio y activar monitoreo automático con alerta ante fallo de ejecución.

**Prioridad.** Se ubica en primer lugar por tratarse del riesgo de mayor valor con menor costo de implementación, y porque su resolución reduce el impacto de R05 y R08 sin requerir modificaciones sobre el sistema de gestión clínica.

### PA-02 — Restitución de la trazabilidad de accesos al sistema

| Campo | Contenido |
|---|---|
| Riesgo asociado | R03 (valor 16, Crítico) |
| Responsable | Resp. de Seguridad de la Información |
| Fecha de vencimiento | 31 de enero de 2027 |
| Presupuesto estimado | USD 6.800 |
| Estado inicial | Planificado |

**Descripción.** Implementar bloqueo automático de sesión por inactividad y cierre forzado al cambio de turno en los diez puestos compartidos. Habilitar segundo factor de autenticación para los perfiles con acceso a historia clínica. Formalizar una política de uso de credenciales con responsabilidad documentada y firmada por el personal. Verificar que toda credencial sea nominal y eliminar cuentas genéricas.

**Prioridad.** Constituye condición previa de PA-03: sin trazabilidad confiable, el registro de auditoría de accesos que ese plan implementa carece de valor probatorio, ya que no permite atribuir un acceso a una persona determinada.

### PA-03 — Control de acceso a información de pacientes bajo mínimo privilegio

| Campo | Contenido |
|---|---|
| Riesgo asociado | R04 (valor 20, Crítico) |
| Responsable | Resp. de Cumplimiento y Protección de Datos |
| Fecha de vencimiento | 31 de marzo de 2027 |
| Presupuesto estimado | USD 12.000 |
| Estado inicial | Planificado |

**Descripción.** Redefinir los perfiles del sistema según el principio de mínimo privilegio: recepción con acceso a datos de contacto y cobertura, facturación a prestaciones realizadas, y perfil médico a historia clínica completa restringida a pacientes en atención. Implementar registro de auditoría que deje constancia de usuario, fecha y hora de cada consulta a historia clínica. Establecer revisión mensual de esos registros con procedimiento formal ante accesos sin justificación asistencial. Incorporar la revocación de credenciales como paso obligatorio del proceso de egreso de personal, con revisión trimestral complementaria de cuentas inactivas. Capacitación anual en confidencialidad con constancia firmada de que los accesos son auditados.

**Prioridad.** Es el plan de mayor plazo y presupuesto porque requiere desarrollo sobre el sistema de gestión clínica y no únicamente configuración. Depende de la implementación previa de PA-02.

### Resumen del plan

| Plan | Riesgo | Valor inicial | Valor residual | Vencimiento | Presupuesto |
|---|---|---|---|---|---|
| PA-01 | R06 | 20 Crítico | 10 Alto | 15/12/2026 | USD 4.500 |
| PA-02 | R03 | 16 Crítico | 12 Alto | 31/01/2027 | USD 6.800 |
| PA-03 | R04 | 20 Crítico | 12 Alto | 31/03/2027 | USD 12.000 |
| | | | | **Total** | **USD 23.300** |

Los montos constituyen estimaciones orientadas a dimensionar el esfuerzo relativo de cada plan y no responden a una cotización formal.

---

## 11. Conclusiones y Recomendaciones

### Conclusiones

**El registro presenta una concentración inicial elevada de riesgo.** Cuatro de los ocho riesgos identificados alcanzan nivel Crítico y tres el nivel Alto. Esta distribución es consistente con el escenario planteado: una institución que acaba de atravesar una auditoría externa con hallazgos y que no ha implementado prácticamente ningún control de seguridad de la información. La valoración no es uniforme —incluye un riesgo de nivel Medio y varias probabilidades deliberadamente moderadas con argumento explícito, como en R05 y R08—, lo que refleja un análisis diferenciado por escenario.

**Los riesgos identificados no son independientes entre sí.** El hallazgo más relevante del análisis es que las debilidades se encadenan y se amplifican mutuamente. R03 habilita R04, al impedir la detección del acceso indebido. R06 multiplica el impacto de R05 y R08, al convertir incidentes recuperables en pérdidas definitivas. R02 constituye precondición de R07, al otorgar la posición desde la cual el ataque de autenticación resulta posible. La consecuencia práctica es que el tratamiento de un número reducido de riesgos produce mejoras simultáneas en varios frentes.

**La ausencia de controles es generalizada.** R01 y R08 no cuentan con ningún control existente, y los controles presentes en el resto de los riesgos son parciales. El caso de la restricción del portal a la red interna resulta ilustrativo: se trata de un control correctamente concebido cuya eficacia queda anulada por la ausencia de segmentación, dado que el wifi abierto de sala de espera coloca a cualquier persona dentro del perímetro que ese control presupone confiable.

**El plan de tratamiento elimina el nivel Crítico.** La implementación de las salvaguardas propuestas lleva la totalidad del registro a niveles Alto o inferiores, sin pretender la eliminación completa del riesgo. Los tres riesgos que permanecen en nivel Alto conservan un componente irreductible que ningún control elimina.

### Recomendaciones prioritarias

**Primera. Verificar la capacidad de recuperación antes que cualquier otra medida.** Ninguna otra acción tiene sentido mientras no se confirme que la clínica puede recuperar su información. Todo el plan de continuidad descansa sobre respaldos cuyo funcionamiento nunca fue comprobado.

**Segunda. Segmentar la red interna.** Es la medida de mayor relación entre impacto y costo del plan: resuelve R02 y reduce simultáneamente el impacto de R08, sin requerir modificaciones sobre el sistema de gestión clínica.

**Tercera. Restituir la trazabilidad de los accesos.** Sin capacidad de atribuir cada acción a una persona determinada, la clínica no puede investigar incidentes, aplicar medidas correctivas ni acreditar el cumplimiento normativo ante una auditoría o un reclamo judicial.

**Cuarta. Reubicar el equipamiento crítico según criterios técnicos.** Los centros de datos y el equipamiento de servidores no deben emplazarse en adyacencia a cocinas ni en posición inferior respecto de instalaciones sanitarias, por el riesgo de incendio e inundación respectivamente. La ubicación actual del servidor no responde a criterio técnico alguno.

**Quinta. Formalizar el ciclo de vida de las cuentas de usuario.** La revocación de credenciales debe integrarse como paso obligatorio del proceso de desvinculación de personal. Es la medida de menor costo del plan y elimina un vector completo de acceso indebido.

---

## 12. Declaración de Buenas Prácticas

Como estudiante de Seguridad de Sistemas, declaro que el presente análisis de riesgos fue elaborado aplicando las buenas prácticas de la disciplina, con criterio ético, fundamentos técnicos y respetando el marco normativo vigente.

Los datos de la organización analizada corresponden a un escenario simulado con fines académicos. No se utilizó información real de pacientes, personal ni instituciones. Las credenciales mencionadas en la documentación del trabajo son ficticias.

Firma del alumno: ____________________  Fecha: ____________________

---

## 13. Referencias Bibliográficas

- Chicano Tejada, E. (2023). *Auditoría de seguridad informática. IFCT0109* (2.ª ed.). IC Editorial — eLibro.
- ISO/IEC (2013). *ISO/IEC 27001: Information security management systems*.
- ISO/IEC (2018). *ISO/IEC 27005: Information security risk management*.
- NIST (2012). *Guide for Conducting Risk Assessments* (SP 800-30 Rev. 1). National Institute of Standards and Technology.
- OWASP. *OWASP Risk Rating Methodology*. https://owasp.org/www-community/OWASP_Risk_Rating_Methodology
- FAIR Institute. *What is FAIR*. https://www.fairinstitute.org/what-is-fair
- Verizon. *Data Breach Investigations Report (DBIR)*. https://www.verizon.com/business/resources/reports/dbir/
- Software Engineering Institute, Carnegie Mellon University. *OCTAVE*. https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=511000
