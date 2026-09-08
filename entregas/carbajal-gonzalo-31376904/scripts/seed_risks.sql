-- =============================================================================
-- seed_risks.sql — Carga automatizada del registro inicial de riesgos (Parte B)
-- TP SimpleRisk — Gonzalo Carbajal (LU 31376904)
-- Actividad optativa D3: automatiza el levantamiento de datos sin usar la UI.
--
-- CONTEXTO Y LIMITACIONES (léase antes de correr):
--   - La API REST de SimpleRisk ("API Extra") es una funcionalidad paga, no
--     disponible en la imagen Docker Community usada en este TP. Por eso se
--     optó por la alternativa que el propio enunciado habilita: carga directa
--     vía SQL contra la base de datos del contenedor.
--   - Este script escribe directamente en las tablas internas de SimpleRisk,
--     evitando toda la lógica de validación de la capa de aplicación (PHP).
--     Es apto para poblar un entorno de DEMO/CTP reproducible, pero NUNCA
--     debería usarse contra una instalación de producción real: no genera
--     entradas de auditoría (audit trail) ni de historial de scoring, y un
--     error de tipeo en una categoría o un ID de activo no es validado por
--     ninguna capa intermedia. Esta es, en sí misma, una observación de
--     seguridad relevante para la Parte C/D del TP (bypass de la app layer).
--   - Pensado para ejecutarse sobre una instalación de SimpleRisk recién
--     inicializada (después del asistente "Default Admin Account Creation").
--     Es re-ejecutable sin duplicar datos: cada INSERT está guardado con
--     `WHERE NOT EXISTS` sobre una clave de negocio (nombre de activo o
--     subject de riesgo).
--
-- USO:
--   docker exec -i simplerisk mysql -h127.0.0.1 -u simplerisk -p"$SIMPLERISK_DB_PASSWORD" \
--     simplerisk < scripts/seed_risks.sql
--
--   La contraseña de la base (`SIMPLERISK_DB_PASSWORD`) se lee de
--   /var/www/simplerisk/includes/config.php dentro del contenedor
--   (`DB_PASSWORD`). Se genera de forma aleatoria por instalación de Docker
--   y NUNCA se versiona en este repositorio (ver .gitignore).
-- =============================================================================

-- --- Activos afectados ------------------------------------------------------
INSERT INTO assets (name)
SELECT 'Servidor de Produccion' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Servidor de Produccion');
INSERT INTO assets (name)
SELECT 'Base de Datos de Abonados' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Base de Datos de Abonados');
INSERT INTO assets (name)
SELECT 'Base de Datos de Cobranza' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Base de Datos de Cobranza');
INSERT INTO assets (name)
SELECT 'Modulo de Gestion de Decoders' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Modulo de Gestion de Decoders');
INSERT INTO assets (name)
SELECT 'Datos de Contacto y Facturacion' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Datos de Contacto y Facturacion');
INSERT INTO assets (name)
SELECT 'API Keys de Integracion' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'API Keys de Integracion');
INSERT INTO assets (name)
SELECT 'Modulo de Facturacion' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Modulo de Facturacion');
INSERT INTO assets (name)
SELECT 'Dispositivos Moviles de Tecnicos' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Dispositivos Moviles de Tecnicos');
INSERT INTO assets (name)
SELECT 'Base de Contacto de Abonados' WHERE NOT EXISTS (SELECT 1 FROM assets WHERE name = 'Base de Contacto de Abonados');

-- --- Riesgos (subject, categoria, likelihood/impact 1-5, activos) ----------
-- category: 1 Access Management, 2 Environmental Resilience, 4 Physical Security,
--           5 Policy and Procedure, 6 Sensitive Data Management,
--           7 Technical Vulnerability Management, 8 Third-Party Management

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R01 - Acceso privilegiado sin restricciones del proveedor de software', 1, 1, 1, 0,
  '<p>El personal de desarrollo del proveedor del sistema posee acceso root permanente al servidor de produccion y privilegios completos de DBA sobre la base de datos, sin MFA, sin grabacion de sesion ni flujo de aprobacion por acceso.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R01 - Acceso privilegiado sin restricciones del proveedor de software');

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R02 - Almacenamiento inseguro de datos de tarjetas (PCI-DSS)', 6, 1, 1, 0,
  '<p>El modulo de Cobranza gestiona datos de tarjeta de credito/debito de los abonados. Si se almacenan sin tokenizacion/cifrado conforme a PCI-DSS, quedan expuestos ante cualquier acceso indebido a la base.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R02 - Almacenamiento inseguro de datos de tarjetas (PCI-DSS)');

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R03 - Manipulacion/fraude en habilitacion remota de decodificadores', 7, 1, 1, 0,
  '<p>El sistema permite habilitar/deshabilitar decodificadores en forma remota. Un acceso indebido podria habilitar servicio sin pago o deshabilitar decodificadores de abonados legitimos.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R03 - Manipulacion/fraude en habilitacion remota de decodificadores');

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R04 - Exposicion de datos via integraciones con terceros (Mailchimp, Zapier, Braze, Apigee)', 8, 1, 1, 0,
  '<p>SIGA envia datos de contacto y facturacion a proveedores externos para marketing y automatizacion. Credenciales/API keys mal gestionadas ampliarian la superficie de exposicion.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R04 - Exposicion de datos via integraciones con terceros (Mailchimp, Zapier, Braze, Apigee)');

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R05 - Interrupcion de facturacion por falla de integracion con ARCA', 8, 1, 1, 0,
  '<p>La emision de comprobantes depende de la conexion en linea con ARCA para obtener el CAE. Una caida del servicio o de la conectividad interrumpe la facturacion mensual.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R05 - Interrupcion de facturacion por falla de integracion con ARCA');

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R06 - Riesgo fisico/ambiental por datacenter propio sin redundancia', 2, 1, 1, 0,
  '<p>SIGA y su base de datos residen en un datacenter propio sin sitio de contingencia ni redundancia geografica. Un incendio, inundacion o corte electrico prolongado dejaria fuera de servicio toda la operacion.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R06 - Riesgo fisico/ambiental por datacenter propio sin redundancia');

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R07 - Perdida o robo de dispositivos moviles de tecnicos de campo', 4, 1, 1, 0,
  '<p>Los tecnicos acceden a datos de abonados desde dispositivos moviles en campo. La perdida o robo sin cifrado expone esos datos.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R07 - Perdida o robo de dispositivos moviles de tecnicos de campo');

INSERT INTO risks (status, subject, category, owner, submitted_by, source, assessment, submission_date, last_update)
SELECT 'New', 'R08 - Incumplimiento de la Ley de Proteccion de Datos Personales en marketing', 5, 1, 1, 0,
  '<p>Las campanas de marketing reutilizan datos de contacto/facturacion de abonados. Sin gestion adecuada de consentimiento y opt-out hay riesgo de incumplir la Ley 25.326.</p>', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM risks WHERE subject = 'R08 - Incumplimiento de la Ley de Proteccion de Datos Personales en marketing');

-- --- Scoring (Classic: likelihood 1-5 x impact 1-5) -------------------------
INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 4, 5, 4*5*0.4 FROM risks r
WHERE r.subject = 'R01 - Acceso privilegiado sin restricciones del proveedor de software'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 3, 5, 3*5*0.4 FROM risks r
WHERE r.subject = 'R02 - Almacenamiento inseguro de datos de tarjetas (PCI-DSS)'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 3, 3, 3*3*0.4 FROM risks r
WHERE r.subject = 'R03 - Manipulacion/fraude en habilitacion remota de decodificadores'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 3, 4, 3*4*0.4 FROM risks r
WHERE r.subject = 'R04 - Exposicion de datos via integraciones con terceros (Mailchimp, Zapier, Braze, Apigee)'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 3, 3, 3*3*0.4 FROM risks r
WHERE r.subject = 'R05 - Interrupcion de facturacion por falla de integracion con ARCA'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 2, 5, 2*5*0.4 FROM risks r
WHERE r.subject = 'R06 - Riesgo fisico/ambiental por datacenter propio sin redundancia'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 3, 2, 3*2*0.4 FROM risks r
WHERE r.subject = 'R07 - Perdida o robo de dispositivos moviles de tecnicos de campo'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

INSERT INTO risk_scoring (id, scoring_method, CLASSIC_likelihood, CLASSIC_impact, calculated_risk)
SELECT r.id, 1, 2, 2, 2*2*0.4 FROM risks r
WHERE r.subject = 'R08 - Incumplimiento de la Ley de Proteccion de Datos Personales en marketing'
  AND NOT EXISTS (SELECT 1 FROM risk_scoring s WHERE s.id = r.id);

-- --- Vinculacion riesgo <-> activos afectados --------------------------------
INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R01 - Acceso privilegiado sin restricciones del proveedor de software'
  AND a.name IN ('Servidor de Produccion', 'Base de Datos de Abonados')
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);

INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R02 - Almacenamiento inseguro de datos de tarjetas (PCI-DSS)'
  AND a.name = 'Base de Datos de Cobranza'
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);

INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R03 - Manipulacion/fraude en habilitacion remota de decodificadores'
  AND a.name = 'Modulo de Gestion de Decoders'
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);

INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R04 - Exposicion de datos via integraciones con terceros (Mailchimp, Zapier, Braze, Apigee)'
  AND a.name IN ('Datos de Contacto y Facturacion', 'API Keys de Integracion')
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);

INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R05 - Interrupcion de facturacion por falla de integracion con ARCA'
  AND a.name = 'Modulo de Facturacion'
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);

INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R06 - Riesgo fisico/ambiental por datacenter propio sin redundancia'
  AND a.name IN ('Servidor de Produccion', 'Base de Datos de Abonados')
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);

INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R07 - Perdida o robo de dispositivos moviles de tecnicos de campo'
  AND a.name = 'Dispositivos Moviles de Tecnicos'
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);

INSERT INTO risks_to_assets (risk_id, asset_id)
SELECT r.id, a.id FROM risks r, assets a
WHERE r.subject = 'R08 - Incumplimiento de la Ley de Proteccion de Datos Personales en marketing'
  AND a.name = 'Base de Contacto de Abonados'
  AND NOT EXISTS (SELECT 1 FROM risks_to_assets x WHERE x.risk_id = r.id AND x.asset_id = a.id);
