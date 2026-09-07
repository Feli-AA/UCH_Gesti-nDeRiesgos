#!/bin/bash
# Levanta el entorno de SimpleRisk para este TP.
# Requiere Docker Desktop (o Docker Engine + Compose) instalado y corriendo.

set -e

cd "$(dirname "$0")"

echo "Levantando SimpleRisk con Docker Compose..."
docker compose up -d

echo ""
echo "Contenedor iniciado. Verificando estado:"
docker compose ps

echo ""
echo "Accedé a SimpleRisk en: http://localhost"
echo "(la primera vez puede tardar 1-3 minutos en descargar la imagen)"
