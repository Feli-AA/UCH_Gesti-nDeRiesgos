# Informe — Gestión de Riesgos con SimpleRisk

## 1. Introducción

En este trabajo se utilizó SimpleRisk para registrar y analizar los principales riesgos de seguridad
asociados al caso de una clínica privada.

La idea no fue solamente aprender a utilizar la herramienta, sino aplicar un criterio de análisis
sobre un escenario concreto. A partir de la información proporcionada en la consigna se identificaron
los activos más importantes, las amenazas que podrían afectarlos y las posibles consecuencias para
la organización.

Primero se configuró el entorno y se crearon usuarios con distintos permisos. Luego se registró
un riesgo de prueba para verificar el funcionamiento de SimpleRisk y, una vez validado el entorno,
se analizaron siete riesgos correspondientes al escenario de la clínica.

También se propusieron medidas de tratamiento, se estimó el riesgo residual y se configuraron
tres planes de mitigación para algunos de los riesgos prioritarios.

---

## 2. Contexto del caso

El escenario plantea una clínica privada con **120 empleados** que atiende aproximadamente
**800 pacientes por día**.

La organización maneja principalmente:

- Historias clínicas digitales.
- Datos de obras sociales.
- Información de facturación.

Además, una auditoría externa detectó debilidades en la gestión de riesgos de la organización.

Este punto fue tomado como situación inicial del análisis.

La consigna no describe en detalle la infraestructura tecnológica ni todos los controles
de seguridad actualmente implementados. Por ese motivo se diferenció entre:

- Información proporcionada directamente por el caso.
- Supuestos mínimos necesarios para realizar el análisis.
- Decisiones tomadas durante la evaluación.
- Salvaguardas propuestas como tratamiento.

Esta separación permite completar el registro sin presentar como información confirmada
aquello que fue definido específicamente para el ejercicio.

---

## 3. Instalación y entorno utilizado

SimpleRisk se instaló de forma local utilizando Docker.

Se eligió este mecanismo porque permite disponer de un entorno de prueba de manera sencilla
y, al mismo tiempo, dejar documentada una forma reproducible de levantar la aplicación.

La instancia utilizada durante el trabajo se ejecutó con la imagen de SimpleRisk y se accedió
a la herramienta desde el navegador.

Dentro del repositorio se agregó:

`entorno/docker-compose.yml`

Este archivo permite reproducir la instalación base.

La configuración posterior de usuarios, riesgos y planes de mitigación se realizó manualmente
desde la interfaz de SimpleRisk.

---

## 4. Configuración de usuarios

Para trabajar con distintos niveles de permisos se configuraron tres usuarios:

| Usuario | Rol | Función principal |
|---|---|---|
| `admin_demo` | Administrador | Administración general de SimpleRisk |
| `analista_riesgos` | Analista de Riesgos | Registrar, analizar y planificar mitigaciones |
| `auditor_demo` | Auditor | Revisar y comentar riesgos sin modificarlos |

La configuración buscó aplicar principalmente dos criterios.

### Mínimo privilegio

Cada usuario recibió solamente los permisos necesarios para cumplir su función.

### Segregación de funciones

Se separaron las tareas de administración, análisis y auditoría para evitar que un único usuario
controle todo el proceso de gestión de riesgos.

El detalle completo de los permisos se encuentra en:

[`../configuracion/usuarios.md`](../configuracion/usuarios.md)

---

## 5. Riesgo de prueba

Antes de comenzar con los riesgos correspondientes a la clínica se creó un riesgo de prueba:

**R01 — Riesgo de prueba: indisponibilidad del sistema clínico**

**ID SimpleRisk:** `1001`

Este riesgo se utilizó únicamente para comprobar que fuera posible:

- Crear un riesgo.
- Asignar probabilidad e impacto.
- Asociar activos.
- Definir un propietario.
- Guardar y consultar el registro.

Por este motivo, **R01 no forma parte de los siete riesgos evaluados para el escenario de la clínica**.

---

## 6. Activos analizados

Para realizar el análisis se identificaron activos de información y recursos tecnológicos
relacionados con los riesgos definidos.

Entre los principales se encuentran:

- Historias clínicas digitales.
- Datos médicos de pacientes.
- Datos de obras sociales.
- Información de facturación.
- Sistema de gestión clínica.
- Servidor de gestión clínica.
- Copias de seguridad.
- Cuentas y credenciales de usuarios.
- Estaciones de trabajo.
- Red de la clínica.
- Correo electrónico corporativo.

La clasificación, criticidad y responsables de estos activos fueron definidos como parte
del análisis realizado para el trabajo.

El inventario completo se encuentra documentado en:

[`../configuracion/riesgos.md`](../configuracion/riesgos.md)

---

## 7. Supuestos utilizados para el análisis

Como el caso no describe todos los controles actualmente implementados, fue necesario definir
algunos supuestos mínimos para poder completar el registro de riesgos.

Para el ejercicio se consideró que:

- Los sistemas utilizan cuentas de usuario y contraseñas.
- Existe protección antimalware convencional.
- Se realizan copias de seguridad.
- Se utiliza correo electrónico corporativo con filtrado básico.
- Existe algún control básico sobre el acceso externo a la red.
- Las cuentas poseen permisos asociados para acceder a la información.

Estos puntos se utilizan únicamente como **supuestos de trabajo**.

No se consideró que la clínica cuente actualmente con controles más avanzados como autenticación
multifactor, EDR, copias inmutables, monitoreo centralizado o alta disponibilidad.

Cuando estos controles aparecen en el análisis, se presentan como medidas propuestas y no como
controles existentes.

---

## 8. Metodología de evaluación

Para evaluar los riesgos se utilizó la matriz de **Probabilidad × Impacto** indicada en la
plantilla proporcionada por la cátedra.

Tanto la probabilidad como el impacto se valoraron utilizando una escala de `1` a `5`.

El valor del riesgo se obtiene mediante:

**Riesgo = Probabilidad × Impacto**

La clasificación utilizada fue:

| Resultado | Nivel |
|:---:|:---:|
| **1 – 4** | Bajo |
| **5 – 9** | Medio |
| **10 – 15** | Alto |
| **16 – 25** | Crítico |

---

## 9. Riesgos identificados

Se analizaron siete riesgos correspondientes al escenario.

| ID | Riesgo | P | I | P × I | Nivel |
|:---:|---|:---:|:---:|:---:|:---:|
| **R02** | Ransomware sobre historias clínicas digitales | 4 | 5 | **20** | Crítico |
| **R03** | Acceso no autorizado a historias clínicas | 4 | 4 | **16** | Crítico |
| **R04** | Falla o pérdida de copias de seguridad | 4 | 5 | **20** | Crítico |
| **R05** | Caída del sistema de gestión clínica | 4 | 5 | **20** | Crítico |
| **R06** | Phishing dirigido al personal | 4 | 4 | **16** | Crítico |
| **R07** | Modificación incorrecta de información médica | 3 | 5 | **15** | Alto |
| **R08** | Filtración de datos de pacientes y obras sociales | 4 | 5 | **20** | Crítico |

El resultado inicial muestra:

- **6 riesgos Críticos.**
- **1 riesgo Alto.**

El detalle de cada riesgo, incluyendo categoría, activos afectados, amenaza, justificación de
probabilidad e impacto, controles considerados, propietario y salvaguardas propuestas, se encuentra en:

[`../configuracion/riesgos.md`](../configuracion/riesgos.md)

---

## 10. Tratamiento de los riesgos

Para los siete riesgos se seleccionó la estrategia **Mitigar**.

La intención es reducir la probabilidad de que los eventos ocurran y, cuando sea posible,
disminuir también sus consecuencias.

Entre las principales medidas propuestas se encuentran:

- Fortalecer la protección frente a ransomware.
- Mantener sistemas actualizados.
- Aplicar autenticación multifactor.
- Utilizar el principio de mínimo privilegio.
- Revisar periódicamente los permisos.
- Mejorar la gestión de copias de seguridad.
- Realizar pruebas de recuperación.
- Capacitar al personal frente a phishing.
- Incorporar monitoreo de disponibilidad.
- Mantener registros de auditoría sobre cambios en información médica.
- Monitorear accesos a información sensible.

Estas medidas son **propuestas de tratamiento** realizadas durante el análisis.

---

## 11. Riesgo residual

Además del riesgo inicial se realizó una estimación del riesgo residual, es decir, cómo podría
quedar cada riesgo luego de implementar correctamente las salvaguardas propuestas.

Esta evaluación no representa el estado actual de la clínica, sino una proyección.

| Riesgo | P residual | I residual | Valor | Nivel residual |
|:---:|:---:|:---:|:---:|:---:|
| **R02** | 2 | 4 | **8** | Medio |
| **R03** | 2 | 4 | **8** | Medio |
| **R04** | 2 | 4 | **8** | Medio |
| **R05** | 2 | 4 | **8** | Medio |
| **R06** | 2 | 4 | **8** | Medio |
| **R07** | 2 | 5 | **10** | Alto |
| **R08** | 2 | 5 | **10** | Alto |

Luego del tratamiento proyectado:

| Nivel | Cantidad | Porcentaje |
|:---:|:---:|:---:|
| **Crítico** | 0 | 0 % |
| **Alto** | 2 | 28,6 % |
| **Medio** | 5 | 71,4 % |
| **Bajo** | 0 | 0 % |

En R07 y R08 se decidió mantener un impacto residual elevado porque, aunque las medidas propuestas
puedan reducir la probabilidad, las consecuencias seguirían siendo importantes si el evento
finalmente se materializa.

---

## 12. Planes de mitigación

Se configuraron tres planes de mitigación dentro de SimpleRisk.

### PA01 — Protección frente a ransomware

**Riesgo asociado:** R02 — Ransomware sobre historias clínicas digitales

**Fecha de vencimiento:** 05/10/2026  
**Responsable:** Analista de Riesgos  
**Presupuesto configurado:** rango `$0 – $100.000`  
**Estado inicial:** 0 %

El plan busca fortalecer la prevención frente a ransomware y mejorar la capacidad de recuperación.

Entre las acciones propuestas se encuentran:

- Actualización de sistemas.
- Fortalecimiento de la protección de equipos.
- Protección de copias de seguridad.
- Pruebas de recuperación.
- Capacitación del personal.

### PA02 — Fortalecimiento de copias de seguridad

**Riesgo asociado:** R04 — Falla o pérdida de copias de seguridad

**Fecha de vencimiento:** 15/10/2026  
**Responsable:** Analista de Riesgos  
**Presupuesto configurado:** rango `$0 – $100.000`  
**Estado inicial:** 0 %

El objetivo es mejorar los mecanismos de respaldo y verificar que la información pueda recuperarse
correctamente cuando sea necesaria.

### PA03 — Continuidad del sistema clínico

**Riesgo asociado:** R05 — Caída del sistema de gestión clínica

**Fecha de vencimiento:** 20/10/2026  
**Responsable:** Analista de Riesgos  
**Presupuesto configurado:** rango `$0 – $100.000`  
**Estado inicial:** 0 %

Este plan apunta a mejorar la detección de interrupciones y la capacidad de recuperar la operación.

> El rango presupuestario corresponde al valor seleccionado en SimpleRisk. No se asigna una moneda
> adicional porque la herramienta no la especifica en el registro utilizado.

---

# 13. Comparación metodológica

## SimpleRisk y NIST SP 800-30

Para la comparación metodológica se eligió **NIST SP 800-30**.

La matriz de Probabilidad × Impacto utilizada durante el trabajo resulta práctica para realizar
una evaluación inicial, porque permite ordenar y priorizar rápidamente los riesgos.

NIST SP 800-30 plantea un análisis más detallado de elementos como las amenazas, vulnerabilidades,
probabilidad e impacto.

### Comparación

| Aspecto | Matriz Probabilidad × Impacto | NIST SP 800-30 |
|---|---|---|
| **Complejidad** | Baja | Mayor |
| **Aplicación** | Rápida | Más detallada |
| **Resultado** | Valor y nivel de riesgo | Evaluación más desarrollada del escenario |
| **Amenazas** | Pueden considerarse durante el análisis | Se analizan de manera más explícita |
| **Vulnerabilidades** | Pueden incorporarse como parte de la justificación | Tienen un papel importante en la evaluación |
| **Uso** | Priorización inicial | Análisis más profundo |

### Ventajas de la matriz utilizada

Para este trabajo, la matriz resultó útil porque:

- Es sencilla de entender.
- Permite comparar rápidamente los riesgos.
- Facilita establecer prioridades.
- Funciona bien para construir un registro inicial.

Su principal limitación es que dos situaciones diferentes pueden terminar con el mismo valor
numérico aunque sus características sean distintas.

Por ese motivo, la justificación de la probabilidad y el impacto es tan importante como el
resultado de la multiplicación.

### Ventajas de NIST SP 800-30

Un enfoque como NIST SP 800-30 sería más apropiado cuando se necesita profundizar en:

- Qué amenaza puede generar el riesgo.
- Qué vulnerabilidad puede permitir que ocurra.
- Qué consecuencias podría producir.
- Qué tan probable es que el escenario se materialice.

En una organización que ya cuenta con un registro inicial de riesgos, este tipo de enfoque podría
utilizarse para analizar con mayor profundidad los riesgos considerados más importantes.

---

# 14. Propuesta de integración con una herramienta externa

Para la parte de integración se eligió analizar cómo podría conectarse **SimpleRisk con Jira**.

La integración no fue implementada, por lo que se presenta como una propuesta.

La idea sería utilizar SimpleRisk para mantener el registro y la evaluación de los riesgos,
mientras que Jira se utilizaría para realizar el seguimiento operativo de las acciones necesarias
para tratarlos.

Un flujo posible sería:

`Riesgo en SimpleRisk → Acción de mitigación → Ticket en Jira → Seguimiento`

Por ejemplo, si un riesgo requiere una tarea técnica, podría generarse un ticket con:

| Información del riesgo | Información en Jira |
|---|---|
| ID del riesgo | Referencia |
| Nombre | Título del ticket |
| Descripción | Descripción de la tarea |
| Nivel | Prioridad |
| Tratamiento | Acción a realizar |
| Responsable | Persona asignada |
| Fecha de mitigación | Fecha de vencimiento |

De esta manera se podría mantener el análisis de riesgos en SimpleRisk y utilizar Jira para
controlar el avance de las acciones concretas.

---

# 15. Seguridad de la entrega

Como parte del trabajo también se tuvieron en cuenta medidas para evitar exponer información
sensible en el repositorio.

Entre ellas:

- No se documentaron contraseñas.
- No se subieron tokens ni claves API.
- Se utilizó un archivo `.gitignore`.
- Las credenciales utilizadas en el entorno son ficticias.
- Las capturas fueron revisadas antes de subirlas.
- No se incluyeron dumps de bases de datos.
- Las evidencias no deben mostrar información sensible.

---

# 16. Conclusiones

La utilización de SimpleRisk permitió organizar en un único registro los riesgos identificados
para el escenario de la clínica y documentar sus principales características.

La evaluación inicial mostró una exposición elevada: seis de los siete riesgos fueron clasificados
como Críticos y uno como Alto.

Los riesgos que requieren mayor atención están relacionados principalmente con ransomware,
disponibilidad de las historias clínicas, recuperación de información, acceso no autorizado y
filtración de datos sensibles.

El análisis del riesgo residual también permitió observar que aplicar salvaguardas puede reducir
la exposición, aunque esto no significa eliminar completamente el riesgo.

En particular, algunos escenarios mantienen un impacto elevado porque las consecuencias podrían
seguir siendo importantes incluso después de implementar mejores controles.

La comparación con NIST SP 800-30 permitió ver que la matriz utilizada resulta adecuada para una
primera priorización, mientras que una metodología más detallada puede ser útil para profundizar
los riesgos más importantes.

Finalmente, una integración con una herramienta como Jira podría facilitar el seguimiento de las
acciones necesarias para transformar los planes de tratamiento en tareas concretas.

---

## Evidencia

Las capturas utilizadas durante el trabajo se encuentran en:

[`capturas/`](capturas/)

Las evidencias incluyen:

- Configuración de usuarios y permisos.
- Riesgo R01 utilizado como prueba.
- Riesgos R02 a R08 correspondientes al escenario.
- Planes de mitigación de R02, R04 y R05.

El detalle y los enlaces individuales a las capturas también se encuentran en:

- [`../configuracion/usuarios.md`](../configuracion/usuarios.md)
- [`../configuracion/riesgos.md`](../configuracion/riesgos.md)
