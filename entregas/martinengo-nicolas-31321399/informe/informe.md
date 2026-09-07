# Informe — TP Gestión de Riesgos con SimpleRisk

**Alumno:** Nicolás Martinengo — Legajo 31321399
**Cátedra:** Seguridad de Sistemas — Licenciatura en Sistemas de Información

---

## Parte A — Instalación y Configuración Básica

### Instalación reproducible

SimpleRisk se instaló mediante la imagen oficial `simplerisk/simplerisk`
(todo-en-uno: Apache + PHP + MySQL en un solo contenedor), usando Docker
Compose. El archivo completo está en `entorno/docker-compose.yml` y el
proceso puede reproducirse con:

```bash
cd entorno/
docker compose up -d
```

**Nota de compatibilidad:** en equipos Mac con Apple Silicon (arquitectura
arm64) la imagen no tiene build nativo, por lo que se fijó explícitamente
`platform: linux/amd64` en el compose para forzar la emulación. En Linux/Windows
con CPU Intel/AMD esta línea es innecesaria pero no genera ningún problema si
se deja.

Una vez levantado el contenedor, se accede a `http://localhost` y se completa
el asistente de instalación (verificación de requisitos, configuración de
base de datos interna, creación del usuario administrador).

### Usuarios y permisos

Se crearon 3 usuarios con roles diferenciados (Administrador, Analista de
Riesgos, Auditor), documentados en detalle —incluyendo qué permisos tiene
cada uno y por qué— en `configuracion/usuarios.md`. Ninguna contraseña real
se registra en el repositorio.

El criterio de diseño fue aplicar **separación de funciones**: quien carga y
modifica riesgos (Analista) no es quien los revisa y aprueba (Auditor), y
solo el Administrador tiene control total del sistema.

### Primer riesgo de prueba

Se cargó un riesgo de prueba ("contraseña débil en servidor de pruebas")
para validar que el flujo de alta de riesgos, cálculo de probabilidad ×
impacto y clasificación por nivel funcionan correctamente antes de avanzar
con el escenario real.

---

## Parte B — Escenario Real: Clínica Privada

### Contexto elegido

Clínica privada de 120 empleados, 800 pacientes/día, con historias clínicas
digitales, datos de obras sociales y facturación. Se eligió como rasgo
distintivo del escenario la **alta rotación de personal tercerizado**
(soporte IT, limpieza, facturación), ya que es una condición realista que
amplifica varios riesgos de seguridad de la información en organizaciones de
salud de tamaño medio.

### Riesgos identificados

Se definieron 7 riesgos específicos del contexto (no genéricos), cada uno
con descripción, categoría, activos afectados, probabilidad e impacto
justificados, nivel resultante, controles existentes, estrategia de
tratamiento y propietario. El detalle completo está en
`configuracion/riesgos.md`. Resumen:

| ID | Riesgo | Nivel |
|---|---|---|
| R01 | Acceso indebido de ex-personal tercerizado a HCE | Crítico |
| R02 | Ransomware vía equipo de soporte externo | Alto |
| R03 | Filtración de datos por canales inseguros | Alto |
| R04 | Pérdida de trazabilidad por cuentas genéricas compartidas | Alto |
| R05 | Falla del proveedor externo de backups | Alto |
| R06 | Ingreso físico no autorizado al server room | Medio |
| R07 | Incumplimiento normativo por NDA no actualizados | Alto |

Los 7 riesgos, junto con sus planes de tratamiento y riesgo residual, se
cargaron en SimpleRisk siguiendo el mismo formulario usado para el riesgo de
prueba de la Parte A.

### Planes de acción

Se definieron 3 planes de acción asociados a los riesgos de nivel
Alto/Crítico (Plan A: offboarding de accesos; Plan B: segmentación de red
para terceros; Plan C: capacitación obligatoria de onboarding), cada uno con
responsable, presupuesto estimado, fecha de vencimiento y estado inicial.
Detalle completo en `configuracion/riesgos.md`.

### Reporte ejecutivo

El reporte ejecutivo en PDF (máximo 3 páginas, dirigido al directorio de la
clínica) está en `reporte-ejecutivo/reporte.pdf`, e incluye resumen
ejecutivo, top 5 riesgos por nivel, estado de los planes de acción y
recomendaciones prioritarias.

---

## Parte C — Análisis Crítico y Profundización

### Comparación metodológica: SimpleRisk vs. FAIR

SimpleRisk implementa el enfoque **clásico de matriz cualitativa**
(Probabilidad × Impacto, escala 1-5), heredado de marcos como ISO 27005 y
NIST SP 800-30. **FAIR (Factor Analysis of Information Risk)**, en cambio,
es un modelo **cuantitativo**: expresa el riesgo en términos de pérdida
económica esperada (rangos monetarios con distribuciones de probabilidad),
descomponiendo el riesgo en factores como frecuencia de eventos de amenaza,
vulnerabilidad y magnitud de pérdida.

**Ventajas de SimpleRisk (matriz clásica):**
- Rápido de implementar y de entender para equipos sin formación
  actuarial/financiera.
- Suficiente para priorizar riesgos de forma relativa ("¿qué atiendo
  primero?").
- Bajo costo de mantenimiento del modelo.

**Desventajas frente a FAIR:**
- Los valores 1-5 son subjetivos y no son comparables entre distintos
  evaluadores ni fácilmente defendibles ante el directorio en términos de
  costo-beneficio ("¿cuánto nos ahorra invertir $X en este control?").
- No permite justificar presupuesto de seguridad con la misma fuerza que una
  cifra en pesos/dólares de pérdida anual esperada.

**¿Cuándo conviene cada una?**
La matriz clásica de SimpleRisk es adecuada para una organización del tamaño
de esta clínica, con un equipo de seguridad reducido y sin analistas
financieros de riesgo dedicados: permite avanzar rápido y generar una cultura
de gestión de riesgos. FAIR conviene en organizaciones más grandes o
reguladas, donde las decisiones de inversión en seguridad deben justificarse
financieramente ante un comité de riesgo o una aseguradora (por ejemplo, para
decidir si conviene transferir un riesgo vía un seguro cibernético, lo cual
requiere estimar la pérdida esperada en dinero).

### Integración con una herramienta externa

Se propone integrar SimpleRisk con **Slack**, mediante un webhook entrante,
para notificar automáticamente al canal del equipo de seguridad cuando se
crea o modifica un riesgo de nivel Alto o Crítico. Esto acorta el tiempo de
reacción frente a hallazgos críticos (por ejemplo, el R01 de este TP), sin
depender de que alguien revise manualmente el dashboard de SimpleRisk.

**Esquema de la integración:**
1. SimpleRisk expone eventos vía su API REST (`/api/risks`) o mediante un
   script que consulta periódicamente los riesgos de nivel Alto/Crítico
   recién creados.
2. Un script intermediario (cron job o función serverless) detecta riesgos
   nuevos de esos niveles y arma un mensaje con: ID, nombre del riesgo,
   nivel y propietario.
3. El script hace un `POST` a la URL del webhook de Slack con ese mensaje en
   formato JSON, publicándolo en el canal `#seguridad-riesgos`.

Esta integración no requiere modificar el código fuente de SimpleRisk, solo
consumir su API existente, lo que la hace de bajo costo de mantenimiento.

---

## Parte D — Actividad Optativa

**Actividad elegida: D4 — Propuesta de mejora a SimpleRisk**

**Título:** Notificaciones nativas por webhook para riesgos de nivel Alto/Crítico

**Descripción (formato issue de GitHub):**

> **Tipo:** Feature request
>
> **Problema:** Actualmente, para enterarse de que se cargó un riesgo de
> nivel Alto o Crítico, un usuario tiene que entrar manualmente al dashboard
> o esperar un reporte periódico. En organizaciones con equipos de seguridad
> pequeños (como el escenario de este TP), esto retrasa la reacción ante
> hallazgos urgentes.
>
> **Propuesta:** Agregar en Configure → Notifications una opción para
> configurar una URL de webhook genérica (compatible con Slack/Discord/
> Teams), que se dispare automáticamente cada vez que se crea o actualiza un
> riesgo cuyo nivel resultante sea Alto o Crítico.
>
> **Beneficio esperado:** reduce el tiempo de detección-a-reacción sin
> necesidad de que el equipo revise el sistema activamente, y es
> extensible a cualquier plataforma de mensajería que soporte webhooks
> entrantes, sin atar la funcionalidad a un proveedor específico.
>
> **Alcance estimado:** cambio de configuración (nueva tabla/campo en base
> de datos) + un hook en el evento "risk saved" que ya dispara SimpleRisk
> internamente al guardar un riesgo.

---

## Conclusiones generales

El TP permitió aplicar el ciclo completo de gestión de riesgos —desde la
instalación de la herramienta hasta la carga de riesgos reales, su
tratamiento y la comunicación a nivel directivo— sobre un escenario con una
condición organizacional concreta (alta rotación de personal tercerizado)
que atraviesa la mayoría de los riesgos identificados. Esto reforzó que la
gestión de riesgos no es un ejercicio abstracto de completar una matriz, sino
que depende fuertemente del contexto real de la organización que se está
evaluando.
