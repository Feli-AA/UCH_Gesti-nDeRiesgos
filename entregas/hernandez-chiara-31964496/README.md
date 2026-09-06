# Trabajo Práctico: Gestión de Riesgos con SimpleRisk

## Datos de la estudiante

* Nombre completo: Chiara Hernandez
* LU: 31964496
* Email institucional: [hernandezchiara@uch.edu.ar](mailto:hernandezchiara@uch.edu.ar)
* Comisión: G

## Descripción

El trabajo consiste en instalar y configurar SimpleRisk y utilizarlo para gestionar los riesgos de una clínica privada ficticia de 120 empleados, que atiende aproximadamente 800 pacientes por día y administra historias clínicas digitales, datos de obras sociales y facturación. Además, se implementó una integración real con herramientas externas (n8n, Discord y GitHub Issues) para automatizar la notificación y el seguimiento de riesgos altos y críticos.

## Requisitos previos

* Git
* Docker Desktop
* Docker Compose
* Navegador web
* Puertos 8081, 8443 y 5678 disponibles

## Instrucciones para levantar el entorno

1. Clonar el repositorio:

   git clone https://github.com/arelgueta/UCH_Gesti-nDeRiesgos.git

2. Ingresar al repositorio:

   cd UCH_Gesti-nDeRiesgos

3. Cambiar a la branch de la entrega:

   git switch entrega/hernandez-chiara-31964496

4. Ingresar al directorio del entorno:

   cd entregas/hernandez-chiara-31964496/entorno

5. Crear el archivo local `.env` a partir de `.env.example`.

   En Windows PowerShell:

   Copy-Item .env.example .env

   En Linux o macOS:

   cp .env.example .env

6. Editar `.env` y reemplazar los valores de ejemplo por contraseñas locales seguras, incluyendo `N8N_ENCRYPTION_KEY` (una cadena aleatoria propia, no reutilizada de otro entorno). El archivo `.env` contiene credenciales y no debe incorporarse al repositorio.

7. Abrir Docker Desktop y esperar hasta que el motor de Docker se encuentre en ejecución.

8. Inicializar la base de datos y SimpleRisk. Este procedimiento debe ejecutarse solamente la primera vez:

   docker compose up -d mysql
   docker compose run --rm -e DB_SETUP=automatic-only simplerisk
   docker compose up -d simplerisk

   El primer comando inicia MySQL. El segundo ejecuta un contenedor temporal que crea la base de datos, las tablas, el usuario de aplicación y la cuenta administradora. Al finalizar la inicialización, el contenedor temporal se elimina. El tercer comando inicia normalmente SimpleRisk.

9. Levantar n8n:

   docker compose up -d n8n

10. Comprobar el estado de los servicios:

    docker compose ps

    Los servicios `mysql` y `simplerisk` deben aparecer en ejecución y con estado saludable. El servicio `n8n` debe aparecer en ejecución.

11. Acceder a SimpleRisk desde https://127.0.0.1:8443.

    El navegador puede advertir que el certificado no es de confianza porque la instalación local utiliza un certificado autofirmado.

12. Acceder a n8n desde http://127.0.0.1:5678 (solo accesible desde el equipo local).

13. Iniciar sesión en SimpleRisk con las credenciales de administrador definidas localmente en `.env`.

14. La integración requiere configurar localmente en n8n tres credenciales: el acceso de solo lectura a MySQL mediante el usuario `n8n_reader`, el webhook de Discord y el token de acceso de GitHub. Ninguna contraseña, URL privada o token se incorpora al repositorio ni al `docker-compose.yml`; las credenciales quedan cifradas en el volumen `n8n_data` mediante `N8N_ENCRYPTION_KEY`.

## Ejecuciones posteriores

Después de haber inicializado la base de datos, no se debe repetir el procedimiento de inicialización. Para volver a levantar el entorno se utiliza:

docker compose up -d

Luego puede verificarse su estado mediante:

docker compose ps

## Detención del entorno

Para detener los contenedores sin eliminar la información, ejecutar:

docker compose down

No utilizar:

docker compose down -v

La opción `-v` elimina los volúmenes persistentes, incluyendo la base de datos de SimpleRisk y el estado guardado de n8n (flujos y credenciales configuradas).

## Decisiones de diseño

* Se utilizó Docker Compose para obtener una instalación aislada y reproducible.
* SimpleRisk, MySQL y n8n se ejecutan en contenedores separados.
* La base de datos no publica su puerto hacia el equipo anfitrión.
* Los datos se conservan mediante volúmenes persistentes de Docker (`simplerisk_mysql_data` y `n8n_data`).
* Las credenciales locales se almacenan en `.env`, archivo excluido mediante `.gitignore`.
* Se incluye `.env.example` para documentar las variables necesarias sin exponer contraseñas.
* Se utiliza una versión identificada de la imagen oficial de SimpleRisk y de n8n.
* La inicialización automática de la base de datos se ejecuta una sola vez mediante `DB_SETUP=automatic-only`.
* Los inicios posteriores omiten `DB_SETUP` para evitar que SimpleRisk intente crear nuevamente una base de datos ya existente.
* Se aplicó el principio de mínimo privilegio al configurar los roles Administrador, Analista de Riesgos, Auditor y Propietario de Riesgo (este último representa a los responsables organizacionales de cada área — Seguridad de la Información, Dirección Médica, Administración y Finanzas, e Infraestructura y TI).
* Se separaron las funciones de registro, revisión, aprobación y cierre de riesgos entre distintos roles.
* Los usuarios no administrativos fueron configurados con autenticación multifactor y cambio obligatorio de contraseña en el primer inicio de sesión.
* - n8n se expone únicamente en `127.0.0.1:5678` para reducir la superficie de exposición, ya que solamente necesita ser utilizado desde el equipo local.
* `N8N_SECURE_COOKIE` se desactivó porque el servicio corre sobre HTTP en localhost; en un despliegue real correspondería servir n8n bajo HTTPS y mantener ese flag activo.
* La dependencia de arranque de n8n respecto del healthcheck de MySQL solo garantiza un orden de inicio consistente entre contenedores; - n8n conserva su propio estado, sus flujos y sus credenciales en el volumen `n8n_data`. Además, se conecta al servicio MySQL de SimpleRisk mediante un usuario dedicado con permisos exclusivos de lectura.
* El escenario es ficticio y no contiene información real de pacientes, empleados o infraestructura.
* La valoración siguió la matriz de probabilidad por impacto proporcionada por la cátedra.
* Se implementó una integración real (Parte C, punto 2, y actividad optativa D2) mediante un flujo de n8n que notifica riesgos de nivel Alto/Crítico a Discord y crea automáticamente un Issue en GitHub por cada uno.

## Verificación

Palabra de verificación de lectura completa de la consigna: **girasol**.

## Checklist de auto-revisión

* [x] No hay credenciales en el repositorio.
* [x] El `.gitignore` está correctamente configurado.
* [x] Las capturas no muestran datos sensibles.
* [x] Los archivos `.sql` o dumps no están subidos.
* [x] El informe está completo y en formato legible.
* [x] El reporte ejecutivo está completo.
* [x] Los mensajes de commit son descriptivos.
* [x] Mi branch está actualizada y funciona.