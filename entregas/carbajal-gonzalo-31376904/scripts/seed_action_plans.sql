-- =============================================================================
-- seed_action_plans.sql — Carga automatizada de los 3 planes de acción (Parte B)
-- TP SimpleRisk — Gonzalo Carbajal (LU 31376904)
-- Complementa a seed_risks.sql (Actividad optativa D3). Ejecutar DESPUÉS de
-- seed_risks.sql, sobre la misma instalación.
--
-- Crea 3 "Projects" (Risk Management → Plan Projects) con vencimiento y
-- responsable, y su "Mitigation" asociada (Risk Management → Plan Mitigation)
-- con estrategia, esfuerzo, costo y recomendación, vinculando cada uno al
-- riesgo correspondiente (R01, R02, R06 — los de nivel Alto/Crítico).
--
-- USO:
--   docker exec -i simplerisk mysql -h127.0.0.1 -u simplerisk -p"$SIMPLERISK_DB_PASSWORD" \
--     simplerisk < scripts/seed_action_plans.sql
-- =============================================================================

-- --- Proyectos (planes de acción: título, vencimiento, responsable, estado) --
-- status: 1 Active, 2 On Hold, 3 Completed, 4 Cancelled (ver includes/functions.php get_project_status)
INSERT INTO projects (name, due_date, business_owner, status, `order`)
SELECT 'Implementar acceso privilegiado seguro (PAM) para el proveedor', '2026-11-30', 1, 1, 1
WHERE NOT EXISTS (SELECT 1 FROM projects WHERE name = 'Implementar acceso privilegiado seguro (PAM) para el proveedor');

INSERT INTO projects (name, due_date, business_owner, status, `order`)
SELECT 'Migrar a tokenizacion PCI-DSS de datos de tarjeta', '2027-02-28', 1, 1, 2
WHERE NOT EXISTS (SELECT 1 FROM projects WHERE name = 'Migrar a tokenizacion PCI-DSS de datos de tarjeta');

INSERT INTO projects (name, due_date, business_owner, status, `order`)
SELECT 'Plan de Continuidad de Negocio y backup off-site', '2027-01-15', 1, 1, 3
WHERE NOT EXISTS (SELECT 1 FROM projects WHERE name = 'Plan de Continuidad de Negocio y backup off-site');

-- --- Mitigaciones (estrategia=Mitigate(3), esfuerzo, costo estimado USD, responsable) --
INSERT INTO mitigations (risk_id, planning_strategy, mitigation_effort, mitigation_cost, mitigation_owner, current_solution, security_requirements, security_recommendations, submitted_by, planning_date, mitigation_percent)
SELECT r.id, 3, 4, 8000, 1,
  'Ninguno formal mas alla de la relacion contractual con el proveedor.',
  'MFA, sesion grabada, aprobacion just-in-time, minimo privilegio.',
  'Implementar una solucion de Privileged Access Management (PAM) para el acceso remoto del proveedor, con MFA, grabacion de sesion y revision periodica de accesos.',
  1, CURDATE(), 0
FROM risks r
WHERE r.subject = 'R01 - Acceso privilegiado sin restricciones del proveedor de software'
  AND r.mitigation_id = 0;

INSERT INTO mitigations (risk_id, planning_strategy, mitigation_effort, mitigation_cost, mitigation_owner, current_solution, security_requirements, security_recommendations, submitted_by, planning_date, mitigation_percent)
SELECT r.id, 3, 4, 15000, 1,
  'Integracion con entidades de cobranza, tokenizacion parcial a confirmar.',
  'Cumplimiento PCI-DSS, eliminar PAN completo de la base.',
  'Migrar el almacenamiento de datos de tarjeta a tokenizacion via pasarela de pago certificada PCI-DSS.',
  1, CURDATE(), 0
FROM risks r
WHERE r.subject = 'R02 - Almacenamiento inseguro de datos de tarjetas (PCI-DSS)'
  AND r.mitigation_id = 0;

INSERT INTO mitigations (risk_id, planning_strategy, mitigation_effort, mitigation_cost, mitigation_owner, current_solution, security_requirements, security_recommendations, submitted_by, planning_date, mitigation_percent)
SELECT r.id, 3, 3, 6000, 1,
  'UPS basico, sin sitio alterno documentado.',
  'Backups automatizados off-site, procedimiento de recuperacion documentado.',
  'Definir sitio de contingencia (nube o datacenter secundario) e implementar backups automatizados con copia off-site diaria.',
  1, CURDATE(), 10
FROM risks r
WHERE r.subject = 'R06 - Riesgo fisico/ambiental por datacenter propio sin redundancia'
  AND r.mitigation_id = 0;

-- --- Vincular cada riesgo con su proyecto y su mitigacion recien creados -----
UPDATE risks r
JOIN projects p ON p.name = 'Implementar acceso privilegiado seguro (PAM) para el proveedor'
JOIN mitigations m ON m.risk_id = r.id
SET r.project_id = p.value, r.mitigation_id = m.id
WHERE r.subject = 'R01 - Acceso privilegiado sin restricciones del proveedor de software';

UPDATE risks r
JOIN projects p ON p.name = 'Migrar a tokenizacion PCI-DSS de datos de tarjeta'
JOIN mitigations m ON m.risk_id = r.id
SET r.project_id = p.value, r.mitigation_id = m.id
WHERE r.subject = 'R02 - Almacenamiento inseguro de datos de tarjetas (PCI-DSS)';

UPDATE risks r
JOIN projects p ON p.name = 'Plan de Continuidad de Negocio y backup off-site'
JOIN mitigations m ON m.risk_id = r.id
SET r.project_id = p.value, r.mitigation_id = m.id
WHERE r.subject = 'R06 - Riesgo fisico/ambiental por datacenter propio sin redundancia';
