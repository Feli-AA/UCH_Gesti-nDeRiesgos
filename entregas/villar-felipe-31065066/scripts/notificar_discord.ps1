# Script de integración con Discord Webhook (Punto D2 - Bonificación)
# Envía una alerta de riesgo crítico desde SimpleRisk a un canal de Discord

$webhookUrl = "https://discord.com/api/webhooks/1546969316086513714/sXOF1_YhXvJKYOPJfXmkP0SSKKi878-aFfg82TN4g2dqVF3lJ0R087kcvFYuI1o8n4Bc"

$jsonPayload = @'
{
  "embeds": [
    {
      "title": "🚨 [SimpleRisk] Alerta de Riesgo Crítico Detectado",
      "description": "Se ha registrado/actualizado un riesgo de nivel crítico en el sistema.",
      "color": 15158332,
      "fields": [
        { "name": "ID Riesgo", "value": "R01", "inline": true },
        { "name": "Título", "value": "Ransomware en Servidor HIS", "inline": true },
        { "name": "Nivel de Riesgo", "value": "20 (Crítico)", "inline": false }
      ],
      "footer": { "text": "SimpleRisk Notification System • UCH Seguridad" }
    }
  ]
}
'@

$utf8Bytes = [System.Text.Encoding]::UTF8.GetBytes($jsonPayload)

Invoke-RestMethod -Uri $webhookUrl -Method Post -ContentType "application/json; charset=utf-8" -Body $utf8Bytes