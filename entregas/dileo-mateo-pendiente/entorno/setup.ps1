$ErrorActionPreference = "Stop"

Write-Host "Descargando la imagen oficial de SimpleRisk..."
docker compose -f "$PSScriptRoot\docker-compose.yml" pull

Write-Host "Iniciando SimpleRisk..."
docker compose -f "$PSScriptRoot\docker-compose.yml" up -d

Write-Host ""
Write-Host "SimpleRisk se encuentra disponible en:"
Write-Host "https://localhost:8444"