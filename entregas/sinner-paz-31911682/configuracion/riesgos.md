REGISTRO INICIAL DE RIESGOS Y PLANES DE ACCIÓN

Escala académica

Probabilidad: 1 rara, 2 improbable, 3 posible, 4 probable y 5 casi segura.

Impacto: 1 insignificante, 2 menor, 3 moderado, 4 mayor y 5 catastrófico.

Nivel resultante: 1 a 4 bajo, 5 a 9 medio, 10 a 15 alto y 16 a 25 crítico.

La puntuación nativa de SimpleRisk utiliza el método Classic y no es equivalente a la matriz académica. El riesgo R-01 corresponde a la validación técnica de la Parte A. Los riesgos R-02 a R-08 corresponden al caso de la clínica.

R-01. Interrupción del sistema de historias clínicas

Finalidad: riesgo de prueba para validar el funcionamiento de SimpleRisk.
Resultado nativo: 6,4, nivel Medium.
Estado: New.

R-02. Ransomware cifra sistemas clínicos y estaciones de admisión

Categoría: disponibilidad y confidencialidad.
Activos: historias clínicas, servidores clínicos, estaciones de admisión y archivos compartidos.
Descripción: un ataque podría cifrar simultáneamente los sistemas necesarios para consultar antecedentes y registrar la atención, además de exponer datos personales y clínicos.
Probabilidad: 4. Se consideran múltiples vías de entrada, como correo malicioso, credenciales comprometidas, servicios expuestos o equipos sin actualizar.
Impacto: 5. Una interrupción prolongada afectaría directamente la atención y la información sensible.
Resultado académico: 20, crítico.
Resultado nativo: 8, High.
Controles existentes supuestos: antivirus tradicional, firewall perimetral y copia diaria conectada a la red.
Tratamiento: mitigar.
Propietario: Responsable de TI. En SimpleRisk se asignó a Ana Analista para el ejercicio.
Estado: Mitigation Planned.

R-03. Robo de credenciales mediante phishing

Categoría: confidencialidad y legal.
Activos: correo electrónico, cuentas institucionales, historias clínicas y datos personales.
Descripción: un correo engañoso podría permitir el uso indebido de una cuenta para acceder a información clínica, realizar fraude o intentar movimiento lateral.
Probabilidad: 4. La clínica tiene 120 empleados que procesan comunicaciones diariamente y poseen distintos niveles de capacitación.
Impacto: 4. Una cuenta comprometida puede producir exposición de datos y acceso a sistemas internos, aunque no necesariamente paraliza toda la clínica.
Resultado académico: 16, crítico.
Resultado nativo: 6,4, Medium.
Controles existentes supuestos: contraseña, filtro antispam básico y gestión manual de altas y bajas.
Tratamiento: mitigar.
Propietario: Responsable de Seguridad.
Estado: New.

R-04. Acceso interno indebido a historias clínicas

Categoría: confidencialidad y legal.
Activos: historias clínicas, datos de salud y registros de auditoría.
Descripción: un empleado con privilegios excesivos podría consultar o divulgar información sin una razón asistencial válida.
Probabilidad: 3. El acceso legítimo del personal y los permisos amplios dificultan distinguir una consulta indebida.
Impacto: 5. Los datos de salud son sensibles y su divulgación puede causar daño personal, legal y reputacional.
Resultado académico: 15, alto.
Resultado nativo: 6, Medium.
Controles existentes supuestos: usuarios nominales y registro básico de accesos.
Tratamiento: mitigar.
Propietario: Dirección Médica.
Estado: New.

R-05. Falla de infraestructura interrumpe servicios clínicos

Categoría: disponibilidad y operación.
Activos: red clínica, servidores, historias clínicas, sistema de turnos y facturación.
Descripción: una falla eléctrica, de red o del servidor central podría impedir el acceso a servicios esenciales durante la jornada.
Probabilidad: 4. Se supone la existencia de puntos únicos de falla y una UPS de autonomía limitada.
Impacto: 5. La operación manual aumentaría demoras, errores y el riesgo de atender sin información completa.
Resultado académico: 20, crítico.
Resultado nativo: 8, High.
Controles existentes supuestos: UPS limitada y soporte técnico reactivo.
Tratamiento: mitigar y transferir parcialmente.
Propietario: Responsable de Infraestructura. En SimpleRisk se asignó a Ana Analista para el ejercicio.
Estado: Mitigation Planned.

R-06. Brecha de un proveedor expone datos de pacientes

Categoría: confidencialidad y terceros.
Activos: información intercambiada con terceros e interfaces con prestadores.
Descripción: una obra social, proveedor de facturación u otro tercero conectado podría sufrir un incidente que exponga información de la clínica.
Probabilidad: 3. La organización depende de múltiples terceros e intercambia datos con ellos.
Impacto: 5. La exposición podría ser masiva y la clínica conserva responsabilidades sobre la protección de los datos.
Resultado académico: 15, alto.
Resultado nativo: 6, Medium.
Controles existentes supuestos: contratos generales y autenticación mediante usuario y contraseña.
Tratamiento: mitigar y transferir.
Propietario: Administración y Compras.
Estado: New.

R-07. Alteración de códigos produce facturación incorrecta

Categoría: integridad y finanzas.
Activos: sistema de facturación, nomencladores y cuentas corrientes.
Descripción: un error humano o un cambio no autorizado podría generar facturas incorrectas, rechazos, cobros indebidos y reprocesos.
Probabilidad: 3. La carga y actualización de códigos incluye intervención humana.
Impacto: 4. Puede producir pérdidas económicas y afectar la integridad de los registros, aunque normalmente no detiene la atención clínica.
Resultado académico: 12, alto.
Resultado nativo: 4,8, Medium.
Controles existentes supuestos: perfiles funcionales y revisión manual por muestreo.
Tratamiento: mitigar.
Propietario: Jefatura de Facturación.
Estado: New.

R-08. Equipos médicos desactualizados comprometen la red clínica

Categoría: disponibilidad e integridad.
Activos: equipos médicos, estaciones de diagnóstico y red interna clínica.
Descripción: dispositivos con software desactualizado podrían contener vulnerabilidades explotables, interrumpir su funcionamiento o servir como acceso a otros sistemas.
Probabilidad: 3. Algunos equipos dependen del fabricante y no admiten actualizaciones inmediatas.
Impacto: 5. La indisponibilidad puede retrasar diagnósticos, afectar la atención y facilitar la propagación hacia servicios críticos.
Resultado académico: 15, alto.
Resultado nativo: 8, High.
Controles existentes supuestos: inventario parcial y mantenimiento dependiente del proveedor.
Tratamiento: mitigar.
Propietario: Ingeniería Clínica y TI. En SimpleRisk se asignó a Ana Analista para el ejercicio.
Estado: Mitigation Planned.

Planes de acción registrados

Plan 1. Protección y recuperación ante ransomware

Riesgo asociado: R-02.
Descripción: implementar EDR, MFA, segmentación, copias 3-2-1 aisladas e inmutables, pruebas de restauración y respuesta a ransomware.
Fecha de vencimiento: 30 de noviembre de 2026.
Responsable: Ana Analista.
Presupuesto estimado: entre USD 0 y USD 100.000.
Estado inicial: Mitigation Planned, avance 0 por ciento.
Criterio de cierre: MFA y EDR activos en cuentas y equipos prioritarios, con una restauración exitosa y documentada.

Plan 2. Continuidad de infraestructura clínica

Riesgo asociado: R-05.
Descripción: dimensionar la UPS, agregar redundancia, configurar monitoreo, realizar mantenimiento preventivo y probar recuperación y continuidad manual.
Fecha de vencimiento: 31 de enero de 2027.
Responsable: Ana Analista.
Presupuesto estimado: entre USD 0 y USD 100.000.
Estado inicial: Mitigation Planned, avance 0 por ciento.
Criterio de cierre: autonomía, redundancia y monitoreo comprobados, con un simulacro documentado.

Plan 3. Seguridad de equipos médicos

Riesgo asociado: R-08.
Descripción: completar el inventario, segmentar dispositivos, coordinar parches, aplicar controles compensatorios, monitorear y documentar el aislamiento.
Fecha de vencimiento: 28 de febrero de 2027.
Responsable: Ana Analista.
Presupuesto estimado: entre USD 0 y USD 100.000.
Estado inicial: Mitigation Planned, avance 0 por ciento.
Criterio de cierre: inventario completo, segmentación verificada, tratamiento de vulnerabilidades documentado y procedimiento de aislamiento probado.

Riesgo residual estimado

R-02: probabilidad 2, impacto 5, valor 10, alto.
R-03: probabilidad 2, impacto 4, valor 8, medio.
R-04: probabilidad 2, impacto 5, valor 10, alto.
R-05: probabilidad 2, impacto 5, valor 10, alto.
R-06: probabilidad 2, impacto 5, valor 10, alto.
R-07: probabilidad 2, impacto 4, valor 8, medio.
R-08: probabilidad 2, impacto 5, valor 10, alto.

El impacto residual permanece alto en varios casos porque un incidente exitoso todavía puede afectar la atención. Los controles propuestos reducen principalmente la probabilidad y el tiempo de recuperación.
