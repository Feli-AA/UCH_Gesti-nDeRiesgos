# Requiere Docker Desktop iniciado y un archivo .env creado desde .env.example.
if (-not (Test-Path .env)) {
    Write-Error "Falta .env. Ejecutá: Copy-Item .env.example .env; luego editá sus claves."
    exit 1
}

docker compose up -d
docker compose ps
