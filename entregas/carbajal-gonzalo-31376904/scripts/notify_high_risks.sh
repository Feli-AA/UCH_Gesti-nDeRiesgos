#!/usr/bin/env bash
# =============================================================================
# notify_high_risks.sh — Actividad optativa D2: integracion real (webhook)
# TP SimpleRisk — Gonzalo Carbajal (LU 31376904)
#
# Consulta los riesgos de nivel "High" o superior directamente en la base de
# datos de SimpleRisk (misma via que D3, ya que la API REST es un Extra pago
# no disponible en la version Community) y notifica cada uno a un webhook de
# Discord/Slack/Teams compatible con formato JSON simple.
#
# Requisitos:
#   - El contenedor "simplerisk" corriendo (docker compose up -d en entorno/).
#   - Variable de entorno DISCORD_WEBHOOK_URL con la URL del webhook.
#     NUNCA se hardcodea ni se versiona en este repositorio (ver .gitignore).
#
# Uso:
#   export DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/xxx/yyy"
#   ./notify_high_risks.sh
# =============================================================================
set -euo pipefail

CONTAINER="simplerisk"
WEBHOOK_URL="${DISCORD_WEBHOOK_URL:-}"

if [ -z "$WEBHOOK_URL" ]; then
  echo "Error: definí la variable de entorno DISCORD_WEBHOOK_URL antes de correr este script." >&2
  exit 1
fi

DB_PASSWORD=$(docker exec "$CONTAINER" sh -c \
  "grep DB_PASSWORD /var/www/simplerisk/includes/config.php | sed -E \"s/.*'([^']+)'\\);/\\1/\"")

# Umbral: usamos el propio corte "High" definido en risk_levels de SimpleRisk,
# en vez de hardcodear un numero, para que el script siga siendo correcto si
# alguien reconfigura los umbrales de riesgo del sistema.
THRESHOLD=$(docker exec "$CONTAINER" mysql -h127.0.0.1 -u simplerisk -p"$DB_PASSWORD" simplerisk -N -e \
  "SELECT value FROM risk_levels WHERE name = 'High';")

RISKS=$(docker exec "$CONTAINER" mysql -h127.0.0.1 -u simplerisk -p"$DB_PASSWORD" simplerisk -N -e \
  "SELECT r.id, r.subject, l.name, s.calculated_risk
   FROM risks r
   JOIN risk_scoring s ON s.id = r.id
   JOIN risk_levels l ON s.calculated_risk >= l.value
   WHERE s.calculated_risk >= $THRESHOLD
   GROUP BY r.id
   HAVING l.value = MAX(l.value)
   ORDER BY s.calculated_risk DESC;")

if [ -z "$RISKS" ]; then
  echo "Sin riesgos de nivel High o superior. No se envía notificación."
  exit 0
fi

while IFS=$'\t' read -r id subject level score; do
  message="⚠️ **Riesgo de nivel ${level} detectado en SimpleRisk**\n**#${id} — ${subject}**\nScore: ${score}\nRevisar en: http://localhost:8081/management/view.php?id=${id}"
  payload=$(printf '{"content": "%s"}' "$(printf '%s' "$message" | sed 's/"/\\"/g')")
  curl -s -H "Content-Type: application/json" -X POST -d "$payload" "$WEBHOOK_URL" > /dev/null
  echo "Notificado: #${id} - ${subject} (${level}, score ${score})"
done <<< "$RISKS"
