# Análisis de Seguridad de la Instalación de SimpleRisk

## Actividad Optativa D1

Para la actividad optativa D1 decidí analizar la seguridad de la propia instalación de SimpleRisk que usé para el trabajo.

Elegí esta opción porque me permitía revisar una configuración real del entorno sin depender de servicios externos ni modificar los riesgos y planes que ya tenía cargados.

Para hacer la revisión utilicé el siguiente comando:

```bash
curl -I -k https://localhost/
```

Con este comando pude ver los headers HTTP que devuelve el servidor y, a partir de eso, detecté los siguientes puntos.

## Hallazgo 1 — Content-Security-Policy demasiado permisiva

### Evidencia

```text
Content-Security-Policy: default-src * 'unsafe-inline' 'unsafe-eval' data:
```

### Riesgo

La política CSP actual permite cargar contenido desde prácticamente cualquier origen por el uso de `*`.

Además, también permite `'unsafe-inline'` y `'unsafe-eval'`, lo que hace que la protección contra posibles ataques XSS sea mucho más débil.

Esto no significa que la aplicación tenga automáticamente una vulnerabilidad XSS, pero si existiera algún punto de inyección, esta política ayudaría poco a bloquearlo.

### Mitigación propuesta

Restringir la política para permitir principalmente contenido del mismo origen, por ejemplo:

```text
default-src 'self'
```

Después se podrían habilitar de forma específica solamente los recursos externos que realmente necesite la aplicación.

También sería conveniente reducir o eliminar `'unsafe-inline'` y `'unsafe-eval'` siempre que SimpleRisk pueda funcionar correctamente sin esas opciones.

**Prioridad:** Alta.

## Hallazgo 2 — Referrer-Policy duplicada

### Evidencia

```text
Referrer-Policy: no-referrer-when-downgrade
Referrer-Policy: origin
```

### Riesgo

El mismo header aparece dos veces y con valores diferentes.

Esto probablemente significa que está siendo configurado desde más de un lugar, por ejemplo desde Apache y también desde la aplicación.

No es una vulnerabilidad grave por sí sola, pero sí muestra una configuración poco clara y puede generar comportamientos distintos a los esperados.

### Mitigación propuesta

Configurar `Referrer-Policy` desde un solo lugar y eliminar la duplicación.

Una alternativa podría ser:

```text
Referrer-Policy: strict-origin-when-cross-origin
```

Siempre verificando antes que no genere problemas con el funcionamiento de la aplicación.

**Prioridad:** Media.

## Hallazgo 3 — El servidor informa que utiliza Apache

### Evidencia

```text
Server: Apache
```

### Riesgo

El servidor informa directamente que utiliza Apache.

No se muestra la versión exacta, por lo que la información expuesta es limitada, pero igualmente le da a un posible atacante un dato extra sobre la infraestructura utilizada.

Este punto no representa un riesgo importante por sí solo, pero forma parte de las buenas prácticas de hardening reducir información que no sea necesaria.

### Mitigación propuesta

Mantener Apache configurado para mostrar la menor cantidad de información posible:

```apache
ServerTokens Prod
ServerSignature Off
```

Lo más importante sigue siendo mantener Apache actualizado y correctamente configurado.

**Prioridad:** Baja.

## Evidencia completa

El comando utilizado fue:

```bash
curl -I -k https://localhost/
```

Resultado:

```text
HTTP/1.1 200 OK
Date: Tue, 08 Sep 2026 15:24:48 GMT
Server: Apache
Strict-Transport-Security: max-age=63072000; includeSubdomains; preload
X-Xss-Protection: 1; mode=block
Referrer-Policy: no-referrer-when-downgrade
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Referrer-Policy: origin
Content-Security-Policy: default-src * 'unsafe-inline' 'unsafe-eval' data:
Set-Cookie: SimpleRisk=[valor de sesion omitido]; path=/; secure; HttpOnly; SameSite=Strict
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Content-Type: text/html; charset=utf-8
```


## Conclusión

Con esta revisión se encontraron tres puntos que se podrían mejorar en la instalación de SimpleRisk.

El más importante es la configuración de Content-Security-Policy, ya que actualmente es bastante permisiva.

Los otros dos hallazgos son más bien mejoras de configuración y hardening, pero también sirven para dejar el entorno más prolijo y reducir información innecesaria.

Esta actividad también permitió revisar no solamente los riesgos cargados dentro de SimpleRisk, sino la seguridad de la propia herramienta utilizada para gestionarlos.
