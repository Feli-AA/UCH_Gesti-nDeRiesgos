# Informe - TP4: Gestión de Riesgos con SimpleRisk

## Parte A - Instalación y Configuración Básica

La instalación se realizó con Docker sobre Windows 11, usando Docker Desktop con WSL2 como base (las instrucciones originales de la consigna estaban pensadas para Linux, pero Docker corre igual en Windows sin mayores cambios). Se utilizó la imagen oficial de SimpleRisk desde DockerHub:

```bash
docker pull simplerisk/simplerisk

docker run --name simplerisk -d -p 80:80 -p 443:443 simplerisk/simplerisk
```

Al entrar por primera vez a `https://localhost/`, el asistente de instalación pidió crear la cuenta de administrador. En un primer intento se cargaron datos reales por error, por lo que se optó por eliminar el contenedor (`docker rm -f simplerisk`) y volver a levantarlo desde cero, ya que al no compartir volúmenes con nombre, un contenedor nuevo genera una base de datos completamente limpia. En el segundo intento se completó todo con datos ficticios.

### Usuarios y roles

Se crearon 3 usuarios con roles diferenciados (ver detalle completo de permisos en `configuracion/usuarios.md`):

- **Administrador (Pepe Gonzalez):** cuenta creada durante la instalación, con control total del sistema.
- **Analista de Riesgos (Sofía Elena Álvarez):** rol creado en Role Management, con permisos para cargar, modificar y planificar mitigaciones de riesgos, pero sin permisos para cerrar riesgos, aceptar mitigaciones ni borrar proyectos. Se dejaron esas acciones fuera a propósito, siguiendo el principio de mínimo privilegio, considerando que cerrar o aprobar un riesgo es una decisión de supervisión y no de análisis.
- **Auditor (Matías David Herrera):** rol de solo lectura, con acceso a Risk Management, Governance y Compliance, sin ningún permiso de creación o modificación.

### Riesgo de prueba

Se cargó un riesgo de prueba ("Riesgo de prueba - validación del sistema") únicamente para confirmar que el flujo de carga funcionaba de punta a punta. Al intentar cerrarlo se produjo un error de la aplicación (*unsupported operand types*), probablemente por una incompatibilidad entre la versión de PHP de la imagen de Docker y el código de SimpleRisk al calcular ciertos valores al cerrar un riesgo. En un segundo intento el cierre funcionó correctamente, con motivo "Rechazado", ya que no representaba un riesgo real de la organización.

---

## Parte B - Escenario Real: Clínica Privada

Se definieron 7 riesgos concretos para una clínica privada de 120 empleados y ~800 pacientes/día, que maneja historias clínicas digitales, datos de obras sociales y facturación, y que recientemente atravesó una auditoría externa que detectó debilidades de seguridad.

Los riesgos cubren áreas distintas entre sí: acceso a datos, disponibilidad de sistemas, terceros, factor humano, seguridad física, cumplimiento normativo y continuidad del negocio. El detalle completo de cada uno (categoría, mapeo de riesgo/amenaza, activos afectados, controles existentes) está documentado en `configuracion/riesgos.md`.

### Niveles de riesgo obtenidos

Con la matriz clásica de SimpleRisk (probabilidad × impacto), se obtuvieron los siguientes resultados:

| Riesgo | Score | Nivel |
|---|---|---|
| Acceso indebido a historias clínicas digitales | 8 | Muy Alto |
| Filtración de datos por proveedor de facturación | 4.8 | Alto |
| Phishing dirigido a personal administrativo | 4.8 | Alto |
| Incumplimiento de normativa de protección de datos | 4.8 | Alto |
| Pérdida de datos por falla en backups | 4 | Alto |
| Caída del servidor de historias clínicas | 3.2 | Medio |
| Acceso físico no autorizado al data center | 3.2 | Medio |

### Priorización de planes de mitigación

De los 5 riesgos de nivel Alto o superior, se priorizaron 3 para desarrollar planes de mitigación formales, por representar vectores de riesgo distintos entre sí y tener mayor viabilidad de implementación a corto plazo:

**1. Acceso indebido a historias clínicas (el más crítico, score 8)**
- *Solución actual:* acceso controlado solo con usuario y contraseña, sin diferenciación de permisos por rol ni registro de auditoría.
- *Requisito de seguridad:* implementar control de acceso basado en roles (RBAC) que limite la visualización de historias clínicas al personal médico directamente involucrado, junto con un registro de auditoría de cada acceso.
- *Recomendación:* revisar y reasignar permisos según mínimo privilegio, capacitar al personal administrativo, y revisar los logs de auditoría trimestralmente.
- *Esfuerzo:* Considerable | *Responsable:* Analista de Riesgos | *Plazo:* 3 meses

**2. Phishing a personal administrativo (score 4.8)**
- *Solución actual:* no hay capacitación formal en seguridad; las cuentas se acceden solo con usuario y contraseña, sin segundo factor.
- *Requisito de seguridad:* activar autenticación de múltiples factores (MFA) en cuentas críticas y armar capacitación periódica para reconocer correos sospechosos.
- *Recomendación:* hacer simulacros de phishing periódicos para medir preparación del personal.
- *Esfuerzo:* Menor | *Responsable:* Analista de Riesgos | *Plazo:* 2 meses

**3. Incumplimiento normativo de protección de datos (score 4.8)**
- *Solución actual:* no existe ninguna política escrita sobre manejo de datos de salud, señalado por la auditoría externa como debilidad.
- *Requisito de seguridad:* redactar y aprobar formalmente una política de protección de datos de salud, alineada a la normativa vigente.
- *Recomendación:* revisión legal previa a la aprobación, difusión con capacitación breve, y verificación de cumplimiento cada 6 meses.
- *Esfuerzo:* Considerable | *Responsable:* Administrador | *Plazo:* 4 meses

Los tres planes fueron revisados y aprobados por el Administrador dentro de SimpleRisk (Management Review → Approve Risk → Submit as a Production Issue), cerrando el ciclo completo de identificación, evaluación, tratamiento y aprobación del riesgo.

Los riesgos de filtración por proveedor (#1004) y falla de backups (#1008) quedaron identificados y monitoreados, sin plan de mitigación formal en esta etapa, por una decisión de priorización dada la limitación de tiempo y recursos.

---

## Parte C - Análisis Crítico y Profundización

### C1. Comparación metodológica

SimpleRisk trabaja con una matriz clásica de probabilidad por impacto, en una escala de 5 niveles para cada eje. Es un método simple de aplicar y fácil de entender incluso para gente sin formación específica en riesgos, pero tiene un problema de fondo: los valores se asignan de forma bastante subjetiva, y dos personas analizando el mismo riesgo pueden llegar a números distintos sin que ninguna esté necesariamente equivocada.

NIST SP 800-30 propone algo más elaborado: antes de llegar a un número de riesgo, pide identificar de dónde viene la amenaza, qué evento concreto podría ocurrir, qué vulnerabilidad se estaría explotando y qué condiciones de la organización hacen que eso sea más o menos probable. Es un proceso más ordenado y queda todo documentado, pero también es más lento y exige más experiencia del equipo que lo aplica.

Para una organización como la clínica de este trabajo, que recién está armando su área de seguridad, tiene más sentido arrancar con un enfoque como el de SimpleRisk, que permite tener un primer relevamiento funcionando rápido. NIST SP 800-30 sería más apropiado en una etapa posterior, cuando la clínica necesite justificar con mayor detalle sus decisiones ante un directorio o un ente regulador.

*Fuente: Agencia de Gobierno Electrónico y Sociedad de la Información y del Conocimiento (AGESIC), "Estudio sobre metodologías de análisis de riesgos" — https://www.gub.uy/agencia-gobierno-electronico-sociedad-informacion-conocimiento/book/6611/download*

### C2. Integración con herramienta externa

Se pensó una integración con Slack para que el equipo de seguridad se entere de riesgos altos sin depender de revisar el listado manualmente todos los días. La idea sería un script que corra periódicamente (por ejemplo, cada 15 minutos mediante una tarea programada), consulte la base de datos de SimpleRisk buscando riesgos nuevos por encima de un puntaje definido, y por cada uno envíe un mensaje al canal de Slack del equipo mediante un webhook de entrada, incluyendo el ID del riesgo, el asunto y un link directo a la vista de detalle en SimpleRisk.

Esto evitaría que un riesgo alto pase desapercibido varios días solo porque nadie entró a revisar la plataforma. Como evolución futura, podría integrarse también con un sistema de tickets como Jira, generando automáticamente una tarea de seguimiento por cada riesgo alto detectado.

---

## Parte D - Actividad Optativa

### D1. Análisis de seguridad de la propia instalación

**1. Certificado TLS autofirmado por defecto.** Al acceder a `https://localhost/`, la instalación presenta un certificado autofirmado, lo que genera advertencias de seguridad en el navegador. En un entorno real, esto acostumbra a los usuarios a ignorar ese tipo de advertencias, facilitando ataques de intermediario (*man-in-the-middle*). **Mitigación:** reemplazar el certificado autofirmado por uno emitido por una autoridad certificadora reconocida (o una CA interna de la organización), y forzar la redirección de HTTP a HTTPS.

**2. Exposición directa de los puertos del contenedor sin proxy intermedio.** El comando de instalación (`docker run -p 80:80 -p 443:443`) expone la aplicación directamente en los puertos estándar del host, sin ningún componente intermedio que filtre tráfico malicioso o limite intentos de fuerza bruta contra el login. **Mitigación:** colocar SimpleRisk detrás de un reverse proxy (por ejemplo, Nginx) que gestione TLS y aplique límites de intentos de login por IP.

**3. Posible desactualización de PHP/MySQL en la imagen de Docker.** Durante la carga de datos se produjo un error de tipo "unsupported operand types" al cerrar un riesgo, típico de incompatibilidades entre versiones de PHP y código más antiguo de la aplicación. Esto sugiere que la imagen de Docker podría no estar corriendo la versión de PHP recomendada por los desarrolladores de SimpleRisk, lo cual además de causar errores funcionales puede dejar sin parchear vulnerabilidades conocidas. **Mitigación:** verificar la versión de PHP/MySQL de la imagen contra la matriz de compatibilidad oficial de SimpleRisk, y mantener un proceso de actualización periódica de la imagen.
