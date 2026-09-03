$WebhookUrl = "URL_ELIMINADA_POR_SEGURIDAD"

$Payload = @{
    username = "SimpleRisk Bot"
    avatar_url = "https://www.simplerisk.com/images/simplerisk_logo.png"
    embeds = @(
        @{
            title = "[ALERTA] Seguridad Critica"
            description = "El SIEM ha detectado multiples intentos de Inyeccion SQL dirigidos a la base de datos de historias clinicas."
            color = 16711680
            fields = @(
                @{ name = "ID SimpleRisk"; value = "Riesgo #1005"; inline = $true },
                @{ name = "Nivel de Riesgo"; value = "CRITICO"; inline = $true },
                @{ name = "Plan de Accion Sugerido"; value = "Activar el WAF y refactorizar el backend urgentemente."; inline = $false }
            )
        }
    )
}

$JsonPayload = $Payload | ConvertTo-Json -Depth 4

try {
    Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $JsonPayload -ContentType 'application/json'
    Write-Host "[OK] Simulacion exitosa! Revisa tu canal de Discord." -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Error al enviar el webhook: $_" -ForegroundColor Red
}
