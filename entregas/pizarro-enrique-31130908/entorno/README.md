# Entorno de SimpleRisk

Instrucciones para levantar la instancia de SimpleRisk utilizada en este trabajo
práctico. El objetivo es que el entorno sea reproducible: siguiendo estos pasos
se obtiene una instalación equivalente a la que se usó para cargar los riesgos
documentados en `configuracion/riesgos.md`.

## Requisitos previos

- Docker Engine
- Docker Compose (plugin v2)

Versiones utilizadas durante el desarrollo:

- Docker version 29.7.2, build 1.fc44
- Docker Compose version 5.5.0
- Sistema operativo: Bazzite (Fedora Atomic)

Para verificar que están instalados:

    docker --version
    docker compose version

## Levantar el entorno

Desde esta carpeta (`entorno/`):

    docker compose up -d

La primera ejecución descarga la imagen `simplerisk/simplerisk` desde Docker Hub,
por lo que puede demorar varios minutos según la conexión.

Para verificar que el contenedor está corriendo:

    docker compose ps

El estado de la columna correspondiente debe indicar `running`.

## Acceso a la aplicación

Una vez levantado el contenedor, la aplicación queda disponible en:

    https://localhost:8443

El navegador va a mostrar una advertencia de certificado no confiable. Es
esperable: la imagen incluye un certificado autofirmado. Hay que aceptar la
excepción para continuar.

## Primer acceso: creación del usuario administrador

La imagen se inicia sin ninguna cuenta de administrador creada. El primer acceso
redirige automáticamente a la pantalla **Default Admin Account Creation**, donde
se define el usuario administrador inicial.

Para este trabajo se utilizaron credenciales ficticias. Los usuarios creados y
sus roles están documentados en `../configuracion/usuarios.md`. **Las
contraseñas no se incluyen en este repositorio**, según lo indicado en las
consideraciones de seguridad de la consigna.

## Gestión del contenedor

Para detener el entorno sin perder los datos cargados:

    docker compose stop

Para volver a iniciarlo:

    docker compose start

**Importante:** no utilizar `docker compose down`. Ese comando elimina el
contenedor.

## Decisiones de diseño

**Imagen all-in-one en lugar de `simplerisk-minimal`.** El repositorio oficial
de SimpleRisk ofrece dos imágenes: `simplerisk`, que incluye el stack LAMP
completo y las utilidades de correo, y `simplerisk-minimal`, que contiene
únicamente la aplicación y requiere conectarse a una base de datos externa. Se
optó por la primera porque reduce la cantidad de componentes que pueden fallar y
permite levantar el entorno completo con un solo comando, lo que favorece la
reproducibilidad, que es el objetivo de esta sección.

**Puertos 8080 y 8443 en lugar de 80 y 443.** Los puertos por debajo de 1024 son
privilegiados en sistemas Linux y suelen estar ocupados por otros servicios. El
mapeo a puertos altos evita conflictos y permite levantar el entorno sin
permisos elevados.

**Uso de Docker Compose en lugar de `docker run`.** La documentación oficial de
SimpleRisk propone un comando `docker run` directo. Se optó por Compose porque
deja la configuración declarada en un archivo versionado en el repositorio, lo
que hace explícitos los puertos y las opciones utilizadas, en lugar de depender
de que quien reproduzca el entorno recuerde los parámetros correctos.

**Ausencia de volumen persistente.** La configuración no define un volumen para
la base de datos. La imagen inicializa MySQL durante el arranque del contenedor,
y montar un volumen vacío sobre el directorio de datos puede interferir con esa
inicialización. Dado que el alcance del trabajo es un entorno de laboratorio de
corta duración, se priorizó que el arranque sea confiable sobre la persistencia
entre recreaciones del contenedor.
