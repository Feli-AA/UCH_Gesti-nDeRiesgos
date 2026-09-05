# Informe Técnico: Gestión de Riesgos y Evaluación de SimpleRisk

## 1. Comparativa Metodológica

| Criterio | SimpleRisk (Matriz Likelihood x Impact) | NIST SP 800-30 | ISO 27005 |
| :--- | :--- | :--- | :--- |
| **Enfoque Principal** | Cuantitativo / Cualitativo simplificado mediante matriz 5x5[cite: 5, 6]. | Cualitativo/Semicuantitativo enfocado en amenazas a sistemas federales. | Basado en procesos continuos del Sistema de Gestión de Seguridad (SGSI). |
| **Complejidad de Implementación** | Baja. Curva de aprendizaje rápida y despliegue ágil[cite: 5, 6]. | Media-Alta. Exige catalogar amenazas, vulnerabilidades e impactos detallados. | Alta. Requiere contexto organizacional exhaustivo y análisis de activos estructurado. |
| **Adaptabilidad en Pymes/Clínicas** | Excelente para gestión operativa directa y reportes gerenciales rápidos[cite: 5, 6]. | Orientado a marcos normativos estrictos. | Requiere madurez organizacional preexistente. |

**Análisis Crítico:**
SimpleRisk resulta óptimo para organizaciones de salud con recursos limitados, permitiendo priorizar amenazas sin la sobrecarga administrativa de ISO 27005[cite: 5, 6]. Sin embargo, carece de modelado intrínseco de amenazas complejas en comparación con NIST SP 800-30.

---

## 2. Integración con Herramientas Externas

Para automatizar la notificación de eventos y alertas asociadas a riesgos de nivel alto en la clínica, SimpleRisk soporta la integración mediante **Webhooks** e integración nativa con canales de mensajería (Slack/Teams) y sistemas de tickets (Jira)[cite: 5, 6].

### Arquitectura de Integración propuesta:
1. **Detección / Evento:** Un nuevo riesgo crítico es ingresado o un plan de mitigación vence sin completarse[cite: 5, 6].
2. **Payload Webhook:** SimpleRisk dispara una petición HTTP POST en formato JSON hacia un endpoint intermedio (n8n, Node-RED o servidor webhook personalizado)[cite: 5, 6].
3. **Notificación / Ticket:** El servidor receptor canaliza la alerta creando una incidencia automática en Jira para el equipo de infraestructura o enviando un mensaje directo al canal `#seguridad-alertas` en Slack[cite: 5, 6].
