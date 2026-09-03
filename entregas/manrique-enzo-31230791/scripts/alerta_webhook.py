import urllib.request
import json

WEBHOOK_URL = "URL_ELIMINADA_POR_SEGURIDAD"

payload = {
    "username": "SimpleRisk Bot",
    "avatar_url": "https://www.simplerisk.com/images/simplerisk_logo.png",
    "embeds": [{
        "title": "🚨 Alerta de Seguridad Crítica",
        "description": "El SIEM ha detectado múltiples intentos de **Inyección SQL** dirigidos a la base de datos de historias clínicas.",
        "color": 16711680,
        "fields": [
            {"name": "ID SimpleRisk", "value": "Riesgo #1005", "inline": True},
            {"name": "Nivel de Riesgo", "value": "🔴 CRÍTICO", "inline": True},
            {"name": "Plan de Acción Sugerido", "value": "Activar el WAF y refactorizar el backend urgentemente.", "inline": False}
        ]
    }]
}

try:
    req = urllib.request.Request(
        WEBHOOK_URL, 
        data=json.dumps(payload).encode('utf-8'), 
        headers={'Content-Type': 'application/json', 'User-Agent': 'Mozilla/5.0'}
    )
    
    with urllib.request.urlopen(req) as response:
        if response.status == 204:
            print("✅ ¡Simulación exitosa! Revisá tu canal de Discord.")
        else:
            print(f"⚠️ Se envió, pero Discord respondió con: {response.status}")
except Exception as e:
    print(f"❌ Error al enviar el webhook: {e}")
    print("Asegurate de haber pegado bien la URL en la variable WEBHOOK_URL.")
