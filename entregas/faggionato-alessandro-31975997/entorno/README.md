# Entorno local de SimpleRisk

El entorno levanta SimpleRisk y MySQL 8 con Docker Compose. Los datos de MySQL, cargas y logs usan volúmenes persistentes de Docker. La inicialización de la base de datos se ejecuta únicamente la primera vez; en los inicios posteriores SimpleRisk reutiliza la base existente.

## Inicio

1. Abrir Docker Desktop y esperar el estado **Running**.
2. Abrir PowerShell dentro de esta carpeta.
3. Crear el archivo de configuración local:

   ```powershell
   Copy-Item .env.example .env
   ```

4. Editar `.env` y reemplazar los tres valores que empiezan con `CAMBIAR_` por claves locales largas y distintas. No usar contraseñas reales.
5. En una instalación nueva, inicializar la base de datos una única vez:

   ```powershell
   docker compose up -d mysql
   docker compose --profile setup run --rm setup
   ```

6. Iniciar la aplicación:

   ```powershell
   docker compose up -d simplerisk
   ```

7. Verificar que ambos servicios estén activos:

   ```powershell
   docker compose ps
   ```

8. Abrir [https://localhost](https://localhost) e iniciar sesión con `ADMIN_USERNAME` y `ADMIN_PASSWORD` de `.env`. El certificado es autofirmado para el entorno local, por lo que el navegador mostrará una advertencia que debe aceptarse solo en esta práctica local.

En inicios posteriores no se repite el paso 5; alcanza con `docker compose up -d`.

## Diagnóstico y apagado

```powershell
docker compose logs simplerisk
docker compose logs mysql
docker compose down
```

`docker compose down` detiene el entorno pero conserva los datos. No ejecutar `docker compose down -v` salvo que se quiera borrar intencionalmente la instalación y los riesgos cargados.

## Seguridad del entorno

- La imagen de SimpleRisk está fijada a una versión específica para reproducibilidad.
- `--sql-mode=` evita que los modos estrictos de MySQL bloqueen la instalación de SimpleRisk.
- `.env` está ignorado por Git; solo `.env.example` con valores ficticios se versiona.
- Los puertos `8081` (HTTP) y `443` (HTTPS) se exponen únicamente para el uso local de esta práctica.
