#!/usr/bin/env bash
# =============================================================================
#  setup.sh - Levantamiento reproducible del entorno SimpleRisk
#  TP Gestion de Riesgos - Uriel Cabrera - LU 31673361
#
#  Uso:
#      chmod +x setup.sh
#      ./setup.sh
#
#  En Windows: ejecutar desde WSL o Git Bash, con Docker Desktop iniciado.
# =============================================================================

set -euo pipefail

COMPOSE_FILE="$(dirname "$0")/docker-compose.yml"
URL="https://localhost:8443"

info()  { printf '\033[0;34m[INFO]\033[0m  %s\n' "$1"; }
ok()    { printf '\033[0;32m[OK]\033[0m    %s\n' "$1"; }
fail()  { printf '\033[0;31m[ERROR]\033[0m %s\n' "$1" >&2; exit 1; }

# --- 1. Verificacion de prerrequisitos ---------------------------------------
info "Verificando prerrequisitos..."

command -v docker >/dev/null 2>&1 \
  || fail "Docker no esta instalado o no esta en el PATH."

docker compose version >/dev/null 2>&1 \
  || fail "El plugin 'docker compose' no esta disponible. Actualiza Docker Desktop."

docker info >/dev/null 2>&1 \
  || fail "El daemon de Docker no responde. Inicia Docker Desktop y reintenta."

ok "Docker $(docker --version | awk '{print $3}' | tr -d ',') operativo."

# --- 2. Verificacion de puertos ----------------------------------------------
info "Verificando disponibilidad de puertos 8080 y 8443..."
for PORT in 8080 8443; do
  if command -v ss >/dev/null 2>&1 && ss -ltn 2>/dev/null | grep -q ":${PORT} "; then
    fail "El puerto ${PORT} ya esta en uso. Cambialo en docker-compose.yml."
  fi
done
ok "Puertos disponibles."

# --- 3. Descarga de la imagen ------------------------------------------------
info "Descargando la imagen oficial de SimpleRisk (puede tardar varios minutos)..."
docker compose -f "$COMPOSE_FILE" pull

# --- 4. Levantamiento --------------------------------------------------------
info "Levantando el contenedor..."
docker compose -f "$COMPOSE_FILE" up -d

# --- 5. Espera activa hasta que la aplicacion responda ------------------------
info "Esperando a que SimpleRisk responda (hasta 180 segundos)..."
for i in $(seq 1 36); do
  if curl -fsk "$URL" >/dev/null 2>&1; then
    ok "SimpleRisk responde en ${URL}"
    echo
    echo "  Abri ${URL} en el navegador."
    echo "  Vas a ver una advertencia de certificado: es autofirmado y es esperable."
    echo "  Completa el instalador web y cambia la credencial inicial por defecto"
    echo "  ANTES de cargar cualquier dato."
    echo
    exit 0
  fi
  sleep 5
done

fail "La aplicacion no respondio a tiempo. Revisa: docker compose logs -f"
