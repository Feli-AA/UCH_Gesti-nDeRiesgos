# Registro de Riesgos — Clínica (SimpleRisk)

## Riesgo 1: Acceso no autorizado a historia clínica
- **Descripción**: Personal de la clínica sin motivo asistencial (curiosidad, venganza, tráfico de datos) o un atacante externo accede a historias clínicas de pacientes sin autorización.
- **Categoría**: Confidencialidad
- **Activos afectados**: Sistema de Historia Clínica Electrónica (HCE), base de datos de pacientes, credenciales de acceso del personal
- **Probabilidad**: 4 (Alta) — 120 empleados con distintos niveles de acceso, la auditoría externa ya encontró debilidades en la gestión de riesgos, y el sector salud es uno de los más atacados según el Verizon DBIR.
- **Impacto**: 5 (Muy alto) — los datos de salud son datos sensibles bajo la Ley 25.326, con sanciones legales asociadas, más daño reputacional directo.
- **Nivel de riesgo resultante**: Muy alto (4×5)
- **Controles existentes**: Usuario/contraseña individual, sin logging de accesos, sin diferenciación de roles previa a esta auditoría.
- **Plan de tratamiento**: Mitigar — RBAC + logging de accesos + revisiones periódicas.
- **Propietario**: Jefe de Sistemas / Responsable de Seguridad de la Información

## Riesgo 2: Integridad de datos en historia clínica
- **Descripción**: Por error humano o de forma intencional, se modifica un dato clínico crítico de un paciente (alergias, medicación, diagnóstico), lo que puede derivar en un error médico.
- **Categoría**: Integridad
- **Activos afectados**: Sistema HCE, base de datos de pacientes
- **Probabilidad**: 3 (Media) — alta carga operativa (800 pacientes/día) hace frecuente el error humano de carga.
- **Impacto**: 5 (Muy alto) — puede derivar en un error médico grave y responsabilidad legal por mala praxis.
- **Nivel de riesgo resultante**: Alto/Muy alto (3×5)
- **Controles existentes**: Sin registro de cambios (audit trail), sin validación por doble carga.
- **Plan de tratamiento**: Mitigar — audit trail de cambios + doble validación en campos críticos.
- **Propietario**: Dirección Médica / Jefe de Sistemas

## Riesgo 3: Pérdida de datos permanente
- **Descripción**: Pérdida irrecuperable de datos por falla de hardware, ransomware que cifra sin posibilidad de recuperación, o borrado accidental sin respaldo.
- **Categoría**: Integridad/Disponibilidad
- **Activos afectados**: Base de datos de HCE, servidor de facturación
- **Probabilidad**: 3 (Media) — sin evidencia de backups verificados.
- **Impacto**: 5 (Muy alto) — perder la historia clínica de toda la clínica es catastrófico.
- **Nivel de riesgo resultante**: Alto/Muy alto (3×5)
- **Controles existentes**: Backups sin verificar / sin pruebas de restauración.
- **Plan de tratamiento**: Mitigar — política de backup 3-2-1 + pruebas de restauración periódicas.
- **Propietario**: Jefe de Sistemas

## Riesgo 4: Disponibilidad de datos — caída temporal del sistema
- **Descripción**: El sistema de historia clínica queda temporalmente inaccesible por corte de suministro eléctrico prolongado, falla de servidor o saturación de red.
- **Categoría**: Disponibilidad
- **Activos afectados**: Servidor de aplicaciones, red interna, sistema HCE
- **Probabilidad**: 4 (Alta) — existe UPS para servidores críticos, pero sin generador de respaldo, la autonomía queda limitada a minutos.
- **Impacto**: 4 (Alto) — sin acceso al sistema no pueden atender a los 800 pacientes/día normalmente.
- **Nivel de riesgo resultante**: Alto (4×4)
- **Controles existentes**: UPS para servidores críticos, sin generador de respaldo.
- **Plan de tratamiento**: Mitigar — generador eléctrico de respaldo + plan de contingencia manual.
- **Propietario**: Jefe de Sistemas

## Riesgo 5: Destrucción insegura de información
- **Descripción**: Documentación en papel o dispositivos digitales con datos de pacientes se descartan sin protocolo de destrucción segura.
- **Categoría**: Legal/Cumplimiento
- **Activos afectados**: Archivos físicos antiguos, discos y equipos dados de baja
- **Probabilidad**: 3 (Media) — sin política formal de retención/destrucción de datos.
- **Impacto**: 4 (Alto) — incumple la obligación de destrucción segura de datos sensibles de la Ley 25.326.
- **Nivel de riesgo resultante**: Alto (3×4)
- **Controles existentes**: Ninguno formal.
- **Plan de tratamiento**: Mitigar — política de retención y destrucción segura + servicio de destrucción certificada.
- **Propietario**: Responsable de Cumplimiento / Jefe de Sistemas

## Riesgo 6: Filtración de datos de pagos
- **Descripción**: Exposición de datos de facturación/pago de pacientes por una brecha en el sistema de facturación o una mala configuración de accesos.
- **Categoría**: Confidencialidad
- **Activos afectados**: Sistema de facturación, datos de pago de pacientes
- **Probabilidad**: 3 (Media)
- **Impacto**: 5 (Muy alto) — combina datos financieros con datos de salud, de altísimo valor en mercado negro.
- **Nivel de riesgo resultante**: Alto/Muy alto (3×5)
- **Controles existentes**: Sin cifrado específico de datos de pago.
- **Plan de tratamiento**: Mitigar / Transferir — pasarela de pago tercerizada transfiere parte del riesgo.
- **Propietario**: Administración / Jefe de Sistemas

## Riesgo 7: Accesos no dados de baja de ex-empleados
- **Descripción**: Personal que deja la clínica conserva credenciales activas, permitiendo un acceso indebido posterior.
- **Categoría**: Operativo
- **Activos afectados**: Sistema HCE, sistema de facturación, credenciales de usuario
- **Probabilidad**: 4 (Alta) — alta rotación típica de clínicas, sin proceso formal de baja de accesos.
- **Impacto**: 3 (Medio) — depende de qué tan rápido se detecte.
- **Nivel de riesgo resultante**: Alto (4×3)
- **Controles existentes**: Ninguno formal.
- **Plan de tratamiento**: Mitigar — checklist de offboarding + auditoría periódica de usuarios.
- **Propietario**: RRHH + Jefe de Sistemas

## Riesgo 8: Phishing a personal administrativo
- **Descripción**: Personal administrativo recibe correos fraudulentos pidiendo credenciales o el pago de una factura falsa.
- **Categoría**: Operativo
- **Activos afectados**: Cuentas de correo institucional, credenciales de acceso al sistema
- **Probabilidad**: 5 (Muy alta) — vector de ataque inicial más común a nivel mundial.
- **Impacto**: 4 (Alto) — puede derivar en robo de credenciales, fraude, o entrada de ransomware.
- **Nivel de riesgo resultante**: Muy alto (5×4)
- **Controles existentes**: Sin capacitación en concientización de seguridad.
- **Plan de tratamiento**: Mitigar — capacitación periódica + filtro anti-phishing + MFA.
- **Propietario**: Jefe de Sistemas / RRHH

## Riesgo 9: Robo o pérdida física de dispositivo
- **Descripción**: Una notebook o tablet con acceso al sistema o datos descargados se pierde o es robada fuera de la clínica.
- **Categoría**: Operativo/Físico
- **Activos afectados**: Notebooks y tablets del personal, datos descargados localmente
- **Probabilidad**: 3 (Media)
- **Impacto**: 4 (Alto) — sin cifrado de disco, el dispositivo expone datos de pacientes.
- **Nivel de riesgo resultante**: Alto (3×4)
- **Controles existentes**: Sin cifrado de disco estándar.
- **Plan de tratamiento**: Mitigar — cifrado de disco obligatorio + MDM + borrado remoto.
- **Propietario**: Jefe de Sistemas