INFORME TÉCNICO: GESTIÓN DE RIESGOS CON SIMPLERISK

Estudiante: Maria Paz Sinner
LU: 31911682
Comisión: 4to año

1. OBJETIVO Y ALCANCE

El objetivo fue configurar una instancia reproducible de SimpleRisk y utilizarla para construir el registro inicial de riesgos de una clínica privada ficticia. La organización considerada tiene 120 empleados, atiende aproximadamente 800 pacientes por día y depende de historias clínicas electrónicas, turnos, facturación, correo institucional, infraestructura local, proveedores y equipos médicos conectados.

El alcance incluye seguridad de la información y continuidad de los servicios clínicos y administrativos. No incluye una auditoría legal exhaustiva, seguridad edilicia general ni evaluación de tratamientos médicos. No se utilizaron datos reales de pacientes, empleados o proveedores.

2. PARTE A: INSTALACIÓN Y CONFIGURACIÓN BÁSICA

La instancia se desplegó con Docker Compose mediante tres servicios: SimpleRisk, MySQL y un servidor de correo de prueba. La aplicación escucha únicamente en 127.0.0.1, con HTTPS en el puerto 443 y redirección desde el puerto local 8088. El puerto 8080 no se utilizó porque estaba ocupado por otro servicio local.

Las claves se almacenan en un archivo .env que no forma parte de la entrega. El archivo .env.example permite reproducir la configuración sin publicar credenciales. Los datos persistentes se conservan en un volumen administrado por Docker.

Se crearon tres usuarios diferenciados. La cuenta admin_clinica administra la instancia. La cuenta analista_riesgos puede crear y modificar riesgos, planificar mitigaciones, realizar revisiones y comentar, pero no posee administración completa ni permisos de cierre o aceptación. La cuenta auditor_clinica puede consultar, revisar y comentar, pero no modificar el registro ni administrar el sistema. Esta distribución aplica separación de funciones y privilegio mínimo.

Para validar el funcionamiento se creó el riesgo R-01, denominado Interrupción del sistema de historias clínicas. SimpleRisk le asignó una puntuación nativa de 6,4 y nivel Medium.

3. PARTE B: REGISTRO DE RIESGOS DE LA CLÍNICA

La evaluación académica utiliza una escala de probabilidad e impacto de 1 a 5. El valor se obtiene multiplicando ambos factores. Los valores de 1 a 4 son bajos, de 5 a 9 medios, de 10 a 15 altos y de 16 a 25 críticos.

Esta matriz se utiliza para justificar y comparar prioridades. No representa frecuencias ni pérdidas monetarias exactas. SimpleRisk utiliza además su propia puntuación Classic; ambas escalas se presentan separadas para evitar interpretaciones incorrectas.

Se identificaron siete riesgos específicos.

R-02 analiza el cifrado de historias clínicas, servidores, admisión y archivos compartidos mediante ransomware. Su valor académico es 20, crítico. SimpleRisk le asignó 8, High.

R-03 analiza el robo de credenciales mediante phishing y el posible acceso a correo, historias clínicas y otros sistemas. Su valor académico es 16, crítico. SimpleRisk le asignó 6,4, Medium.

R-04 analiza la consulta o divulgación indebida de historias clínicas por personal con permisos superiores a los necesarios. Su valor académico es 15, alto. SimpleRisk le asignó 6, Medium.

R-05 analiza una falla eléctrica, de red o del servidor central que interrumpa historias clínicas, turnos y facturación. Su valor académico es 20, crítico. SimpleRisk le asignó 8, High.

R-06 analiza la exposición de información intercambiada con obras sociales, proveedores de facturación u otros terceros. Su valor académico es 15, alto. SimpleRisk le asignó 6, Medium.

R-07 analiza errores o modificaciones no autorizadas de códigos y nomencladores que produzcan facturación incorrecta. Su valor académico es 12, alto. SimpleRisk le asignó 4,8, Medium.

R-08 analiza equipos médicos y estaciones de diagnóstico con software desactualizado que podrían ser comprometidos o utilizados para acceder a la red clínica. Su valor académico es 15, alto. SimpleRisk le asignó 8, High.

Las justificaciones completas de probabilidad, impacto, activos, controles, propietarios, tratamientos y riesgo residual se encuentran en configuracion/riesgos.md.

4. PLANES DE ACCIÓN

Se registraron tres planes para los riesgos con mayor puntuación nativa.

El primer plan corresponde a R-02 y propone EDR, autenticación multifactor, segmentación, copias 3-2-1 aisladas e inmutables, pruebas de restauración y un procedimiento de respuesta a ransomware. Su vencimiento es el 30 de noviembre de 2026.

El segundo plan corresponde a R-05 y propone dimensionar la UPS, incorporar redundancia, configurar monitoreo, realizar mantenimiento preventivo y probar la recuperación y la continuidad manual. Su vencimiento es el 31 de enero de 2027.

El tercer plan corresponde a R-08 y propone completar el inventario, segmentar equipos médicos, coordinar parches con fabricantes, aplicar controles compensatorios, monitorear comunicaciones y documentar el aislamiento. Su vencimiento es el 28 de febrero de 2027.

Los tres planes fueron asignados a Ana Analista, utilizan el rango académico de presupuesto entre USD 0 y USD 100.000 y se encuentran en estado Mitigation Planned con avance inicial de 0 por ciento. No fueron aceptados ni ejecutados porque la consigna solicita su planificación y estado inicial.

5. COMPARACIÓN METODOLÓGICA

SimpleRisk, aplicado con una matriz clásica de probabilidad por impacto, permite crear rápidamente un registro, ordenar prioridades, asignar propietarios y seguir mitigaciones. Sus puntajes y niveles son fáciles de comunicar. La principal limitación es que las categorías son ordinales: combinaciones diferentes pueden producir resultados semejantes y generar una apariencia de precisión que no equivale a una pérdida o frecuencia real.

NIST SP 800-30 Rev. 1 organiza la evaluación en cuatro etapas: preparar, realizar, comunicar y mantener. Durante el análisis considera fuentes y eventos de amenaza, vulnerabilidades, condiciones predisponentes, probabilidad, impacto e incertidumbre. Este enfoque mejora la trazabilidad de los supuestos y la evidencia, pero exige más tiempo, información y experiencia.

La matriz de SimpleRisk resulta conveniente para una clínica que necesita iniciar y mantener un registro operativo. NIST SP 800-30 es más apropiado para profundizar riesgos de alto impacto, sistemas clínicos críticos, evaluaciones de terceros o decisiones donde la incertidumbre debe quedar explícita.

Ambos enfoques son complementarios. SimpleRisk puede conservar la vista operativa y ejecutiva, mientras que NIST SP 800-30 puede utilizarse para analizar con mayor profundidad ransomware, infraestructura crítica y tecnología médica.

6. INTEGRACIÓN EXTERNA PROPUESTA

Se investigó una integración con Jira para transformar mitigaciones planificadas en tareas operativas. La API REST v2 de SimpleRisk permite acceder programáticamente a sus entidades y utiliza claves asociadas a usuarios. La API REST v3 de Jira permite crear y actualizar incidencias.

El diseño propone una tarea programada que consulte riesgos y mitigaciones, seleccione los registros de prioridad alta o modificados, y cree o actualice una incidencia de Jira. La relación entre el ID de SimpleRisk y la clave de Jira permitiría evitar duplicados.

Los únicos datos enviados serían el ID, el título resumido, la prioridad, el responsable, el vencimiento, el estado y un enlace al registro. No se copiarían historias clínicas, nombres de pacientes ni descripciones sensibles.

La integración debería utilizar una cuenta de servicio de privilegio mínimo, HTTPS, secretos fuera del repositorio, tiempos de espera, reintentos limitados, validación de campos y registros de auditoría sin cuerpos completos. Las pruebas deberían confirmar que un riesgo crea una sola incidencia, que los cambios actualizan la incidencia existente y que un fallo de autenticación no expone secretos.

La integración no fue implementada. La consigna exige investigarla y documentarla; la implementación se considera optativa. Por ese motivo se presenta como diseño y no como funcionalidad comprobada.

7. RESULTADOS Y LIMITACIONES

La instancia permitió registrar usuarios, activos, riesgos y mitigaciones. Los resultados muestran que las prioridades inmediatas son la recuperación ante ransomware, la continuidad de infraestructura y el control de equipos médicos desactualizados.

El escenario, los controles existentes y los presupuestos son supuestos académicos. Los valores residuales son estimaciones previas a la implementación. En una organización real deberían validarse mediante entrevistas, evidencia técnica, pruebas, métricas, requisitos legales y cotizaciones.

La instalación es un laboratorio local y no una configuración productiva. En producción serían necesarios certificados confiables, gestión centralizada de secretos, monitoreo, copias de seguridad cifradas, actualización periódica, endurecimiento de sesiones y una revisión formal de permisos.

8. CONCLUSIONES

La clínica debería reducir primero la probabilidad de ransomware y compromiso de identidades, asegurar una restauración verificable y disminuir los puntos únicos de falla. En paralelo debería limitar los accesos a historias clínicas según función, controlar a terceros y segmentar equipos médicos.

La eficacia no debe medirse únicamente por la existencia documental de controles. Debe verificarse mediante cobertura real de MFA y EDR, restauraciones exitosas, simulacros de continuidad, recertificación de accesos y evidencia de seguimiento de vulnerabilidades.

9. REFERENCIAS

NIST. SP 800-30 Rev. 1: Guide for Conducting Risk Assessments. https://csrc.nist.gov/pubs/sp/800/30/r1/final

U.S. Department of Health and Human Services. Healthcare and Public Health Cybersecurity Performance Goals. https://hhscyber.hhs.gov/cybersecurity-performance-goals.html

SimpleRisk. API Overview. https://support.simplerisk.com/kb/08-01-api-overview

SimpleRisk. Using the API for Integrations. https://support.simplerisk.com/kb/07-04-using-the-api-for-integrations

Atlassian. Jira Cloud platform REST API v3. https://developer.atlassian.com/cloud/jira/platform/rest/v3/intro

SimpleRisk. Official Docker images. https://github.com/simplerisk/docker
