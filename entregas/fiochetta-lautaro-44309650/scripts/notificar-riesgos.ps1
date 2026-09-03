<#
.SYNOPSIS
    Notifica por Slack (Incoming Webhook) los riesgos de nivel Alto/Muy Alto
    identificados en el registro de riesgos de SimpleRisk (ver configuracion/riesgos.md).

.DESCRIPTION
    SimpleRisk Community Edition no incluye API REST (es una funcionalidad de pago
    de las ediciones superiores), por lo que esta integración usa un Incoming
    Webhook de Slack como alternativa funcional: cada riesgo alto se envía como
    un mensaje formateado al canal #alertas-riesgos.

.NOTES
    Requiere la variable de entorno WEBHOOK_URL seteada en la sesión de PowerShell:
        $env:WEBHOOK_URL = "https://hooks.slack.com/services/....."
    Nunca se hardcodea el webhook en este archivo ni se commitea (.env está en .gitignore).
#>

# --- 1. Obtener el webhook desde la variable de entorno ---
$webhookUrl = $env:WEBHOOK_URL

if (-not $webhookUrl) {
    # Fallback: intentar leerlo del archivo .env en la raíz del proyecto
    $envFile = Join-Path $PSScriptRoot "..\.env"
    if (Test-Path $envFile) {
        $line = Get-Content $envFile | Where-Object { $_ -match '^\s*WEBHOOK_URL\s*=' }
        if ($line) {
            $webhookUrl = ($line -split '=', 2)[1].Trim()
        }
    }
}

if (-not $webhookUrl) {
    Write-Error "No se encontró WEBHOOK_URL. Seteala con: `$env:WEBHOOK_URL = 'https://hooks.slack.com/services/...'"
    exit 1
}

# --- 2. Registro de riesgos altos (Top 3 por score Probabilidad x Impacto) ---
# Fuente: configuracion/riesgos.md
$riesgosAltos = @(
    [PSCustomObject]@{
        Nombre        = "Acceso no autorizado a historia clínica"
        Categoria     = "Confidencialidad"
        Probabilidad  = 4
        Impacto       = 5
        Nivel         = "Muy alto"
        Propietario   = "Jefe de Sistemas / Responsable de Seguridad de la Información"
        Tratamiento   = "Mitigar - RBAC + logging de accesos + revisiones periódicas"
    },
    [PSCustomObject]@{
        Nombre        = "Phishing a personal administrativo"
        Categoria     = "Operativo"
        Probabilidad  = 5
        Impacto       = 4
        Nivel         = "Muy alto"
        Propietario   = "Jefe de Sistemas / RRHH"
        Tratamiento   = "Mitigar - capacitación periódica + filtro anti-phishing + MFA"
    },
    [PSCustomObject]@{
        Nombre        = "Disponibilidad de datos - caída temporal del sistema"
        Categoria     = "Disponibilidad"
        Probabilidad  = 4
        Impacto       = 4
        Nivel         = "Alto"
        Propietario   = "Jefe de Sistemas"
        Tratamiento   = "Mitigar - generador eléctrico de respaldo + plan de contingencia manual"
    }
)

# --- 3. Enviar un mensaje por cada riesgo alto ---
$enviados = 0
foreach ($riesgo in $riesgosAltos) {
    $score = $riesgo.Probabilidad * $riesgo.Impacto
    $emoji = if ($riesgo.Nivel -eq "Muy alto") { ":red_circle:" } else { ":large_orange_circle:" }

    $texto = "$emoji *[$($riesgo.Nivel)] $($riesgo.Nombre)*`n" +
             "> *Categoría:* $($riesgo.Categoria)`n" +
             "> *Probabilidad x Impacto:* $($riesgo.Probabilidad) x $($riesgo.Impacto) = $score`n" +
             "> *Propietario:* $($riesgo.Propietario)`n" +
             "> *Tratamiento:* $($riesgo.Tratamiento)"

    $payload = @{ text = $texto } | ConvertTo-Json -Compress

    try {
        $resp = Invoke-WebRequest -Uri $webhookUrl -Method Post -Body $payload -ContentType 'application/json; charset=utf-8' -UseBasicParsing
        Write-Output "OK  [$($resp.StatusCode)] -> $($riesgo.Nombre)"
        $enviados++
    }
    catch {
        Write-Error "FALLO al notificar '$($riesgo.Nombre)': $($_.Exception.Message)"
    }

    Start-Sleep -Milliseconds 700
}

Write-Output "`nListo: $enviados de $($riesgosAltos.Count) notificaciones enviadas a #alertas-riesgos."
