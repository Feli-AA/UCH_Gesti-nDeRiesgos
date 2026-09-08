# Tabla de Riesgos Definidos — Cliente "Cable Sur S.A." (SIGA)

> Escenario: empresa de triple play (TV por cable, internet, telefonía), ~90 empleados,
> ~45.000 abonados, usa SIGA on-premise en datacenter propio. Ver desarrollo completo y
> justificación de cada valor en `informe/informe.md` (Parte B).
>
> Nombre del cliente ficticio a propósito: el repositorio de este TP es público y el
> nombre real del cliente de ICITELCO es información de un tercero.

| ID | Nombre | Categoría | Activos afectados | Prob. | Impacto | Valor | Nivel | Tratamiento | Propietario |
|---|---|---|---|---|---|---|---|---|---|
| R01 | Acceso privilegiado sin restricciones del proveedor de software | Confidencialidad / Integridad / Riesgo de terceros | Servidor de producción, BD de abonados y facturación | 4 | 5 | 20 | Crítico | Mitigar | Gerente de IT |
| R02 | Almacenamiento inseguro de datos de tarjetas (alcance PCI-DSS) | Confidencialidad / Legal | BD de Cobranza (Cajas/Débitos/Recibos) | 3 | 5 | 15 | Alto | Mitigar | CISO / Responsable de Seguridad |
| R03 | Manipulación/fraude en habilitación remota de decodificadores | Integridad / Operativo | Módulo de gestión de decoders, ingresos | 3 | 3 | 9 | Medio | Mitigar | Jefe de Operaciones Técnicas |
| R04 | Exposición de datos vía integraciones de terceros (Mailchimp, Zapier, Braze, Apigee) | Confidencialidad / Cadena de suministro | Datos de contacto/facturación, API keys | 3 | 4 | 12 | Alto | Mitigar | Responsable de Sistemas/Integraciones |
| R05 | Interrupción de facturación por falla de integración con ARCA | Disponibilidad / Legal | Módulo de Facturación | 3 | 3 | 9 | Medio | Mitigar | Responsable de Facturación |
| R06 | Riesgo físico/ambiental por datacenter propio sin redundancia | Disponibilidad / Continuidad de negocio | Servidor y BD de producción (todo SIGA) | 2 | 5 | 10 | Alto | Mitigar | Gerente de IT / Infraestructura |
| R07 | Pérdida/robo de dispositivos móviles de técnicos de campo | Confidencialidad / Operativo | Dispositivos móviles, datos de contacto | 3 | 2 | 6 | Medio | Mitigar | Jefe de Operaciones Técnicas |
| R08 | Incumplimiento de Ley de Protección de Datos en campañas de marketing | Legal / Reputacional | Base de contacto de abonados, reputación | 2 | 2 | 4 | Bajo | Aceptar | Responsable de Marketing/Legal |

## Planes de acción (sobre riesgos de nivel Alto/Crítico)

| Riesgo | Plan de acción | Responsable | Vencimiento | Presupuesto | Estado inicial |
|---|---|---|---|---|---|
| R01 | Implementar acceso privilegiado seguro (PAM) para el proveedor: MFA, grabación de sesión, aprobación just-in-time | Gerente de IT | 2026-11-30 | USD 8.000 | Planificado |
| R02 | Migrar a tokenización de datos de tarjeta vía pasarela de pago certificada PCI-DSS | CISO / Responsable de Seguridad | 2027-02-28 | USD 15.000 | Planificado |
| R06 | Plan de Continuidad de Negocio: sitio de contingencia + backups automatizados off-site | Gerente de IT / Infraestructura | 2027-01-15 | USD 6.000/año | En progreso |
