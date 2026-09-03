#!/usr/bin/env bash
# entorno/setup.sh
# Levanta el entorno de SimpleRisk (imagen todo-en-uno) con Docker Compose.
#
# Requisitos: Docker y Docker Compose v2 instalados y corriendo.
#
# Uso:
#   cd entorno
#   ./setup.sh

set -euo pipefail

cd "$(dirname "$0")"

echo "==> Levantando SimpleRisk (imagen todo-en-uno simplerisk/simplerisk)..."
docker compose up -d

echo "==> Esperando a que SimpleRisk responda en http://localhost:8080 ..."
tries=0
until curl -fsS -o /dev/null "http://localhost:8080" || [ "$tries" -ge 40 ]; do
  tries=$((tries + 1))
  sleep 10
  echo "    intento $tries/40..."
done

if [ "$tries" -ge 40 ]; then
  echo "!! SimpleRisk todavía no responde. Revisá los logs con: docker compose logs -f simplerisk"
  exit 1
fi

cat <<EOF

==> Listo. SimpleRisk está corriendo en:

    http://localhost:8080

La primera vez, SimpleRisk pide completar un asistente de instalación inicial
(idioma, cuenta de administrador). Ver README.md para el detalle paso a paso
y los usuarios/roles creados para este TP (configuracion/usuarios.md).

Para bajar el entorno:
    docker compose down

Para bajarlo y borrar los datos (reinicio total):
    docker compose down -v
EOF
