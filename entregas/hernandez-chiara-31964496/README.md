# Trabajo Práctico: Gestión de Riesgos con SimpleRisk

## Datos de la estudiante

* Nombre completo: Chiara Hernandez
* LU: 31964496
* Email institucional: hernandezchiara@uch.edu.ar
* Comisión: G

## Descripción

El trabajo consiste en instalar y configurar SimpleRisk y utilizarlo para gestionar los riesgos de una clínica privada ficticia de 120 empleados, que atiende aproximadamente 800 pacientes por día y administra historias clínicas digitales, datos de obras sociales y facturación.

## Requisitos previos

* Git
* Docker Desktop
* Docker Compose
* Navegador web
* Puertos 8081 y 8443 disponibles

## Instrucciones para levantar el entorno

1. Clonar el repositorio con `git clone https://github.com/arelgueta/UCH_Gesti-nDeRiesgos.git`.

2. Ingresar al repositorio con `cd UCH_Gesti-nDeRiesgos`.

3. Cambiar a la branch de la entrega con `git switch entrega/hernandez-chiara-31964496`.

4. Ingresar al entorno con `cd entregas/hernandez-chiara-31964496/entorno`.

5. Crear el archivo local `.env` a partir de `.env.example`.

   En Windows PowerShell: `Copy-Item .env.example .env`

   En Linux o macOS: `cp .env.example .env`

6. Editar `.env` y reemplazar los valores indicados por contraseñas locales seguras. El archivo `.env` no debe incorporarse al repositorio.

7. Abrir Docker Desktop y esperar hasta que el motor se encuentre en ejecución.

8. Levantar los servicios con `docker compose up -d`.

9. Comprobar su estado con `docker compose ps`. Los servicios `mysql` y `simplerisk` deben aparecer en ejecución y con estado saludable.

10. Acceder a SimpleRisk desde `https://127.0.0.1:8443`.

    El navegador puede advertir que el certificado no es de confianza porque la instalación local utiliza un certificado autofirmado.

11. Iniciar sesión con las credenciales de administrador definidas localmente en `.env`.

## Detención del entorno

Para detener los contenedores sin eliminar la información, ejecutar:

`docker compose down`

No utilizar `docker compose down -v`, porque la opción `-v` elimina el volumen que contiene la base de datos.

## Decisiones de diseño

* Se utilizó Docker Compose para obtener una instalación aislada y reproducible.
* SimpleRisk y MySQL se ejecutan en contenedores separados.
* La base de datos no publica su puerto hacia el equipo anfitrión.
* Los datos se conservan mediante un volumen persistente de Docker.
* Las credenciales locales se almacenan en `.env`, archivo excluido mediante `.gitignore`.
* Se incluye `.env.example` para documentar las variables necesarias sin exponer contraseñas.
* Se utiliza una versión identificada de la imagen oficial de SimpleRisk.
* El escenario es ficticio y no contiene información real de pacientes, empleados o infraestructura.
* La valoración seguirá la matriz de probabilidad por impacto proporcionada por la cátedra.

## Verificación

Palabra de verificación de lectura completa de la consigna: **girasol**.

## Checklist de auto-revisión

* [x] No hay credenciales en el repositorio.
* [x] El `.gitignore` está correctamente configurado.
* [x] Las capturas incorporadas hasta el momento no muestran datos sensibles.
* [x] Los archivos `.sql` o dumps no están subidos.
* [ ] El informe está completo y en formato legible.
* [ ] El reporte ejecutivo está completo.
* [x] Los mensajes de commit son descriptivos.
* [ ] Mi branch está actualizada y funciona.
