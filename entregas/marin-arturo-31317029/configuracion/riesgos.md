# Registro de Riesgos — Clínica Privada (120 empleados, ~800 pacientes/día)

Escala 1-5 (Probabilidad e Impacto). Nivel (matriz manual) = Probabilidad × Impacto: Bajo (1-4) / Medio (5-9) / Alto (10-15) / Crítico (16-25).

> **Nota metodológica (ver Parte C):** SimpleRisk, con el método "Clásico", no usa el valor bruto P×I (rango 1-25). Aplica `Riesgo = (Probabilidad × Impacto) × (10/25)`, comprimiendo todo a una escala 0-10. Esto hace que el mismo riesgo caiga en un nivel más bajo dentro de la herramienta que en la matriz de la cátedra. Se documentan ambos valores por riesgo (ID de SimpleRisk incluido).

## R01 — Ransomware / phishing dirigido a personal administrativo

- **Categoría:** Confidencialidad / Disponibilidad
- **Activos afectados:** Servidor de historias clínicas electrónicas (HCE), servidor de facturación
- **Probabilidad:** 4 (Probable) — el sector salud es uno de los más atacados por ransomware según el Verizon DBIR; la clínica no tiene filtrado de correo avanzado.
- **Impacto:** 5 (Catastrófico) — cifrado de HCE paraliza la atención de ~800 pacientes/día, pérdida de datos clínicos, posible sanción bajo Ley 25.326.
- **Valor / Nivel (matriz manual):** 20 / **Crítico**
- **Valor / Nivel (SimpleRisk, ID 1002):** 8 / **Alto**
- **Controles existentes:** Antivirus básico desactualizado, sin capacitación al personal.
- **Tratamiento:** Mitigar — EDR, filtrado de correo, backups 3-2-1 offline, capacitación anti-phishing.
- **Propietario:** Responsable de TI

## R02 — Acceso no autorizado a historias clínicas por personal sin necesidad de conocer

- **Categoría:** Confidencialidad
- **Activos afectados:** HCE digitales
- **Probabilidad:** 3 (Posible) — no hay control de acceso basado en roles, usuarios comparten credenciales.
- **Impacto:** 4 (Mayor) — violación de confidencialidad de datos de salud, sanción legal (Ley 25.326).
- **Valor / Nivel (matriz manual):** 12 / **Alto**
- **Valor / Nivel (SimpleRisk, ID 1003):** 4.8 / **Medio**
- **Controles existentes:** Ninguno; sin logs de auditoría de accesos.
- **Tratamiento:** Mitigar — RBAC, logging y revisión periódica de permisos.
- **Propietario:** Responsable de Seguridad de la Información

## R03 — Corte prolongado de energía eléctrica

- **Categoría:** Disponibilidad
- **Activos afectados:** Servidores locales, equipamiento de red, sistemas de turnos
- **Probabilidad:** 3 (Posible) — cortes de energía frecuentes en la zona, sin generador.
- **Impacto:** 4 (Mayor) — interrupción de atención a pacientes y facturación diaria.
- **Valor / Nivel (matriz manual):** 12 / **Alto**
- **Valor / Nivel (SimpleRisk, ID 1004):** 4.8 / **Medio**
- **Controles existentes:** UPS básico (autonomía ~15 min).
- **Tratamiento:** Mitigar — generador de respaldo, plan de continuidad de negocio (BCP).
- **Propietario:** Gerencia de Infraestructura

## R04 — Pérdida o robo de notebook/tablet del personal médico sin cifrado

- **Categoría:** Confidencialidad
- **Activos afectados:** Dispositivos móviles con acceso a HCE
- **Probabilidad:** 3 (Posible) — personal médico usa notebooks fuera de la clínica (guardias, domicilios).
- **Impacto:** 4 (Mayor) — exposición de datos de pacientes, sanción legal.
- **Valor / Nivel (matriz manual):** 12 / **Alto**
- **Valor / Nivel (SimpleRisk, ID 1005):** 4.8 / **Medio**
- **Controles existentes:** Sin cifrado de disco, sin MDM.
- **Tratamiento:** Mitigar — cifrado de disco, MDM con borrado remoto, política de dispositivos.
- **Propietario:** Responsable de TI

## R05 — Corrupción de base de datos de HCE sin backup probado

- **Categoría:** Integridad / Disponibilidad
- **Activos afectados:** Base de datos de historias clínicas
- **Probabilidad:** 2 (Improbable) — falla de hardware/software es infrecuente pero posible.
- **Impacto:** 5 (Catastrófico) — pérdida irrecuperable de historiales clínicos, riesgo legal y sanitario.
- **Valor / Nivel (matriz manual):** 10 / **Alto**
- **Valor / Nivel (SimpleRisk, ID 1006):** 4 / **Medio**
- **Controles existentes:** Backups automáticos, nunca restaurados/testeados.
- **Tratamiento:** Mitigar — pruebas periódicas de restauración, backup offsite/cloud cifrado.
- **Propietario:** Responsable de TI / DBA

## R06 — Incumplimiento normativo por falta de política de privacidad formal

- **Categoría:** Legal
- **Activos afectados:** Todo dato personal de pacientes y empleados
- **Probabilidad:** 4 (Probable) — la auditoría externa ya identificó esta debilidad.
- **Impacto:** 3 (Moderado) — multas de la Agencia de Acceso a la Información Pública, daño reputacional recuperable.
- **Valor / Nivel (matriz manual):** 12 / **Alto**
- **Valor / Nivel (SimpleRisk, ID 1007):** 4.8 / **Medio**
- **Controles existentes:** Ninguna política escrita.
- **Tratamiento:** Mitigar — redactar política de privacidad, designar responsable de protección de datos, capacitación.
- **Propietario:** Dirección / Asesoría Legal

## R07 — Dependencia de proveedor externo de facturación sin cláusulas de seguridad

- **Categoría:** Operativo / Legal
- **Activos afectados:** Sistema de facturación, datos de obra social
- **Probabilidad:** 3 (Posible) — contrato vigente sin SLA de seguridad ni confidencialidad.
- **Impacto:** 3 (Moderado) — interrupción de facturación, no compromete atención médica directa.
- **Valor / Nivel (matriz manual):** 9 / **Medio**
- **Valor / Nivel (SimpleRisk, ID 1008):** 3.6 / **Bajo**
- **Controles existentes:** Contrato comercial básico, sin cláusulas de protección de datos.
- **Tratamiento:** Transferir/Mitigar — renegociar contrato con cláusulas de seguridad y SLA, evaluar proveedores alternativos.
- **Propietario:** Administración

---

## Resumen por nivel

| Nivel | Matriz manual (cátedra) | SimpleRisk (Clásico, ×10/25) |
|---|---|---|
| Crítico | 1 (R01) | 0 |
| Alto | 5 (R02, R03, R04, R05, R06) | 1 (R01) |
| Medio | 1 (R07) | 5 (R02, R03, R04, R05, R06) |
| Bajo | 0 | 1 (R07) |

Los planes de acción se priorizaron según la matriz manual (más conservadora), no según el score de SimpleRisk — criterio de riesgo real del negocio por sobre el ajuste de escala de la herramienta.

## Planes de acción (riesgos de nivel Alto/Crítico seleccionados)

1. **R01 — Ransomware:** implementar EDR + backups 3-2-1 offline + capacitación. Responsable: TI. Presupuesto estimado: USD 3000. Vencimiento: 60 días. Estado inicial: Planificado.
2. **R02 — Acceso no autorizado:** implementar RBAC y logging de auditoría. Responsable: Seguridad de la Información. Presupuesto estimado: USD 800. Vencimiento: 45 días. Estado inicial: Planificado.
3. **R05 — Corrupción de BD sin backup probado:** protocolo de prueba de restauración mensual + backup offsite cifrado. Responsable: TI/DBA. Presupuesto estimado: USD 500. Vencimiento: 30 días. Estado inicial: Planificado.
