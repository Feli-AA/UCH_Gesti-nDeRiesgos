#!/bin/bash
# setup.sh - Levanta el entorno de SimpleRisk
#
# Requiere tener Docker (y Docker Compose) instalado.
# En Windows: Docker Desktop con WSL2 habilitado.
#
# Uso: bash setup.sh

set -e

echo "Descargando la imagen de SimpleRisk..."
docker pull simplerisk/simplerisk

echo "Levantando el contenedor con Docker Compose..."
docker compose up -d

echo ""
echo "Listo. SimpleRisk debería estar disponible en:"
echo "  https://localhost/"
echo ""
echo "Nota: el navegador va a mostrar una advertencia de certificado autofirmado,"
echo "es esperable en esta instalación. Aceptar y continuar."
