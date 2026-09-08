# Análisis de Riesgos — Clínica privada

Registro de riesgos elaborado para la Actividad A03 y el Trabajo Práctico de
SimpleRisk. Las escalas de valoración, los rangos de nivel y la estructura de las
tablas siguen la Plantilla de Matriz de Riesgos de la cátedra.

## 1. Alcance del análisis

El análisis abarca la seguridad de la información de una clínica privada de 120
empleados que atiende aproximadamente 800 pacientes por día y que gestiona
historias clínicas digitales, datos de afiliación a obras sociales y facturación.

Se incluyen los activos de información, software, hardware, red y personal
vinculados a la operación asistencial y administrativa, así como los aspectos
físicos y legales que afectan la confidencialidad, integridad y disponibilidad de
esa información.

Quedan fuera del alcance los riesgos de seguridad edilicia y de seguridad del
paciente que no tienen impacto sobre los sistemas de información.

## 2. Inventario y clasificación de activos

| ID | Descripción del Activo | Tipo | Responsable | Clasificación | Criticidad |
|---|---|---|---|---|---|
| A01 | Base de datos de historias clínicas digitales | Información | Jefe de Sistemas | Restringida | Alta |
| A02 | Sistema de gestión clínica (HCE y turnos) | Software | Jefe de Sistemas | Interna | Alta |
| A03 | Servidores físicos en sala de servidores | Hardware | Administrador de Infraestructura | Interna | Alta |
| A04 | Datos de afiliación y facturación a obras sociales | Información | Jefe de Administración | Confidencial | Alta |
| A05 | Directorio de usuarios y credenciales de acceso | Información | Jefe de Sistemas | Restringida | Alta |
| A06 | Copias de respaldo de bases de datos | Información | Administrador de Infraestructura | Restringida | Alta |
| A07 | Enlace a internet y red interna de la clínica | Red | Administrador de Infraestructura | Interna | Alta |
| A08 | Estaciones de trabajo de consultorios y admisión | Hardware | Soporte Técnico | Interna | Media |
| A09 | Suministro eléctrico y equipamiento de respaldo | Hardware | Jefe de Mantenimiento | Interna | Alta |
| A10 | Personal con acceso a datos de pacientes | Humano | Recursos Humanos | Interna | Alta |
| A11 | Reputación institucional de la clínica | Imagen | Dirección Médica | Pública | Alta |

Criterios de clasificación aplicados:

- **A01, A05 y A06 se clasifican como Restringida.** Las historias clínicas
  constituyen datos sensibles bajo la Ley 25.326. Las credenciales habilitan el
  acceso al resto de los activos, y las copias de respaldo contienen los mismos
  datos que la base productiva, por lo que no corresponde clasificarlas por
  debajo del original.
- **A08 tiene criticidad Media.** La pérdida de una estación de trabajo es
  reemplazable y no interrumpe la operación de la clínica.
- **A11 se clasifica como Pública pero con criticidad Alta.** La reputación es
  por definición percibida externamente, aunque su afectación tiene consecuencias
  severas para una institución privada de salud.

## 3. Identificación de amenazas y vulnerabilidades

| ID | Activo | Descripción de la Amenaza | Tipo | Vulnerabilidad Asociada |
|---|---|---|---|---|
| T01 | A07 | Interrupción del servicio del proveedor de internet | Accidental | Ausencia de enlace redundante con proveedor alternativo |
| T02 | A05 | Uso de cuentas de personal desvinculado que siguen activas | Intencional | Falta de procedimiento formal de baja de accesos |
| T03 | A03 | Acceso físico no autorizado a la sala de servidores | Intencional | Control de acceso físico deficiente y sin registro de ingresos |
| T04 | A05 | Exposición de credenciales anotadas en soportes visibles | Accidental | Ausencia de política de contraseñas y de gestor centralizado |
| T05 | A09 | Corte prolongado del suministro eléctrico | Natural | Falta de grupo electrógeno y UPS de autonomía suficiente |
| T06 | A08 | Acceso a estaciones de trabajo desatendidas con sesión abierta | Intencional | Sin bloqueo automático de sesión ni control de puertos USB |
| T07 | A10 | Campaña de phishing dirigida al personal administrativo | Intencional | Falta de concientización y de filtrado avanzado de correo |
| T08 | A01 | Cifrado de sistemas y datos por ransomware | Intencional | Superficie de exposición sin segmentación ni MFA en accesos remotos |
| T09 | A06 | Imposibilidad de restaurar las copias de respaldo | Accidental | Backups sin pruebas periódicas de restauración |
| T10 | A04 | Incumplimiento de la Ley 25.326 en el tratamiento de datos sensibles | Accidental | Ausencia de registro de bases de datos y de política de privacidad formalizada |

## 4. Evaluación de riesgos

Valoración según las escalas de la Sección 5 de la plantilla. El valor de riesgo
se calcula como Probabilidad × Impacto y el nivel se clasifica según los rangos
de la Sección 6.1: Bajo (1-4), Medio (5-9), Alto (10-15), Crítico (16-25).

| ID | Activo | Amenaza | Prob. | Impacto | Valor | Nivel |
|---|---|---|---|---|---|---|
| R01 | A07 | T01 | 4 | 3 | 12 | Alto |
| R02 | A05 | T02 | 4 | 4 | 16 | Crítico |
| R03 | A03 | T03 | 1 | 5 | 5 | Medio |
| R04 | A05 | T04 | 4 | 3 | 12 | Alto |
| R05 | A09 | T05 | 3 | 4 | 12 | Alto |
| R06 | A08 | T06 | 4 | 3 | 12 | Alto |
| R07 | A10 | T07 | 5 | 4 | 20 | Crítico |
| R08 | A01 | T08 | 4 | 5 | 20 | Crítico |
| R09 | A06 | T09 | 3 | 5 | 15 | Alto |
| R10 | A04 | T10 | 4 | 4 | 16 | Crítico |

### Justificación de las valoraciones

**R01 — Interrupción del servicio de internet.** Probabilidad 4: los cortes de
conectividad de varias horas son frecuentes y la clínica depende de un único
proveedor. Impacto 3: se interrumpe el sistema de turnos y la validación con
obras sociales, pero la atención continúa mediante procedimientos manuales y no
hay pérdida de datos.

**R02 — Cuentas de personal desvinculado.** Probabilidad 4: con 120 empleados y
la rotación característica del sector salud (residentes, suplentes, personal
administrativo), la ausencia de un procedimiento formal de baja hace que la
situación se produzca con alta frecuencia. Impacto 4: habilita acceso indebido a
datos sensibles con exposición legal, aunque acotado a los permisos de la cuenta
comprometida.

**R03 — Acceso físico no autorizado a la sala de servidores.** Probabilidad 1: la
materialización requiere la conjunción de varias condiciones, ya que existen
controles operativos que la dificultan (circulación permanente de personal y
videovigilancia en el área). Impacto 5: el acceso físico a los servidores anula
la mayor parte de los controles lógicos y permite la sustracción o destrucción
directa de la información.

**R04 — Credenciales anotadas en soportes visibles.** Probabilidad 4: en ausencia
de política de contraseñas y de un gestor centralizado, y con personal que rota
entre puestos de trabajo, la práctica es habitual. Impacto 3: el acceso indebido
queda limitado a la presencia física en el puesto y a los permisos de la cuenta
expuesta.

**R05 — Corte prolongado del suministro eléctrico.** Probabilidad 3: los cortes
son un evento real, aunque los prolongados y en horario de atención resultan
menos frecuentes. Impacto 4: interrumpe la totalidad de los sistemas
asistenciales y administrativos, con pérdida de operación y costo alto.

**R06 — Estaciones de trabajo desatendidas.** Probabilidad 4: en consultorios y
admisión el personal se desplaza entre pacientes, por lo que las sesiones abiertas
sin bloqueo son una situación cotidiana. Impacto 3: permite la visualización de
datos en pantalla o la conexión de dispositivos, con alcance limitado a una
estación por vez.

**R07 — Phishing dirigido al personal administrativo.** Probabilidad 5: el sector
salud es uno de los más apuntados por campañas de phishing, y con 120 empleados
sin capacitación formal la recepción de correos maliciosos es constante. Impacto
4: el compromiso inicial de credenciales habilita ataques posteriores de mayor
alcance.

**R08 — Ransomware sobre los sistemas de historias clínicas.** Probabilidad 4: el
sector salud constituye un objetivo prioritario, dado que la imposibilidad de
tolerar interrupciones aumenta la probabilidad de pago del rescate. Impacto 5:
paralización total de la atención, cifrado de datos, posible exfiltración previa
y daño reputacional severo.

**R09 — Imposibilidad de restaurar copias de respaldo.** Probabilidad 3: las
copias existen, pero la falta de pruebas periódicas de restauración hace que su
fallo al momento de necesitarlas sea una posibilidad concreta. Impacto 5: opera
como riesgo multiplicador, ya que convierte cualquier incidente de pérdida de
datos en definitivo.

**R10 — Incumplimiento de la Ley 25.326.** Probabilidad 4: sin registro de las
bases de datos ante la autoridad de control ni política de privacidad
formalizada, el incumplimiento no constituye un evento futuro sino un estado
actual. Impacto 4: sanciones económicas, exposición ante el organismo de control
y afectación reputacional.

## 5. Tratamiento de riesgos y riesgo residual

Para cada riesgo identificado se define una estrategia de tratamiento y las
salvaguardas correspondientes. El riesgo residual se calcula suponiendo las
salvaguardas implementadas y se clasifica con los mismos rangos de la Sección 6.1
de la plantilla.

| Riesgo | Estrategia | Salvaguardas propuestas | Tipo salv. | Prob. resid. | Imp. resid. | Val. resid. | Nivel resid. |
|---|---|---|---|---|---|---|---|
| R01 | Mitigar | Segundo enlace con proveedor alternativo y failover automático; procedimiento manual de contingencia documentado para admisión y turnos | Técnica / Administrativa | 2 | 2 | 4 | Bajo |
| R02 | Mitigar | Procedimiento formal de baja de accesos integrado al circuito de desvinculación de RRHH con plazo máximo de 24 horas; revisión trimestral de cuentas activas contra el padrón de personal | Administrativa | 2 | 4 | 8 | Medio |
| R03 | Mitigar | Cerradura con control de acceso por credencial y registro de ingresos; procedimiento formal de autorización de visitas al área | Física / Administrativa | 1 | 4 | 4 | Bajo |
| R04 | Mitigar | Política de contraseñas formalizada; gestor de contraseñas corporativo; capacitación de concientización; inspecciones periódicas de puestos de trabajo | Administrativa / Técnica | 2 | 3 | 6 | Medio |
| R05 | Mitigar | UPS con autonomía suficiente para apagado ordenado de servidores; grupo electrógeno para áreas críticas; mantenimiento preventivo con pruebas periódicas de arranque | Física / Técnica | 3 | 2 | 6 | Medio |
| R06 | Mitigar | Bloqueo automático de sesión por inactividad mediante política de dominio; bloqueo físico de puertos USB en equipos que no lo requieran operativamente, con excepciones documentadas y autorizadas; reubicación de pantallas fuera del campo visual de pacientes | Técnica / Física | 1 | 2 | 2 | Bajo |
| R07 | Mitigar | Programa de concientización con simulacros periódicos de phishing; filtrado avanzado de correo con sandboxing de adjuntos; MFA en todas las cuentas; procedimiento simple de reporte de correos sospechosos | Administrativa / Técnica | 4 | 2 | 8 | Medio |
| R08 | Mitigar / Transferir | Esquema de backup 3-2-1 con al menos una copia offline o inmutable; MFA en accesos remotos; segmentación de red entre ámbito asistencial y administrativo; EDR en servidores y estaciones; póliza de ciberseguro | Técnica / Administrativa | 3 | 3 | 9 | Medio |
| R09 | Mitigar | Pruebas de restauración documentadas con periodicidad definida; monitoreo automático de finalización de tareas de backup con alertas ante fallos; esquema 3-2-1 con copia offline | Técnica / Administrativa | 1 | 5 | 5 | Medio |
| R10 | Mitigar | Registro de las bases de datos ante la Agencia de Acceso a la Información Pública; política de privacidad y consentimiento informado formalizados; designación de responsable de protección de datos; procedimiento de respuesta ante ejercicio de derechos de titulares | Administrativa | 2 | 3 | 6 | Medio |

### Criterios aplicados en el cálculo del riesgo residual

Las salvaguardas no reducen probabilidad e impacto de manera uniforme. El criterio
aplicado consistió en identificar, para cada control, sobre cuál de las dos
variables actúa efectivamente:

- **Controles administrativos y preventivos reducen la probabilidad, no el
  impacto.** En R02, el procedimiento formal de baja de accesos disminuye la
  frecuencia con que quedan cuentas activas, pero el daño que puede producir una
  cuenta no dada de baja permanece invariable. El mismo criterio se aplica en R04
  y R09.

- **Controles de recuperación y contingencia reducen el impacto, no la
  probabilidad.** En R05 la clínica no tiene control sobre la red eléctrica
  externa, por lo que la frecuencia de los cortes no se modifica; lo que cambia
  es que dejan de interrumpir la operación. El mismo criterio se aplica en R07,
  donde el MFA no reduce la cantidad de correos maliciosos recibidos pero sí
  neutraliza el valor de una credencial robada.

- **Ningún riesgo se lleva a valor mínimo.** El riesgo residual nunca es nulo: en
  R08 la probabilidad se reduce de forma limitada porque la amenaza es externa y
  persistente, y en R09 el impacto se mantiene en 5 porque la pérdida definitiva
  de datos conserva su gravedad con independencia de los controles aplicados.

- **La transferencia complementa pero no reemplaza la mitigación.** En R08 la
  póliza de ciberseguro cubre la exposición económica, pero no el daño
  reputacional ni la interrupción asistencial, motivo por el cual el residual no
  desciende por debajo de nivel Medio.

## 6. Resumen comparativo de resultados

Distribución de los riesgos antes y después del tratamiento propuesto:

| Nivel | Riesgo inherente | % | Riesgo residual | % |
|---|---|---|---|---|
| Crítico | 4 | 40 % | 0 | 0 % |
| Alto | 5 | 50 % | 0 | 0 % |
| Medio | 1 | 10 % | 7 | 70 % |
| Bajo | 0 | 0 % | 3 | 30 % |
| **Total** | **10** | **100 %** | **10** | **100 %** |

## 7. Conclusiones y recomendaciones

El análisis identificó diez riesgos sobre los activos de información de la
clínica, de los cuales cuatro se clasificaron como Críticos y cinco como Altos en
su valoración inherente. Esta concentración en los niveles superiores es
consistente con una organización que no cuenta aún con un programa formal de
gestión de riesgos, situación que la auditoría externa previa ya había señalado.

Los riesgos de mayor exposición (R07, R08 y R10) responden a tres orígenes
distintos —el factor humano, la amenaza externa deliberada y el incumplimiento
normativo—, lo que indica que el tratamiento no puede concentrarse en una única
dimensión. Un programa centrado exclusivamente en controles técnicos dejaría sin
cubrir la exposición legal y la vinculada a la concientización del personal.

Se destaca el carácter multiplicador de R09: la imposibilidad de restaurar copias
de respaldo no produce daño por sí misma, pero convierte en definitiva la pérdida
de datos originada en cualquier otro riesgo. Por ese motivo, la verificación
periódica de las copias constituye la salvaguarda de mayor relación entre efecto y
costo de todo el conjunto analizado.

La aplicación de las salvaguardas propuestas elimina los niveles Crítico y Alto,
dejando siete riesgos en nivel Medio y tres en nivel Bajo. El residual resultante
requiere monitoreo continuo y revisión periódica de la valoración, dado que tanto
el entorno de amenazas como el marco normativo aplicable evolucionan.

Como recomendaciones prioritarias se proponen, en orden de implementación:

1. Formalizar el procedimiento de baja de accesos e implementar autenticación
   multifactor, por ser las medidas de menor costo relativo y mayor efecto sobre
   los riesgos R02, R07 y R08 de forma simultánea.
2. Establecer pruebas documentadas de restauración de copias de respaldo, dado su
   carácter habilitante para la recuperación ante cualquier incidente.
3. Regularizar la situación frente a la Ley 25.326, por tratarse de un
   incumplimiento vigente y no de un riesgo eventual.
