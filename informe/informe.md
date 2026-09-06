# Informe de Gestión de Riesgos - SimpleRisk

## Parte A: Instalación y Configuración Básica
Se realizó el despliegue de SimpleRisk mediante contenedores Docker.
Se crearon tres usuarios: admin_seg, analista_riesgos y auditor_ext.

## Parte B: Escenario Real (Clínica Privada)
Se registraron 7 riesgos clave: R01 (Phishing), R02 (Ransomware HCD), R03 (Fuga USB), R04 (Corte eléctrico/UPS), R05 (Credenciales MySQL), R06 (Falla en Backups) y R07 (Riesgos físicos en Data Center).

## Parte C: Análisis Crítico
### 1. Comparativa: SimpleRisk vs ISO 27005 / FAIR
SimpleRisk emplea una matriz 5x5 cualitativa de rápida adopción. FAIR evalúa el riesgo cuantitativamente en dinero, e ISO 27005 brinda el marco normativo.

### 2. Integración Externa
Envío de Webhooks por HTTP POST cuando un riesgo alcanza un nivel Alto o Crítico (P x I >= 10).
