#!/bin/bash
# SimpleRisk - Script de instalación para el TP de Gestión de Riesgos
# Alumno: Facundo Calderón (DNI 46162078)
#
# Uso:
#   chmod +x setup.sh
#   ./setup.sh
#
# Requiere Docker instalado y corriendo (Docker Desktop en Windows/Mac, o Docker Engine en Linux).

set -e

echo "Descargando la imagen de SimpleRisk..."
docker pull simplerisk/simplerisk

echo "Levantando el contenedor..."
docker run --name simplerisk -d -p 80:80 -p 443:443 simplerisk/simplerisk

echo ""
echo "Listo. Acceda desde el navegador a: https://localhost/"
echo "Nota: el navegador va a marcar el certificado como no confiable (autofirmado)."
echo "Es esperado en este entorno de desarrollo local, acepte la excepción para continuar."
