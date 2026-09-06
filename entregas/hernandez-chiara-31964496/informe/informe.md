# Análisis crítico y profundización

## Comparación metodológica: SimpleRisk y FAIR

### Introducción

Para construir el registro inicial de riesgos de la clínica se utilizó el método clásico de SimpleRisk, basado en la combinación de probabilidad e impacto. Este enfoque permitió identificar, clasificar y priorizar rápidamente los riesgos mediante una matriz de 5 × 5.

Como metodología alternativa se investigó FAIR (Factor Analysis of Information Risk), un modelo cuantitativo orientado a expresar el riesgo en términos de frecuencia y magnitud probable de pérdidas económicas.

La comparación no busca determinar que una metodología sea universalmente superior a la otra. Cada una responde a necesidades diferentes y requiere distintos niveles de información, tiempo y madurez organizacional.

## Enfoque clásico utilizado en SimpleRisk

En el trabajo se valoró cada riesgo asignando:

- Una probabilidad entre 1 y 5.
- Un impacto entre 1 y 5.
- Un nivel resultante calculado mediante probabilidad × impacto.

Por ejemplo, el riesgo R01, “Ransomware sobre historias clínicas y sistemas de atención”, recibió una probabilidad de 4 y un impacto de 5:

`4 × 5 = 20 — Crítico`

SimpleRisk normaliza internamente este resultado en su escala de 0 a 10, por lo que el riesgo se muestra con un valor de 8,0 dentro de la herramienta.

Este método permite comparar rápidamente diferentes riesgos y representarlos mediante niveles y colores. Sin embargo, los valores utilizados son ordinales: indican que una categoría es mayor o menor que otra, pero no poseen una unidad económica o temporal concreta.

Por lo tanto, un resultado de 20 no significa que la clínica perderá veinte unidades monetarias, que el incidente ocurrirá veinte veces ni que será exactamente el doble de grave que un riesgo con valor 10. Su finalidad principal es ordenar prioridades.

## Metodología FAIR

FAIR, cuyas siglas significan Factor Analysis of Information Risk, es un modelo cuantitativo para analizar riesgos de información y riesgos operativos.

FAIR define el riesgo como la frecuencia probable y la magnitud probable de pérdidas futuras. En lugar de utilizar únicamente categorías como “probable”, “alto” o “crítico”, busca estimar rangos cuantificables y hacer explícita la incertidumbre existente.

Sus dos componentes principales son:

### Frecuencia de Eventos de Pérdida

La Loss Event Frequency (LEF) representa la frecuencia con la que se espera que una amenaza produzca una pérdida dentro de un período determinado, normalmente un año.

Para estimarla, FAIR considera, entre otros elementos:

- La frecuencia con la que la organización entra en contacto con una amenaza.
- La frecuencia con la que el actor intenta actuar contra el activo.
- La capacidad del actor de amenaza.
- La resistencia que ofrecen los controles implementados.
- La probabilidad de que la acción produzca efectivamente una pérdida.

Por ejemplo, para analizar un ataque de ransomware no bastaría con asignar “probabilidad 4”. Se deberían estimar los intentos de phishing recibidos, la posibilidad de que un empleado interactúe con un mensaje malicioso, la eficacia del filtrado de correo, el uso de MFA y la capacidad del atacante para superar los controles.

### Magnitud de Pérdida

La Loss Magnitude (LM) representa la magnitud económica probable de las consecuencias si el evento ocurre.

FAIR distingue entre pérdidas primarias, que afectan directamente a la organización, y pérdidas secundarias, que aparecen como consecuencia de la reacción de terceros.

En el escenario de la clínica podrían considerarse:

- Pérdida de productividad durante la interrupción.
- Imposibilidad de acceder a historias clínicas y turnos.
- Interrupción de la facturación.
- Horas de trabajo destinadas a la respuesta al incidente.
- Recuperación o reemplazo de sistemas.
- Servicios técnicos y legales.
- Notificación a personas afectadas.
- Posibles sanciones, reclamos o demandas.
- Daño reputacional y pérdida de confianza.

El resultado de un análisis FAIR no debería ser un único número presentado como exacto. Habitualmente se utilizan rangos y distribuciones que permiten representar diferentes resultados posibles y la incertidumbre de las estimaciones.

## Comparación entre los enfoques

| Criterio                        | SimpleRisk con matriz clásica            | FAIR                                                      |
| ---                             | ---                                      | ---                                                       |
| Tipo de análisis                | Cualitativo o semicuantitativo           | Cuantitativo                                              |
| Variables principales           | Probabilidad e impacto                   | Frecuencia y magnitud de pérdida                          |
| Resultado                       | Puntaje y nivel de riesgo                | Rango probable de pérdida económica                       |
| Información requerida           | Valoraciones de especialistas y conocimiento general del escenario | Datos históricos, costos, métricas y estimaciones más detalladas |
| Complejidad                     | Baja                                     | Media o alta                                              |
| Tiempo de aplicación            | Reducido                                 | Mayor                                                     |
| Tratamiento de la incertidumbre | Se refleja indirectamente en la elección de valores | Se representa mediante rangos y distribuciones |
| Comunicación                    | Niveles y colores fáciles de interpretar | Valores económicos útiles para decisiones presupuestarias |
| Uso principal                   | Registrar y priorizar una cartera amplia de riesgos | Profundizar escenarios y justificar inversiones|
| Perfil organizacional           | Organizaciones que comienzan a formalizar la gestión de riesgos | Organizaciones con mayor madurez y disponibilidad de información |

## Ventajas del enfoque de SimpleRisk

El enfoque clásico utilizado en SimpleRisk presenta las siguientes ventajas:

- Es sencillo de comprender y aplicar.
- Permite registrar una gran cantidad de riesgos en poco tiempo.
- No necesita información financiera o histórica detallada.
- Facilita la comunicación mediante colores y niveles.
- Permite ordenar los riesgos de manera consistente.
- Se integra directamente con el registro, los propietarios, las revisiones y los planes de mitigación.
- Resulta apropiado para una organización que comienza a formalizar su gestión de riesgos.

Estas características fueron útiles para la clínica ficticia, debido a que la auditoría externa identificó debilidades iniciales y era necesario construir rápidamente un primer registro.

## Desventajas del enfoque de SimpleRisk

Entre sus principales limitaciones se encuentran:

- La asignación de probabilidad e impacto depende del criterio de los evaluadores.
- Diferentes personas podrían asignar valores distintos al mismo escenario.
- Los puntajes no poseen un significado económico directo.
- Dos riesgos pueden obtener el mismo resultado mediante combinaciones diferentes de probabilidad e impacto.
- Un color o nivel no permite calcular cuánto dinero conviene invertir en un control.
- La simplicidad del resultado puede ocultar diferencias entre amenazas, vulnerabilidades y consecuencias.
- Puede producir una apariencia de precisión aunque los valores originales provengan de estimaciones cualitativas.

Por ejemplo, informar al Directorio que R01 tiene un valor de 20 permite comunicar que es prioritario, pero no permite conocer cuánto podría perder la clínica ni comparar directamente esa pérdida con el costo de una medida de protección.

## Ventajas de FAIR

FAIR ofrece las siguientes ventajas:

- Expresa el riesgo en términos comprensibles para la dirección financiera.
- Descompone el escenario en factores específicos que pueden analizarse por separado.
- Hace explícita la incertidumbre de las estimaciones.
- Permite comparar la pérdida probable con el costo de los controles.
- Ayuda a priorizar inversiones según la reducción económica esperada.
- Diferencia las pérdidas directas de las consecuencias generadas por terceros.
- Facilita el análisis de diferentes alternativas de tratamiento.

Este enfoque sería especialmente útil para decidir si una inversión en respaldos, segmentación, MFA o protección de endpoints resulta razonable frente a las pérdidas que podría evitar.

## Desventajas de FAIR

La utilización de FAIR también presenta limitaciones:

- Requiere más tiempo y conocimiento especializado.
- Necesita datos históricos, métricas técnicas y estimaciones económicas.
- Puede requerir la participación de las áreas de TI, Finanzas, Legales, Dirección Médica y Seguridad.
- La calidad del resultado depende de la calidad de los datos utilizados.
- Si se asignan valores monetarios sin evidencia suficiente, puede producirse una falsa precisión.
- Puede resultar excesivo para analizar todos los riesgos de una organización con baja madurez.
- Su aplicación completa puede requerir herramientas de cálculo o simulación.

Aunque FAIR reduce parte de la ambigüedad de las escalas ordinales, no elimina completamente la necesidad de realizar estimaciones. Cuando no existen datos suficientes, deben utilizarse rangos y documentarse claramente los supuestos.

## Aplicación conceptual al riesgo R01

Para mostrar la diferencia entre ambos enfoques se toma como ejemplo el riesgo R01, “Ransomware sobre historias clínicas y sistemas de atención”.

### Evaluación mediante SimpleRisk

- Probabilidad: 4.
- Impacto: 5.
- Resultado: 20.
- Nivel: Crítico.
- Valor normalizado en SimpleRisk: 8,0.

Esta valoración permite determinar rápidamente que R01 debe recibir atención inmediata.

### Evaluación mediante FAIR

En FAIR, el escenario debería definirse con mayor precisión. Por ejemplo:

> Un grupo de ciberdelincuentes obtiene acceso a la red de la clínica mediante credenciales comprometidas por phishing, cifra los sistemas de historias clínicas, turnos y facturación, y provoca una interrupción operativa y costos de recuperación.

Para estimar la frecuencia del evento de pérdida se necesitarían datos como:

- Cantidad anual de intentos de phishing recibidos.
- Porcentaje de mensajes que supera los filtros.
- Frecuencia con la que los usuarios interactúan con mensajes maliciosos.
- Cobertura real de MFA.
- Cantidad de endpoints vulnerables o desactualizados.
- Eficacia del antivirus, EDR y segmentación de red.
- Antecedentes de incidentes similares.

Para estimar la magnitud de la pérdida se necesitaría conocer:

- Facturación promedio por hora o por día.
- Costo de una hora de interrupción.
- Tiempo probable de recuperación.
- Cantidad de empleados afectados.
- Costo de especialistas externos.
- Costo de restauración o reemplazo de sistemas.
- Gastos legales y de notificación.
- Posibles sanciones o reclamos.
- Consecuencias reputacionales y comerciales.

Con esta información podrían construirse rangos de frecuencia y pérdida, y posteriormente compararse la exposición económica con el costo de los controles propuestos.

En este trabajo no se calcula una pérdida anual para R01 porque el escenario no proporciona los datos históricos y económicos necesarios. Asignar valores monetarios sin evidencia introduciría una precisión aparente que no podría justificarse.

## Contexto recomendado para cada enfoque

El método clásico de SimpleRisk es más apropiado cuando:

- Se necesita construir rápidamente un registro inicial.
- Existen muchos riesgos que deben ordenarse.
- La organización no dispone de datos históricos suficientes.
- Se busca una comunicación visual y sencilla.
- La gestión de riesgos se encuentra en una etapa inicial de madurez.

FAIR es más apropiado cuando:

- Deben evaluarse en profundidad riesgos específicos.
- Se necesita justificar una inversión ante el Directorio.
- Existen datos confiables sobre incidentes, costos y tiempos de interrupción.
- Deben compararse diferentes alternativas de tratamiento.
- La organización posee mayor madurez en seguridad y gestión financiera.
- Las consecuencias económicas o regulatorias son especialmente relevantes.

## Conclusión

Para la situación actual de la clínica, el enfoque clásico de SimpleRisk resulta adecuado para construir el registro inicial y establecer prioridades. Permitió identificar diez riesgos, distinguir los niveles críticos, altos y medios, asignar propietarios y asociar planes de mitigación.

FAIR no reemplazaría necesariamente este registro. Podría utilizarse como una segunda etapa para profundizar los riesgos más relevantes, especialmente aquellos que requieren inversiones significativas o pueden producir consecuencias económicas graves.

Una estrategia combinada permitiría utilizar SimpleRisk para mantener y priorizar la cartera completa, y aplicar FAIR selectivamente sobre riesgos como ransomware, indisponibilidad de sistemas o exposición de datos sensibles.

De esta manera, la clínica conservaría la simplicidad operativa de la matriz clásica y, al mismo tiempo, podría incorporar gradualmente análisis económicos más rigurosos a medida que genere información histórica y mejore su nivel de madurez.

## Fuentes consultadas

- The Open Group. Open FAIR Risk Analysis.
  https://www.opengroup.org/forum/security/riskanalysis

- The Open Group. Open FAIR Risk Taxonomy Standard.
  https://pubs.opengroup.org/onlinepubs/9699919899/toc.pdf

- FAIR Institute. What is FAIR?
  https://www.fairinstitute.org/what-is-fair

- FAIR Institute. FAIR Terminology 101: Risk, Threat Event Frequency and Vulnerability.
  https://www.fairinstitute.org/blog/fair-terminology-101-risk-threat-event-frequency-and-vulnerability

- FAIR Institute. FAIR Risk Basics: What Is Loss Magnitude?
  https://www.fairinstitute.org/blog/fair-risk-basics-what-is-loss-magnitude

- SimpleRisk. Risk Submission and Classic Risk Rating.
  https://support.simplerisk.com/kb/risk-submission