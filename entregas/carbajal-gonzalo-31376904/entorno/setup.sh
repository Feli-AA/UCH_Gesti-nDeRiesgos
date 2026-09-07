#!/usr/bin/env bash
# Levanta SimpleRisk vía Docker Compose.
# Requisito: Docker Desktop (o Docker Engine) instalado y en ejecución.
set -euo pipefail
cd "$(dirname "$0")"
docker compose up -d
echo "SimpleRisk disponible en https://localhost:8444/ (HTTP: http://localhost:8081/)"
