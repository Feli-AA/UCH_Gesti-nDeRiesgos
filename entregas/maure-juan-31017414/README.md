DATOS DEL ALUMNO
Nombre del alumno: Juan Maure - 31017414 - juanmaure123@outlook.com
Comision: G

Instrucciones para levantar el entorno

A continuación, se detallan los pasos exactos para levantar la infraestructura de SimpleRisk y su base de datos MySQL asociada de manera local, utilizando Docker Compose.

1. Requisitos Previos
* Tener instalado **Docker Desktop** (con WSL 2 habilitado en caso de usar Windows) y asegurarse de que el motor se encuentre en ejecución.
* Abrir una terminal y posicionarse dentro del directorio del proyecto (carpeta `entorno`), donde deben coexistir los archivos `docker-compose.yml` y `.env`.

2. Configuración Inicial
El proyecto incluye un archivo `.env` preconfigurado con las variables de entorno necesarias para la conexión de la base de datos y la aplicación. No es necesario realizar modificaciones adicionales en este archivo para evaluar el entorno.

3. Ejecución y Despliegue
Para crear la red, descargar las imágenes e iniciar los contenedores en segundo plano, ejecute el siguiente comando en la terminal:

```bash
cd entorno/
docker compose up -d

4. Tiempo de Inicialización
Una vez enviado el comando, es necesario esperar entre 30 y 45 segundos. Durante este lapso, el contenedor de la base de datos realizará su configuración inicial y creará las tablas internas.
Para comprobar que los contenedores están corriendo correctamente, ejecute:

docker compose ps (Ambos contenedores deben figurar en estado "Up").

5. Acceso a la Plataforma
Con los contenedores en estado activo, abra un navegador web e ingrese a la siguiente dirección mapeada en el host:

https://localhost:8443