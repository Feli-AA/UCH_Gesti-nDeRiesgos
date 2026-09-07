# Registro de Riesgos — Clínica Privada

**Contexto de la organización:** clínica privada de 120 empleados que atiende
800 pacientes por día, maneja historias clínicas digitales (HCE), datos de
obras sociales y facturación. Rasgo distintivo del escenario: **alta rotación
de personal tercerizado** (soporte IT, limpieza, facturación).

## Inventario de activos relevantes

| ID | Activo | Tipo | Clasificación | Criticidad |
|---|---|---|---|---|
| A01 | Sistema de Historias Clínicas Electrónicas (HCE) | Software | Restringida | Alta |
| A02 | Servidor de turnos y facturación | Hardware/Software | Confidencial | Alta |
| A03 | Base de datos de pacientes y obras sociales | Información | Restringida | Alta |
| A04 | Backups en la nube (proveedor externo) | Información | Restringida | Alta |
| A05 | Server room / cuarto de servidores on-premise | Hardware | Interna | Media |
| A06 | Cuentas y accesos de personal tercerizado | Humano | Confidencial | Alta |

## Evaluación de riesgos

| ID | Activo | Amenaza | Prob. | Impacto | Valor | Nivel | Justificación breve | Controles existentes | Propietario del riesgo |
|---|---|---|---|---|---|---|---|---|---|
| R01 | A01, A06 | Acceso indebido de ex-personal tercerizado | 4 | 4 | 16 | Crítico | Sin proceso formal de baja de accesos; alta rotación lo vuelve frecuente | Ninguno formal; la baja depende de que el proveedor avise por mail | Responsable de Seguridad de la Información (IT) |
| R02 | A02 | Ransomware vía equipo de soporte externo | 3 | 5 | 15 | Alto | Acceso remoto de terceros amplía superficie de ataque; sin segmentación de red | Antivirus básico en estaciones de trabajo | Jefe de Sistemas |
| R03 | A03 | Filtración por uso de canales inseguros (WhatsApp, planillas) | 4 | 3 | 12 | Alto | Rotación impide que la capacitación llegue a todo el personal tercerizado | Cláusula de confidencialidad genérica en el contrato marco | Responsable de RRHH / Compliance |
| R04 | A01, A02 | Pérdida de trazabilidad por cuentas genéricas compartidas | 4 | 3 | 12 | Alto | Práctica común para simplificar altas/bajas frecuentes | Ninguno; práctica tolerada informalmente | Jefe de Sistemas |
| R05 | A04 | Falla del proveedor externo de backups | 2 | 5 | 10 | Alto | Sin copia local adicional; dependencia total de un tercero | Backup automático diario tercerizado | Jefe de Sistemas |
| R06 | A05 | Ingreso físico no autorizado al server room | 3 | 3 | 9 | Medio | Personal de limpieza tercerizado con llave sin registro de acceso | Puerta con llave física, sin control electrónico | Jefe de Sistemas / Administración |
| R07 | A01, A03, A06 | Incumplimiento normativo por NDA no actualizados | 3 | 4 | 12 | Alto | NDA firmado a nivel contrato marco, no por persona individual | NDA estándar firmado con la tercerizadora (no individual) | Compliance / Recursos Humanos |

## Valores para cargar en el formulario "Submit Risk" de SimpleRisk

**Importante:** los desplegables reales de esta instancia de SimpleRisk no
usan las categorías clásicas de la plantilla académica (Confidencialidad/
Integridad/Disponibilidad), sino estas propias del sistema. Usar esta tabla
al completar el formulario, no la columna "Justificación breve" de arriba:

| ID | Category (Submit Risk) | Risk Source | Current Likelihood | Current Impact | Team | Affected Assets → tipo | Owner |
|---|---|---|---|---|---|---|---|
| R01 | Access Management | People | Likely | Major | Information Security | Application | Diego Nicolas Martinengo |
| R02 | Technical Vulnerability Management | External | Credible | Extreme/Catastrophic | IT Systems Management | System | Diego Nicolas Martinengo |
| R03 | Sensitive Data Management | People | Likely | Moderate | Information Security | Application | Benjamin Rosso |
| R04 | Access Management | Process | Likely | Moderate | IT Systems Management | Application | Diego Nicolas Martinengo |
| R05 | Third-Party Management | External | Unlikely | Extreme/Catastrophic | Data Center & Storage | System | Diego Nicolas Martinengo |
| R06 | Physical Security | People | Credible | Moderate | Data Center & Storage | System | Diego Nicolas Martinengo |
| R07 | Policy and Procedure | Process | Credible | Major | Information Security | Application | Benjamin Rosso |

Equivalencia usada (Likelihood/Impact numérico → texto real del sistema):
`1=Remote/Insignificant, 2=Unlikely/Minor, 3=Credible/Moderate, 4=Likely/Major, 5=Almost Certain/Extreme-Catastrophic`

**Criterio para el Owner:** Diego Nicolas Martinengo (tu cuenta admin) queda
como dueño de los riesgos más técnicos/IT (R01, R02, R04, R05, R06), y
Benjamin Rosso (analyst_demo) como dueño de los dos con componente más de
personas/proceso — manejo de datos y cumplimiento normativo (R03, R07).
Julieta Salcedo (auditor_demo) no figura como Owner de ningún riesgo a
propósito: su rol es revisar, no ser responsable de tratarlos — consistente
con los permisos que le diste en `usuarios.md`.

## Tratamiento de riesgos y riesgo residual

| Riesgo | Estrategia | Salvaguardas propuestas | Tipo salv. | Prob. resid. | Imp. resid. | Val. resid. | Nivel resid. |
|---|---|---|---|---|---|---|---|
| R01 | Mitigar | Checklist obligatorio de offboarding + revisión trimestral de usuarios activos vs. contratos vigentes | Administrativa | 2 | 4 | 8 | Medio |
| R02 | Mitigar | Segmentación de red (VLAN) para accesos de terceros + EDR obligatorio en equipos con acceso remoto | Técnica | 2 | 5 | 10 | Alto |
| R03 | Mitigar | Capacitación obligatoria de onboarding en manejo de datos sensibles, con registro firmado | Administrativa | 2 | 3 | 6 | Medio |
| R04 | Mitigar | Política "un usuario, una persona"; eliminación de cuentas genéricas; autenticación individual | Técnica | 2 | 3 | 6 | Medio |
| R05 | Mitigar | Estrategia de backup 3-2-1 (copia local adicional) + prueba de restauración trimestral | Técnica | 1 | 5 | 5 | Medio |
| R06 | Mitigar | Control de acceso electrónico con registro; limpieza del cuarto solo bajo supervisión de IT | Física | 1 | 3 | 3 | Bajo |
| R07 | Mitigar | NDA individual firmado antes del primer acceso a sistemas, integrado al checklist de alta (ver R01) | Administrativa | 1 | 4 | 4 | Bajo |

## Resumen de resultados

| Nivel | Cantidad de riesgos | % del total |
|---|---|---|
| Crítico | 1 | 14% |
| Alto | 5 | 72% |
| Medio | 1 | 14% |
| Bajo | 0 | 0% |
| **Total** | **7** | **100%** |

## Planes de acción (riesgos de nivel Alto/Crítico)

### Plan A — Proceso de Offboarding de Accesos
- **Asociado a:** R01
- **Descripción:** Implementar un checklist obligatorio que la empresa
  tercerizadora y el área de sistemas deben completar juntas al finalizar
  cualquier contrato, dando de baja accesos el mismo día.
- **Responsable:** Jefe de Sistemas
- **Presupuesto estimado:** Bajo (proceso interno, sin costo de licencias)
- **Vencimiento:** 30 días
- **Estado inicial:** Pendiente de inicio

### Plan B — Segmentación de Red para Terceros
- **Asociado a:** R02
- **Descripción:** Crear una VLAN separada para todo acceso remoto de
  proveedores externos y exigir software EDR en los equipos que se conecten.
- **Responsable:** Jefe de Sistemas
- **Presupuesto estimado:** Medio (licencias EDR + horas de configuración de
  red)
- **Vencimiento:** 60 días
- **Estado inicial:** Pendiente de inicio

### Plan C — Capacitación Obligatoria de Onboarding
- **Asociado a:** R03, R07
- **Descripción:** Módulo breve de capacitación en manejo de datos sensibles
  y firma de NDA individual, obligatorio antes de otorgar el primer acceso a
  cualquier sistema.
- **Responsable:** Recursos Humanos / Compliance
- **Presupuesto estimado:** Bajo
- **Vencimiento:** 45 días
- **Estado inicial:** Pendiente de inicio
