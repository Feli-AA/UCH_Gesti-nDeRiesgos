# Informe — Trabajo Práctico de Gestión de Riesgos con SimpleRisk

Seguridad Aplicada a Sistemas de Información
Licenciatura en Sistemas de Información — Universidad Champagnat

---

## Parte A — Instalación y configuración básica

### A.1 Instalación reproducible

El entorno se desplegó mediante Docker Compose utilizando la imagen oficial
`simplerisk/simplerisk`, que incluye el stack completo (Apache, PHP, MySQL y
utilidades de correo) en un único contenedor.

Las instrucciones completas de despliegue, los requisitos previos y las
decisiones de diseño adoptadas se encuentran documentadas en
[`entorno/README.md`](../entorno/README.md). El archivo de configuración es
[`entorno/docker-compose.yml`](../entorno/docker-compose.yml).

La aplicación queda disponible en `https://localhost:8443`. La captura
`capturas/01-dashboard-inicial.png` corresponde al primer acceso una vez
completada la instalación.

**Observación de seguridad detectada durante la instalación.** El primer acceso a
la aplicación redirige a la pantalla *Default Admin Account Creation*, que permite
crear la cuenta administrativa **sin ninguna autenticación previa**. En una
instancia expuesta a una red no confiable, el primer usuario que alcance el
servicio obtendría el control administrativo completo de la plataforma. Este
hallazgo se desarrolla en la Parte D.

### A.2 Usuarios y permisos

Se crearon tres cuentas con permisos diferenciados, además de la cuenta
administrativa generada por el instalador. El detalle de cada cuenta, los
permisos asignados y los criterios aplicados —segregación de funciones y mínimo
privilegio— se encuentran en
[`configuracion/usuarios.md`](../configuracion/usuarios.md).

Evidencia: `capturas/02-usuarios-creados.png`.

### A.3 Riesgo de prueba

Se registró un riesgo de prueba con el fin de validar el funcionamiento del
módulo de gestión de riesgos antes de proceder a la carga del registro
definitivo.

---

## Parte B — Escenario real

### B.1 Metodología de trabajo

El análisis se desarrolló en dos etapas deliberadamente separadas:

1. **Definición del registro de riesgos** siguiendo la Plantilla de Matriz de
   Riesgos de la cátedra: inventario de activos, identificación de amenazas y
   vulnerabilidades, valoración de probabilidad e impacto, y definición de
   tratamiento con cálculo de riesgo residual.
2. **Carga en SimpleRisk** de los riesgos previamente definidos.

Este orden respondió a un criterio práctico: la herramienta condiciona la forma
del registro mediante sus campos y escalas, por lo que realizar el análisis de
manera independiente permitió que las decisiones respondieran al contexto de la
organización y no a las restricciones del formulario. Las diferencias encontradas
al trasladar el análisis a la herramienta se documentan en el punto B.3.

El análisis completo se encuentra en
[`configuracion/riesgos.md`](../configuracion/riesgos.md).

### B.2 Registro de riesgos

Se identificaron diez riesgos sobre los activos de información de la clínica,
superando el mínimo de siete requerido. La distribución por nivel resultó en
cuatro riesgos Críticos, cinco Altos y uno Medio.

Los diez riesgos fueron cargados en SimpleRisk conservando la nomenclatura R01 a
R10 en el campo *Subject*, de modo de mantener la trazabilidad entre el documento
de análisis y el registro en la herramienta.

Evidencia: `capturas/03-riesgos-cargados.png`.

### B.3 Diferencias entre el análisis y la herramienta

El traslado del análisis a SimpleRisk hizo evidentes tres discrepancias entre el
modelo de la plantilla y la implementación de la herramienta.

**Escalas de valoración.** Las escalas de probabilidad e impacto coinciden en
cantidad de niveles y en semántica, por lo que la conversión fue directa:

| Valor | Plantilla (Probabilidad) | SimpleRisk (Likelihood) |
|---|---|---|
| 1 | Raro | Remote |
| 2 | Improbable | Unlikely |
| 3 | Posible | Credible |
| 4 | Probable | Likely |
| 5 | Casi seguro | Almost Certain |

| Valor | Plantilla (Impacto) | SimpleRisk (Impact) |
|---|---|---|
| 1 | Insignificante | Insignificant |
| 2 | Menor | Minor |
| 3 | Moderado | Moderate |
| 4 | Mayor | Major |
| 5 | Catastrófico | Catastrophic |

**Cálculo del valor de riesgo.** Pese a que ambos enfoques se basan en la
combinación de probabilidad e impacto, los valores resultantes difieren. La
plantilla calcula el producto directo sobre un rango de 1 a 25; SimpleRisk aplica
su propia fórmula sobre un rango de 1 a 10:

| Riesgo | Valor plantilla (P×I) | Nivel plantilla | Valor SimpleRisk |
|---|---|---|---|
| R07 | 20 | Crítico | 8 |
| R08 | 20 | Crítico | 8 |
| R02 | 16 | Crítico | 6.4 |
| R10 | 16 | Crítico | 6.4 |
| R09 | 15 | Alto | 6 |
| R01 | 12 | Alto | 4.8 |
| R04 | 12 | Alto | 4.8 |
| R05 | 12 | Alto | 4.8 |
| R06 | 12 | Alto | 4.8 |
| R03 | 5 | Medio | 2 |

Lo relevante es que **el ordenamiento relativo se conserva pero la magnitud
absoluta no**. Ambos métodos priorizan los mismos riesgos en el mismo orden, de
modo que la decisión sobre qué tratar primero no se ve afectada. Sin embargo, los
umbrales de clasificación no son transferibles entre instrumentos: un riesgo
clasificado como Crítico según los rangos de la plantilla (16 a 25) corresponde a
un valor de 8 en SimpleRisk, donde ese rango no existe. La consecuencia práctica
es que el nivel de riesgo solo tiene sentido dentro del instrumento que lo
produce, y comparar valores entre herramientas distintas carece de significado.

**Taxonomía de categorías.** Las categorías disponibles en SimpleRisk responden a
dominios de control operativo (*Access Management*, *Physical Security*,
*Monitoring*, *Sensitive Data Management*, entre otras) y no a las propiedades de
seguridad de la información —confidencialidad, integridad y disponibilidad— que
propone la consigna. Ante esta diferencia se optó por mantener ambas
clasificaciones: la categorización por propiedad afectada en el documento de
análisis, y la categorización por dominio de control en la herramienta.

La divergencia no es un defecto sino una consecuencia del propósito de cada
instrumento: SimpleRisk está orientado a la gestión operativa de controles, por
lo que su taxonomía facilita agrupar riesgos según el área responsable de
tratarlos, mientras que la clasificación por propiedades resulta más adecuada
para el análisis conceptual.

### B.4 Planes de acción

Se definieron tres planes de acción sobre riesgos de nivel Crítico y Alto,
seleccionados según su relación entre efecto esperado y esfuerzo de
implementación:

| Riesgo | Plan | Vencimiento | Responsable | Esfuerzo | Presupuesto estimado |
|---|---|---|---|---|---|
| R02 (Crítico) | Formalización del procedimiento de baja de accesos | 07/11/2026 | Responsable de Tratamiento | Minor | $600.000 ARS |
| R09 (Alto) | Pruebas documentadas de restauración de copias de respaldo | 07/12/2026 | Responsable de Tratamiento | Considerable | $2.000.000 ARS |
| R07 (Crítico) | Implementación de MFA y programa de concientización | 06/01/2027 | Analista de Riesgos | Significant | $4.500.000 ARS |

Los montos se expresan en pesos argentinos a valores de septiembre de 2026.

El criterio de selección buscó cubrir tres tipos distintos de control: uno
procedimental (R02), uno de verificación (R09) y uno tecnológico combinado con
capacitación (R07). Los tres planes se corresponden con las recomendaciones
prioritarias formuladas en las conclusiones del análisis de riesgos.

El plan sobre R07 presenta un efecto que excede al riesgo tratado: la
implementación de autenticación multifactor reduce también la exposición de R02 y
R08, dado que neutraliza el valor de una credencial comprometida con independencia
del vector por el cual se obtuvo.

Evidencia: `capturas/04-planes-de-accion.png`.

**Limitación de la herramienta en el registro de presupuesto.** El campo
*Mitigation Cost* de SimpleRisk no admite el ingreso de un monto, sino la
selección de un rango predefinido expresado en dólares estadounidenses, con
tramos de 100.000 dólares. Para una organización del tamaño de la analizada, los
tres planes se ubican en el primer tramo disponible, con lo que el campo pierde
toda capacidad de discriminación. Por este motivo, el monto estimado en pesos se
consignó en el campo descriptivo de cada plan. La limitación evidencia que la
herramienta fue diseñada bajo supuestos de escala presupuestaria que no se
corresponden con el contexto de aplicación.

### B.5 Consideración sobre la ejecución del laboratorio

La carga de los riesgos y de los planes de acción se realizó utilizando la cuenta
administrativa. Si bien el esquema de permisos documentado en
`configuracion/usuarios.md` está configurado y es funcional —cada cuenta posee
únicamente los permisos correspondientes a su función—, la operación efectiva no
se distribuyó entre las tres cuentas por razones de practicidad del entorno de
laboratorio. En un despliegue productivo, el registro de riesgos correspondería a
la cuenta de analista y la aprobación de mitigaciones a la de responsable de
tratamiento.
