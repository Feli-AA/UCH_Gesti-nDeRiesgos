\# Informe del Trabajo Práctico: Gestión de Riesgos con SimpleRisk



\## 1. Introducción



El presente trabajo práctico tiene como objetivo aplicar un proceso de gestión de riesgos de seguridad mediante SimpleRisk. Para ello se utiliza el escenario simulado de una clínica privada con 120 empleados, una atención aproximada de 800 pacientes diarios y sistemas que administran historias clínicas digitales, información de obras sociales y datos de facturación.



El trabajo comprende la instalación reproducible de SimpleRisk, la configuración de usuarios con responsabilidades diferenciadas, la identificación y evaluación de riesgos, la definición de planes de tratamiento y el análisis crítico de la metodología utilizada.



\## 2. Instalación y configuración del entorno



SimpleRisk fue instalado localmente mediante Docker Desktop sobre Windows y WSL 2. Se utilizó la imagen oficial `simplerisk/simplerisk`.



Para facilitar la reproducción del entorno se creó un archivo `docker-compose.yml`, junto con un script `setup.ps1` para Windows. La aplicación se configuró para utilizar los puertos locales 8081 para HTTP y 8444 para HTTPS.



El acceso a la aplicación se realiza mediante:



```text

https://localhost:8444



3\. Configuración de usuarios y permisos



Se crearon tres usuarios con responsabilidades diferenciadas:



Usuario	Función	Responsabilidades

admin\_clinica	Administrador de Seguridad	Administración general, configuración y gestión de usuarios.

analista\_riesgos	Analista de Riesgos	Registro y modificación de riesgos, planificación de mitigaciones y administración de proyectos.

auditor\_clinica	Auditor de Seguridad	Revisión de riesgos y registro de observaciones sin capacidad de modificación.



Los permisos se asignaron aplicando el principio de mínimo privilegio y procurando separar las tareas de registro, modificación, revisión y aprobación.



Las contraseñas utilizadas no se documentan ni se incluyen en el repositorio.



4\. Riesgo de prueba



Antes de registrar los riesgos definitivos se creó el riesgo TEST-001, denominado “Vulnerabilidad técnica en el sistema de turnos”.



Este registro permitió verificar:



La creación y evaluación de riesgos.

El funcionamiento del método de puntuación Classic.

La asociación de activos.

La visualización del riesgo inherente y residual.



El riesgo fue evaluado con nivel bajo y no forma parte del análisis definitivo.



5\. Escenario y supuestos



El análisis se realizó considerando los siguientes supuestos:



La clínica utiliza sistemas digitales para las historias clínicas y los turnos.

Los empleados utilizan correo electrónico y credenciales individuales.

Existen controles básicos, pero la auditoría externa detectó debilidades en su gestión.

La organización dispone de antivirus, contraseñas y copias de seguridad básicas.

No se asume la existencia de autenticación multifactor, protección EDR, segmentación completa ni pruebas periódicas de recuperación.

Todos los datos, usuarios y activos registrados son ficticios.

6\. Metodología de evaluación



Se utilizó una matriz de probabilidad e impacto con valores de 1 a 5.



Valor	Probabilidad	Impacto

1	Muy improbable	Insignificante

2	Poco probable	Menor

3	Posible	Moderado

4	Probable	Grave

5	Muy probable	Crítico



El nivel académico se calculó mediante:



Nivel de riesgo = Probabilidad × Impacto



Los resultados fueron clasificados de la siguiente manera:



Resultado	Clasificación

1 a 4	Bajo

5 a 9	Medio

10 a 16	Alto

17 a 25	Crítico



SimpleRisk utiliza internamente el método Classic, por lo que los valores numéricos mostrados por la aplicación pueden diferir de la multiplicación académica. Sin embargo, se mantuvo la escala de 1 a 5 para justificar la probabilidad y el impacto de manera uniforme.



7\. Riesgos identificados



Se registraron siete riesgos específicos del contexto de la clínica:



Ataque de ransomware sobre las historias clínicas digitales.

Acceso no autorizado mediante credenciales comprometidas.

Campaña de phishing dirigida al personal.

Alteración accidental o maliciosa de historias clínicas.

Falla en las copias de seguridad y recuperación.

Indisponibilidad del sistema clínico por falla de infraestructura.

Pérdida o robo de dispositivos con información clínica.



El detalle completo de categorías, activos, niveles, controles y tratamientos se encuentra en configuracion/riesgos.md.



8\. Planes de acción



Se crearon tres planes de acción asociados a riesgos críticos.



8.1. Protección y recuperación frente a ransomware

Responsable: Administrador de Seguridad.

Fecha de vencimiento: 15 de diciembre de 2026.

Presupuesto estimado: USD 30.000.

Estado inicial: No iniciado.

Acciones: estrategia de copias 3-2-1, protección EDR, autenticación multifactor, segmentación de red, actualizaciones y pruebas de recuperación.

8.2. Fortalecimiento del control de acceso

Responsable: Administrador de Seguridad.

Fecha de vencimiento: 30 de noviembre de 2026.

Presupuesto estimado: USD 15.000.

Estado inicial: No iniciado.

Acciones: autenticación multifactor, mínimo privilegio, eliminación de cuentas compartidas y revisiones trimestrales de permisos.

8.3. Prevención y detección de phishing

Responsable: Analista de Riesgos.

Fecha de vencimiento: 31 de octubre de 2026.

Presupuesto estimado: USD 10.000.

Estado inicial: No iniciado.

Acciones: protección avanzada del correo, autenticación multifactor, capacitación y simulaciones trimestrales.

9\. Evidencias



En la carpeta informe/capturas se incorporarán capturas de:



Pantalla principal de SimpleRisk.

Usuarios y permisos configurados.

Listado de riesgos.

Detalle de un riesgo crítico.

Planes de mitigación.

Inventario de activos verificados.



Las capturas no deberán contener contraseñas, credenciales ni información personal real.

## 10. Comparación metodológica con NIST SP 800-30

### 10.1. Enfoque utilizado por SimpleRisk

En este trabajo se utilizó el método Classic de SimpleRisk. Este enfoque combina la probabilidad y el impacto para obtener un puntaje que facilita la clasificación y priorización de los riesgos.

SimpleRisk normaliza los puntajes en una escala de 0 a 10. Por esta razón, el valor mostrado por la aplicación puede diferir del resultado de la matriz académica de 1 a 25 utilizada en este informe.

Su principal ventaja es la simplicidad. Permite registrar riesgos rápidamente, compararlos mediante una escala uniforme, asignar responsables y asociar planes de mitigación.

Su principal desventaja es que la puntuación depende en gran medida del criterio de la persona que selecciona la probabilidad y el impacto. Si las escalas y justificaciones no están claramente definidas, dos analistas podrían asignar valores diferentes al mismo riesgo.

### 10.2. Enfoque de NIST SP 800-30

NIST SP 800-30 Rev. 1 proporciona una guía estructurada para realizar evaluaciones de riesgos sobre sistemas de información y organizaciones. El proceso contempla tres etapas generales:

1. Preparar la evaluación.
2. Realizar la evaluación.
3. Comunicar y mantener sus resultados.

Durante la evaluación se analizan elementos como las fuentes de amenaza, los eventos de amenaza, las vulnerabilidades, las condiciones predisponentes, la probabilidad de ocurrencia y los impactos sobre las operaciones, los activos y las personas.

Este enfoque permite comprender no solamente el puntaje final, sino también la manera en que una amenaza podría aprovechar una vulnerabilidad y producir consecuencias para la organización.

### 10.3. Ventajas y desventajas

| Aspecto | SimpleRisk Classic | NIST SP 800-30 |
|---|---|---|
| Facilidad de aplicación | Alta; utiliza probabilidad e impacto. | Menor; requiere un análisis más detallado. |
| Tiempo necesario | Relativamente reducido. | Mayor debido a sus etapas y factores. |
| Profundidad | Adecuada para priorización inicial. | Alta; analiza amenazas, eventos, vulnerabilidades y condiciones. |
| Consistencia | Depende de escalas y criterios previamente definidos. | Proporciona un proceso más estructurado y documentado. |
| Comunicación ejecutiva | Los puntajes y colores son fáciles de interpretar. | Sus resultados requieren mayor explicación. |
| Mantenimiento | SimpleRisk facilita actualizar riesgos y tratamientos. | NIST exige mantener y actualizar formalmente la evaluación. |
| Recursos necesarios | Puede aplicarse en organizaciones pequeñas o medianas. | Puede requerir personal especializado y más información. |

### 10.4. Contexto recomendado para cada enfoque

El enfoque Classic de SimpleRisk resulta apropiado para una clínica que necesita construir rápidamente un registro inicial, ordenar prioridades y asignar responsables. También es útil cuando la organización todavía no posee un proceso maduro de gestión de riesgos.

NIST SP 800-30 es más adecuado para evaluaciones formales, sistemas críticos, auditorías exhaustivas y organizaciones que necesitan documentar detalladamente las relaciones entre amenazas, vulnerabilidades, controles e impactos.

Para el escenario de la clínica podría utilizarse SimpleRisk como herramienta operativa y NIST SP 800-30 como guía metodológica. De este modo, SimpleRisk permitiría administrar el registro y los planes de acción, mientras que NIST aportaría profundidad y consistencia al proceso de evaluación.

## 11. Integración de SimpleRisk con Discord

### 11.1. Objetivo

Se propone integrar SimpleRisk con Discord para notificar al equipo de seguridad cuando se registre o detecte un riesgo de nivel alto o crítico. Esta integración permitiría informar rápidamente a los responsables sin depender de que revisen continuamente el panel de SimpleRisk.

### 11.2. Funcionamiento propuesto

La integración estaría compuesta por:

1. Una cuenta técnica de SimpleRisk con permisos mínimos de lectura.
2. Una clave de API asociada exclusivamente a esa cuenta.
3. Un script de integración ejecutado periódicamente.
4. Un webhook privado conectado con un canal de Discord destinado a alertas de seguridad.

El script consultaría los riesgos registrados en SimpleRisk y seleccionaría aquellos cuyo nivel fuera alto o muy alto. Al detectar un nuevo riesgo que cumpla esa condición, enviaría al webhook un mensaje con:

- Identificador del riesgo.
- Nombre.
- Nivel.
- Propietario.
- Estado.
- Fecha de detección.
- Enlace al registro dentro de SimpleRisk.

Un ejemplo de notificación sería:

```text
ALERTA DE RIESGO ALTO

ID: CLI-RISK-001
Riesgo: Ataque de ransomware sobre las historias clínicas digitales
Nivel: Alto
Propietario: Administrador de Seguridad
Estado: Nuevo

11.3. Flujo de información

El flujo propuesto sería el siguiente:

El analista registra o modifica un riesgo en SimpleRisk.
El script consulta periódicamente la API.
El script compara el nivel del riesgo con el umbral configurado.
Si el riesgo es alto o crítico, prepara un mensaje.
El mensaje es enviado al webhook del canal de Discord.
El equipo de seguridad recibe la alerta y accede a SimpleRisk para revisar el registro.
11.4. Consideraciones de seguridad

La clave de API y la URL del webhook se almacenarían en variables de entorno y nunca se incluirían directamente en el código ni en GitHub.

La cuenta utilizada para la integración tendría únicamente permisos de lectura. También se debería evitar incluir historias clínicas, nombres de pacientes u otros datos sensibles en los mensajes enviados.

Se recomienda registrar los errores del script sin guardar claves, tokens ni contenido sensible. La clave de API y el webhook deberían poder revocarse y renovarse ante una posible exposición.

11.5. Ventajas de la integración
Notificación rápida de riesgos prioritarios.
Menor dependencia de revisiones manuales.
Mejor comunicación entre analistas y responsables.
Posibilidad de conservar un historial de alertas.
Implementación sencilla mediante solicitudes HTTP y mensajes JSON.
11.6. Limitaciones
El webhook depende de la disponibilidad de Discord y de la conexión a Internet.
Una configuración incorrecta podría exponer información sensible.
La consulta periódica no necesariamente produce alertas en tiempo real.
Debe evitarse el envío repetido del mismo riesgo.
Discord no reemplaza el registro oficial mantenido en SimpleRisk.

## 12. Actividad optativa D1: análisis de seguridad de la instalación

La instalación realizada es adecuada para un entorno académico local, pero no debería utilizarse directamente en producción sin aplicar medidas adicionales. Se identificaron las siguientes debilidades y posibles mitigaciones.

### 12.1. Certificado HTTPS autofirmado

La imagen genera un certificado autofirmado para habilitar HTTPS. Como el certificado no pertenece a una autoridad confiable, el navegador muestra una advertencia y el usuario debe aceptar manualmente la conexión.

Esta práctica puede acostumbrar a los usuarios a ignorar advertencias de seguridad y dificulta comprobar la identidad real del servidor.

**Mitigación propuesta:** utilizar un certificado emitido por una autoridad certificadora confiable o implementar un proxy inverso con un certificado válido. Para un entorno interno también podría utilizarse una autoridad certificadora privada administrada por la organización.

### 12.2. Exposición innecesaria del puerto HTTP

El archivo `docker-compose.yml` publica tanto el puerto HTTP 8081 como el puerto HTTPS 8444. La existencia de un acceso sin cifrado podría permitir que usuarios ingresen por HTTP y expongan credenciales o información durante la transmisión.

**Mitigación propuesta:** publicar únicamente el puerto HTTPS o configurar una redirección obligatoria desde HTTP hacia HTTPS. También se debería limitar el acceso mediante reglas de firewall y permitir conexiones solamente desde redes autorizadas.

### 12.3. Uso de la etiqueta `latest`

La configuración utiliza la imagen `simplerisk/simplerisk:latest`. Esta etiqueta puede apuntar a una versión diferente en el futuro, por lo que dos instalaciones realizadas en fechas distintas podrían ejecutar versiones diferentes.

El cambio no controlado de versión puede afectar la reproducibilidad, introducir incompatibilidades o dificultar la validación de actualizaciones.

**Mitigación propuesta:** fijar una versión específica o el digest de la imagen. Las actualizaciones deben realizarse de manera planificada, luego de revisar notas de versión, realizar una copia de seguridad y probar la nueva versión en un entorno separado.

### 12.4. Falta de persistencia y respaldo explícito

La instalación de laboratorio almacena la base de datos y la configuración dentro del contenedor. Detener el contenedor no elimina la información, pero su eliminación accidental podría provocar la pérdida de usuarios, riesgos, configuraciones y evidencias.

**Mitigación propuesta:** utilizar volúmenes persistentes para la base de datos, el archivo de configuración, los archivos subidos y los registros. También se deben realizar copias de seguridad periódicas y pruebas de restauración.

### 12.5. Conclusión del análisis

La instalación actual resulta suficiente para ejecutar el trabajo práctico en un equipo local. Sin embargo, una implementación real debería fortalecer el cifrado, reducir los servicios expuestos, controlar las versiones utilizadas y asegurar la persistencia y recuperación de la información.

Estas mejoras reducen riesgos relacionados con la confidencialidad, integridad, disponibilidad y cadena de suministro del entorno.



## 13. Fuentes consultadas

- National Institute of Standards and Technology. “NIST SP 800-30 Rev. 1: Guide for Conducting Risk Assessments”. https://csrc.nist.gov/pubs/sp/800/30/r1/final
- SimpleRisk. “Normalizing Risk Scoring Across Different Methodologies”. https://www.simplerisk.com/blog/normalizing-risk-scoring-across-different-methodologies
- SimpleRisk. “The Risk Formula”. https://support.simplerisk.com/kb/06-02-the-risk-formula
- SimpleRisk. “API Overview”. https://support.simplerisk.com/kb/08-01-api-overview
- Discord Developer Documentation. “Webhook Resource”. https://docs.discord.com/developers/resources/webhook
- SimpleRisk. “Installing via Docker”. https://support.simplerisk.com/kb/01-03-installing-via-docker
- SimpleRisk. “Upgrading via Docker”. https://support.simplerisk.com/kb/02-02-upgrading-via-docker
- SimpleRisk. “Database Backup and Restore”. https://support.simplerisk.com/kb/02-05-database-backup-and-restore
- Docker Documentation. “Image digests”. https://docs.docker.com/dhi/explore/security-concepts/digests/
