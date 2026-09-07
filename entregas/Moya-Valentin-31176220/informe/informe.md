## Notas Técnicas sobre la Implementación en SimpleRisk

### Diferencia entre cálculo manual y fórmula interna de SimpleRisk

Durante el relevamiento se utilizó una escala manual de Probabilidad × Impacto (1–5) para la priorización inicial, obteniendo valores como R2 = 20 o R4 = 16. Al cargar los mismos riesgos en SimpleRisk, la plataforma aplica su propia fórmula de matriz interna (que no es una multiplicación directa), resultando en valores como 8 o 6.4. **Ambos criterios mantienen el mismo orden de prioridad** (R2 &gt; R4 &gt; R1), por lo que la jerarquía de riesgos no se ve afectada. Se recomienda dejar constancia de este comportamiento para evitar confusiones en auditorías futuras.

### Riesgo Residual en estado "Mitigation Planned"

En los riesgos donde se creó un plan de mitigación (R2, R4, R1), SimpleRisk muestra el *Residual Risk* idéntico al *Inherent Risk* mientras el plan permanezca en estado *Planned* y no *Implemented*. Esto es correcto desde el punto de vista del sistema: el riesgo residual solo se recalcula una vez que los controles están efectivamente desplegados. En el reporte ejecutivo se presentan los valores de riesgo inherente como referencia de la exposición actual de la clínica.

---

## Comparación Metodológica: SimpleRisk (Matriz Clásica) vs. FAIR 

### Enfoque de SimpleRisk — Matriz Probabilidad × Impacto (cualitativa/ordinal)

SimpleRisk clasifica cada riesgo asignando valores ordinales de 1 a 5 tanto a la probabilidad como al impacto, y calcula el nivel de riesgo multiplicándolos (P×I). El resultado es una posición relativa dentro de una escala (Bajo/Medio/Alto/Crítico), pero no representa una magnitud real — un riesgo con valor 20 no es "el doble de grave" que uno con valor 10 en un sentido matemático estricto, es simplemente "más grave según la escala ordinal".

*Ejemplo aplicado:* nuestro R2 (Ransomware) quedó en Prob. 4 × Imp. 5 = 20 (Crítico). Esto nos dice que es el riesgo más urgente de la lista, pero no nos dice cuánto dinero podría perder la clínica si el ataque ocurre.

### Enfoque FAIR (Factor Analysis of Information Risk) — cuantitativo

FAIR descompone el riesgo en dos grandes factores: Frecuencia de Eventos de Pérdida (con cuánta frecuencia se espera que ocurra un evento de amenaza que resulte en pérdida) y Magnitud de Pérdida (el impacto económico estimado, descompuesto a su vez en pérdidas primarias —costos directos de respuesta, productividad perdida— y secundarias —multas, daño reputacional, pérdida de clientes—). El resultado final se expresa como un rango de pérdida monetaria anual esperada (ej. "entre USD 80.000 y USD 350.000 por año"), típicamente con un análisis de probabilidad tipo Monte Carlo.

*Ejemplo aplicado a R2:* con FAIR, en vez de decir "Crítico, valor 20", diríamos algo como: "Frecuencia estimada: 1 evento cada 2-3 años (basado en tasas del sector salud según Verizon DBIR). Magnitud de pérdida: entre USD 150.000 y USD 600.000, considerando costo de rescate no pagado pero sí downtime operativo, notificación a pacientes afectados, y posibles sanciones regulatorias por exposición de datos de salud. Pérdida anual esperada: ~USD 100.000."

### Ventajas y Desventajas

| Aspecto | SimpleRisk (matriz clásica) | FAIR |
|---|---|---|
| Velocidad de implementación | Alta — se completa en minutos por riesgo | Baja — requiere descomponer cada riesgo en múltiples factores y estimaciones |
| Necesidad de datos históricos | Baja — alcanza con criterio experto | Alta — sin datos de frecuencia/pérdida reales, las estimaciones son poco confiables |
| Comunicación con el negocio | Limitada — "Alto" o "Crítico" no dice cuánto cuesta | Excelente — hablar en dinero es el lenguaje que entiende un directorio o CFO |
| Comparabilidad entre riesgos | Relativa dentro de la misma escala | Permite comparar riesgos de seguridad con otros riesgos del negocio (financieros, operativos) en la misma unidad (dinero) |
| Subjetividad | Alta — dos analistas pueden asignar valores distintos al mismo riesgo | Menor, pero no elimina la subjetividad, solo la traslada a las estimaciones de frecuencia y magnitud |
| Curva de aprendizaje | Baja | Alta — requiere formación específica en el modelo |

### ¿En qué contexto conviene cada una?

SimpleRisk / matriz clásica conviene en organizaciones como la clínica del escenario: sin madurez alta en gestión de riesgos, sin un equipo de seguridad grande, y que necesitan un relevamiento inicial rápido y accionable — que es exactamente lo que pide este TP. Es el punto de partida razonable para "poner en orden" el registro de riesgos.

FAIR conviene cuando la organización ya tiene un programa de riesgos maduro y necesita justificar presupuesto de seguridad ante el directorio con números concretos ("si invertimos $50.000 en X control, reducimos la pérdida anual esperada de $200.000 a $60.000"), o cuando necesita comparar riesgos de ciberseguridad contra otros riesgos del negocio (ej. riesgo de mercado, riesgo legal) en una misma unidad de medida.

Conclusión: ambos enfoques no son excluyentes — una organización podría usar SimpleRisk para el relevamiento inicial rápido (como hicimos en este TP) y aplicar FAIR selectivamente sobre los 2-3 riesgos de mayor criticidad (en nuestro caso, R2 y R4) para justificar la inversión de los planes de mitigación ante la dirección.

## Actividad D2 Integración con Herramienta Externa: Discord (Webhook)

Se implementó una integración funcional entre SimpleRisk y Discord mediante un webhook, que notifica automáticamente cuando existen riesgos de nivel Alto o Crítico en el registro.

**Decisión de diseño:** la API REST oficial de SimpleRisk es un módulo pago ("Extra"), no incluido en la instalación Core/gratuita utilizada en este TP. Por ese motivo, la integración consulta directamente la base de datos MySQL interna del contenedor (tablas `risks` y `risk_scoring`), a la cual se tiene acceso completo por ser una instalación propia con Docker.

**Funcionamiento:** el script `scripts/simplerisk_discord_alert.sh` ejecuta una consulta SQL dentro del contenedor (`docker compose exec`) que filtra los riesgos con `calculated_risk >= 6.0` (equivalente a nuestros niveles Alto/Crítico), arma un mensaje con los datos obtenidos, y lo envía mediante `curl` a un webhook de Discord configurado en un canal dedicado a alertas.

**Prueba realizada:** se ejecutó el script manualmente y se confirmó la recepción correcta del mensaje en el canal de Discord, listando los 3 riesgos de mayor nivel (Ransomware, Phishing y Filtración de HCE) — ver captura en `informe/capturas/discord_webhook_funcionando.png`.

## Actividad Optativa D1: Análisis de Seguridad de la Instalación Propia

Se relevaron 3 debilidades potenciales en la instalación por defecto de SimpleRisk (imagen Docker `simplerisk/simplerisk:latest`), junto con sus mitigaciones propuestas.

### 1. Permisos excesivos en config.php

**Hallazgo:** el archivo `/var/www/simplerisk/includes/config.php`, que contiene la contraseña de la base de datos en texto plano, tiene permisos `-rw-r--r--` (644) con propietario `root:root`. Esto significa que cualquier usuario del sistema (no solo el proceso de Apache) puede leer las credenciales de la base de datos.

**Mitigación propuesta:** restringir los permisos a `640` o `600`, y asegurar que el propietario del archivo sea el usuario específico que ejecuta el servidor web (ej. `www-data`), evitando que procesos de otros usuarios puedan leerlo.

### 2. Content-Security-Policy excesivamente permisiva

**Hallazgo:** el header HTTP `Content-Security-Policy` devuelto por la aplicación es `default-src * 'unsafe-inline' 'unsafe-eval' data:`, lo cual habilita la carga de recursos desde cualquier origen y permite ejecución de JavaScript inline y `eval()` — los principales vectores de ataques de Cross-Site Scripting (XSS).

**Mitigación propuesta:** definir una política CSP restrictiva (ej. `default-src 'self'`), permitiendo explícitamente solo los orígenes estrictamente necesarios, y eliminar `unsafe-inline`/`unsafe-eval` en un entorno de producción.

### 3. Uso de tag `latest` sin control de versión fijo

**Hallazgo:** el `docker-compose.yml` utiliza la imagen `simplerisk/simplerisk:latest`. Si bien la versión instalada (PHP 8.3.6, MySQL 8.0.46) es relativamente reciente, el uso del tag `latest` implica que no hay control sobre cuándo se actualiza la imagen, ni garantía de reproducibilidad entre distintos `docker pull` (el contenido de `latest` puede cambiar sin aviso).

**Mitigación propuesta:** fijar una versión específica de la imagen (ej. `simplerisk/simplerisk:20260828-001`) en el `docker-compose.yml`, y establecer un proceso periódico manual de revisión de nuevas versiones y parches de seguridad antes de actualizar.


## Actividad Optativa D4: Propuesta de Mejora a SimpleRisk

### Issue: Agregar cálculo de riesgo residual visible en el listado principal de riesgos

**Tipo:** Feature Request / UX

**Descripción del problema:**

Actualmente, SimpleRisk muestra el "Inherent Risk" (riesgo inherente, sin controles aplicados) de forma prominente en el listado principal de riesgos (`Plan Mitigation`), pero el "Residual Risk" (riesgo remanente después de aplicar los controles/mitigaciones planificadas) solo es visible al entrar al detalle de cada riesgo individual.

Para una organización con un volumen considerable de riesgos (decenas o cientos), esto obliga a un responsable de seguridad a abrir riesgo por riesgo para conocer el verdadero estado de exposición después de aplicar los tratamientos, dificultando la priorización rápida.

**Comportamiento esperado:**

Agregar una columna **"Residual Risk"** en la tabla principal de `Plan Mitigation`, junto a la columna existente **"Inherent Risk (Current)"**, de forma que sea posible comparar de un vistazo el riesgo original con el riesgo remanente de cada riesgo, sin necesidad de ingresar al detalle individual.

**Valor para el usuario:**

Permite a un responsable de seguridad o a un directorio identificar rápidamente qué riesgos continúan presentando una exposición elevada a pesar de los controles o tratamientos planificados, facilitando la priorización y la toma de decisiones sobre dónde reforzar las medidas de mitigación.

**Criterios de aceptación:**

- La tabla de `Plan Mitigation` muestra una nueva columna **"Residual Risk"** junto a **"Inherent Risk (Current)"**.
- Si un riesgo todavía no tiene un plan de mitigación cargado, la columna muestra **"N/A"** o el mismo valor correspondiente al riesgo inherente.
- La columna **"Residual Risk"** es ordenable, al igual que las demás columnas de la tabla.

**Etiquetas sugeridas:**

`enhancement`, `ux`, `risk-management`
