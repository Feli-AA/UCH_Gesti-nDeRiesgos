\# Registro de riesgos de la clínica



\## Criterio de evaluación



Se utilizó una escala de probabilidad e impacto de 1 a 5.



| Valor | Probabilidad | Impacto |

|---:|---|---|

| 1 | Muy improbable | Insignificante |

| 2 | Poco probable | Menor |

| 3 | Posible | Moderado |

| 4 | Probable | Grave |

| 5 | Muy probable | Crítico |



El nivel académico se obtiene mediante:



`Nivel de riesgo = Probabilidad × Impacto`



| Resultado | Clasificación |

|---:|---|

| 1 a 4 | Bajo |

| 5 a 9 | Medio |

| 10 a 16 | Alto |

| 17 a 25 | Crítico |



SimpleRisk utiliza internamente el método de puntuación Classic, por lo que el valor mostrado por la aplicación puede diferir del resultado numérico de la matriz académica.



\## Riesgos definidos



| ID | Riesgo | Categoría | Activos afectados | Probabilidad | Impacto | Resultado | Tratamiento | Propietario |

|---|---|---|---|---:|---:|---:|---|---|

| CLI-RISK-001 | Ataque de ransomware sobre las historias clínicas digitales | Technical Vulnerability Management | Historias clínicas, servidores y copias de seguridad | 4 | 5 | 20 - Crítico | Mitigar | Administrador de Seguridad |

| CLI-RISK-002 | Acceso no autorizado mediante credenciales comprometidas | Access Management | Historias clínicas, credenciales y datos de pacientes | 4 | 5 | 20 - Crítico | Mitigar | Administrador de Seguridad |

| CLI-RISK-003 | Campaña de phishing dirigida al personal | Policy and Procedure | Correo institucional, cuentas y equipos | 5 | 4 | 20 - Crítico | Mitigar | Analista de Riesgos |

| CLI-RISK-004 | Alteración accidental o maliciosa de historias clínicas | Sensitive Data Management | Historias clínicas y registros médicos | 3 | 5 | 15 - Alto | Mitigar | Analista de Riesgos |

| CLI-RISK-005 | Falla en las copias de seguridad y recuperación | Policy and Procedure | Copias de seguridad, historias clínicas y facturación | 3 | 5 | 15 - Alto | Mitigar | Administrador de Seguridad |

| CLI-RISK-006 | Indisponibilidad del sistema clínico por falla de infraestructura | Environmental Resilience | Sistema clínico, servidores, red y energía | 3 | 5 | 15 - Alto | Mitigar | Administrador de Seguridad |

| CLI-RISK-007 | Pérdida o robo de dispositivos con información clínica | Physical Security | Notebooks, teléfonos, credenciales y datos clínicos | 3 | 4 | 12 - Alto | Mitigar | Administrador de Seguridad |



\## Controles existentes y tratamientos



\### CLI-RISK-001 — Ransomware



\- \*\*Controles existentes:\*\* antivirus, autenticación mediante credenciales y copias de seguridad básicas.

\- \*\*Tratamiento:\*\* copias 3-2-1, protección avanzada de endpoints, actualizaciones, segmentación, segmentación de red y pruebas de recuperación.



\### CLI-RISK-002 — Acceso no autorizado



\- \*\*Controles existentes:\*\* usuario y contraseña, perfiles básicos de acceso y registros de actividad.

\- \*\*Tratamiento:\*\* autenticación multifactor, control de acceso basado en roles, revisión periódica de permisos y alertas por accesos anómalos.



\### CLI-RISK-003 — Phishing



\- \*\*Controles existentes:\*\* filtro básico de correo no deseado, antivirus y pautas generales de uso.

\- \*\*Tratamiento:\*\* protección avanzada del correo, autenticación multifactor, capacitaciones y simulaciones trimestrales.



\### CLI-RISK-004 — Alteración de información clínica



\- \*\*Controles existentes:\*\* autenticación, perfiles básicos y registro general de actividad.

\- \*\*Tratamiento:\*\* cuentas individuales, mínimo privilegio, trazabilidad detallada, revisión de permisos y recuperación de versiones.



\### CLI-RISK-005 — Fallas de respaldo



\- \*\*Controles existentes:\*\* copias de seguridad básicas sin pruebas periódicas documentadas.

\- \*\*Tratamiento:\*\* estrategia 3-2-1, copias cifradas e inmutables, monitoreo y pruebas trimestrales de restauración.



\### CLI-RISK-006 — Indisponibilidad del sistema



\- \*\*Controles existentes:\*\* UPS en equipos críticos, soporte técnico y procedimientos manuales básicos.

\- \*\*Tratamiento:\*\* redundancia, monitoreo continuo, mantenimiento preventivo y pruebas del plan de continuidad.



\### CLI-RISK-007 — Pérdida o robo de dispositivos



\- \*\*Controles existentes:\*\* contraseña de inicio de sesión y bloqueo manual.

\- \*\*Tratamiento:\*\* cifrado completo, bloqueo automático, autenticación multifactor, inventario y borrado remoto.



\## Registro de prueba



Además de los siete riesgos definitivos, se creó el registro `TEST-001` para validar el funcionamiento inicial de SimpleRisk. Este registro no forma parte del análisis definitivo.

