# Matriz de Riesgos — Clínica Privada

## 1. Datos Generales

| Campo | Valor |
|---|---|
| Organización | Clínica privada ficticia (120 empleados, ~800 pacientes/día) |
| Alumno | Joaquín Herrera Gámez |
| Legajo | 45360092 |
| Materia | Seguridad |

## 2. Objetivo y Alcance

Identificar y evaluar los riesgos de seguridad de la información asociados a los sistemas
digitales de una clínica privada (historias clínicas, facturación, turnos, equipamiento
conectado y credenciales de acceso), para priorizar su tratamiento mediante la herramienta
SimpleRisk.

**Alcance:** sistemas de información de la clínica (historias clínicas digitales, base de
datos de facturación/obras sociales, sistema de turnos, backups, equipamiento médico
conectado a la red) y el personal que los opera. No incluye equipos de diagnóstico por
imagen, guardia ni internación, por no estar confirmados en el escenario del enunciado.

## 3. Inventario de Activos

| ID | Descripción del Activo | Tipo | Responsable | Clasificación | Criticidad |
|---|---|---|---|---|---|
| A01 | Historias clínicas digitales | Información | Dirección Médica | Restringida | Alta |
| A02 | Base de datos de facturación y obras sociales | Información | Administración | Confidencial | Alta |
| A06 | Personal administrativo y médico | Humano | RRHH | Interna | Alta |
| A08 | Sistema de turnos y agenda de pacientes | Software | Administración | Interna | Media |
| A09 | Copias de backup | Información | Sistemas de la clínica | Restringida | Alta |
| A10 | Equipamiento médico conectado a la red (IoT) | Hardware | Dirección Médica | Interna | Media |
| A11 | Credenciales de acceso (usuarios y contraseñas) | Información | Administrador de IT | Restringida | Alta |

## 4. Identificación de Amenazas y Vulnerabilidades

| ID | Activo | Descripción de la Amenaza | Tipo | Vulnerabilidad Asociada |
|---|---|---|---|---|
| T01 | A01 | Consulta de historias clínicas sin necesidad de uso | Intencional | Falta de control de acceso granular por rol |
| T02 | A02 | Filtración/acceso indebido a datos de facturación | Intencional/Accidental | Datos financieros sin controles adicionales de auditoría |
| T03 | A06/A11 | Phishing dirigido al personal | Intencional | Falta de capacitación y de filtrado avanzado de correo |
| T04 | A08 | Ataque de sobrecarga o vencimiento de infraestructura | Intencional/Accidental | Sin protección anti-sobrecarga (CDN/anti-DDoS) |
| T05 | A09 | Falla del servidor que aloja el backup | Accidental | Backup sin redundancia externa |
| T06 | A10 | Explotación de dispositivo IoT como puerta de entrada | Intencional | Dispositivos sin segmentación de red ni actualizaciones |
| T07 | A11 | Contraseñas débiles o reutilizadas | Accidental/Intencional | Sin política de contraseñas obligatoria |

## 5. Escalas de Valoración

### Probabilidad
| Valor | Nivel | Descripción |
|---|---|---|
| 1 | Raro | Solo en circunstancias excepcionales |
| 2 | Improbable | Podría ocurrir, no se espera |
| 3 | Posible | Existe posibilidad real |
| 4 | Probable | Muy probable que ocurra |
| 5 | Casi seguro | Se espera que ocurra frecuentemente |

### Impacto
| Valor | Nivel | Descripción |
|---|---|---|
| 1 | Insignificante | Sin consecuencias relevantes |
| 2 | Menor | Alteración leve, costo bajo |
| 3 | Moderado | Impacto apreciable, recuperable |
| 4 | Mayor | Impacto significativo, costo alto |
| 5 | Catastrófico | Paralización total, daño severo |

### Niveles de riesgo (Probabilidad × Impacto)
| Nivel | Rango | Acción |
|---|---|---|
| Bajo | 1–4 | Monitorear |
| Medio | 5–9 | Plan a mediano plazo |
| Alto | 10–15 | Tratamiento prioritario |
| Crítico | 16–25 | Acción inmediata |

## 6. Riesgo de prueba (Fase 1)

| Campo | Valor |
|---|---|
| ID en SimpleRisk | 1001 |
| Subject | Riesgo de Prueba - acceso no autorizado |
| Categoría | Access Management |
| Registrado por | Analista |
| Likelihood | Likely |
| Impact | Minor |
| Risk Assessment | Riesgo de prueba para validar el correcto funcionamiento del sistema |
| Resultado | Confirmó que el flujo de alta de riesgos y los permisos del rol Analista funcionan correctamente |

## 7. Evaluación de Riesgos

| ID | Activo | Amenaza | Prob. | Impacto | Valor | Nivel | Justificación breve |
|---|---|---|---|---|---|---|---|
| R01 | A01 | Acceso indebido a historias clínicas por personal sin necesidad de uso | 3 | 4 | 12 | Alto | Sin control de acceso granular por rol/especialidad |
| R02 | A02 | Filtración/acceso indebido a datos de facturación y obras sociales | 2 | 4 | 8 | Medio | Roles ya separados reducen exposición interna |
| R03 | A06/A11 | Phishing dirigido al personal administrativo y médico | 2 | 4 | 8 | Medio | Sin capacitación ni filtrado avanzado de correo |
| R04 | A08 | Indisponibilidad del sistema de turnos (ataque o vencimiento de infra) | 2 | 3 | 6 | Medio | Sin protección anti sobrecarga; impacto acotado y recuperable |
| R05 | A09 | Pérdida de backups por ausencia de redundancia externa | 2 | 4 | 8 | Medio | Backup y original comparten el mismo entorno físico |
| R06 | A10 | Compromiso de equipamiento IoT como puerta de entrada a la red | 3 | 4 | 12 | Alto | Ataques automatizados/oportunistas, sin segmentación de red |
| R07 | A11 | Contraseñas débiles o reutilizadas | 4 | 4 | 16 | Crítico | Sin política de contraseñas obligatoria |

## 8. Detalle de Riesgos

### R01 — Acceso indebido a historias clínicas por personal sin necesidad de uso
- **Descripción:** empleados administrativos o médicos consultan historias clínicas fuera del ámbito de su función, porque el sistema no aplica control de acceso granular por rol/especialidad.
- **Categoría:** Confidencialidad
- **Controles existentes:** autenticación con usuario y contraseña individual, sin control de acceso diferenciado por rol
- **Tratamiento:** Mitigar
- **Propietario:** Dirección Médica

### R02 — Filtración o acceso indebido a datos de facturación y obras sociales
- **Descripción:** personal no autorizado accede a información financiera y de obras sociales de pacientes, proveedores y de la clínica, con riesgo de robo o divulgación.
- **Categoría:** Confidencialidad
- **Controles existentes:** autenticación individual, roles diferenciados (Analista/Auditor)
- **Tratamiento:** Mitigar
- **Propietario:** Gerencia Administrativa/Financiera

### R03 — Phishing dirigido al personal administrativo y médico
- **Descripción:** un empleado recibe un correo fraudulento que simula ser del sistema interno y entrega sus credenciales, permitiendo acceso indebido a un atacante externo.
- **Categoría:** Confidencialidad
- **Controles existentes:** ninguno específico (sin capacitación ni filtrado avanzado de correo)
- **Tratamiento:** Mitigar
- **Propietario:** RRHH

### R04 — Indisponibilidad del sistema de turnos y agenda de pacientes
- **Descripción:** el sistema de turnos deja de funcionar por un ataque que satura el servidor o por vencimiento de pagos de infraestructura, interrumpiendo la operación sin pérdida de datos.
- **Categoría:** Disponibilidad
- **Controles existentes:** ninguno específico de protección contra sobrecarga
- **Tratamiento:** Mitigar
- **Propietario:** Sistemas de la clínica

### R05 — Pérdida de backups por ausencia de redundancia externa
- **Descripción:** las copias de backup están en el mismo entorno físico/lógico que los datos originales, sin copia externa; una falla grave podría afectar a ambas a la vez.
- **Categoría:** Disponibilidad
- **Controles existentes:** backup periódico, sin redundancia externa
- **Tratamiento:** Mitigar
- **Propietario:** Sistemas de la clínica

### R06 — Compromiso de equipamiento médico conectado (IoT) como puerta de entrada
- **Descripción:** dispositivos médicos conectados (monitores, bombas de infusión) suelen tener seguridad más débil y son blanco de ataques automatizados/oportunistas; un dispositivo comprometido puede usarse para llegar a otros sistemas de la red.
- **Categoría:** Confidencialidad / Integridad
- **Controles existentes:** ninguno específico, sin segmentación de red
- **Tratamiento:** Mitigar
- **Propietario:** Jefe de Sistemas/TI

### R07 — Contraseñas débiles o reutilizadas
- **Descripción:** al no existir política de contraseñas obligatoria, los empleados pueden usar contraseñas fáciles de adivinar o reutilizadas de cuentas personales.
- **Categoría:** Confidencialidad
- **Controles existentes:** autenticación individual, sin política de complejidad ni expiración
- **Tratamiento:** Mitigar
- **Propietario:** Administrador de IT

## 9. Tratamiento y Riesgo Residual

| Riesgo | Estrategia | Salvaguardas propuestas | Tipo | Prob. resid. | Imp. resid. | Val. resid. | Nivel resid. |
|---|---|---|---|---|---|---|---|
| R01 | Mitigar | Control de acceso por rol/especialidad | Técnica | 1 | 4 | 4 | Bajo |
| R02 | Mitigar | Política de contraseñas obligatoria + MFA | Técnica/Admin | 1 | 4 | 4 | Bajo |
| R03 | Mitigar | Capacitación anti-phishing al personal | Administrativa | 1 | 3 | 3 | Bajo |
| R04 | Mitigar | Backup externo (3-2-1) acorta el tiempo de recuperación | Técnica | 2 | 2 | 4 | Bajo |
| R05 | Mitigar | Copia de backup externa/en la nube (regla 3-2-1) | Técnica | 1 | 2 | 2 | Bajo |
| R06 | Mitigar | Segmentación de red para dispositivos IoT | Técnica | 3 | 2 | 6 | Medio |
| R07 | Mitigar | Política de contraseñas obligatoria + MFA | Técnica/Admin | 2 | 4 | 8 | Medio |

## 10. Resumen de Resultados

### Distribución de riesgo inherente

| Nivel | Cantidad de riesgos |
|---|---|
| Crítico | 1 (R07) |
| Alto | 2 (R01, R06) |
| Medio | 4 (R02, R03, R04, R05) |
| Bajo | 0 |
| **Total** | **7** |

### Distribución de riesgo residual (tras aplicar salvaguardas)

| Nivel | Cantidad de riesgos |
|---|---|
| Crítico | 0 |
| Alto | 0 |
| Medio | 2 (R06, R07) |
| Bajo | 5 (R01, R02, R03, R04, R05) |
| **Total** | **7** |

La aplicación de las salvaguardas propuestas reduce significativamente la exposición general:
el riesgo Crítico (R07) desciende a nivel Medio, y ambos riesgos Altos (R01, R06) descienden a
Bajo y Medio respectivamente. Ningún riesgo permanece en nivel Alto o Crítico tras el
tratamiento propuesto.
## 11. Planes de acción

Se definieron 3 planes de acción para los riesgos de mayor nivel (Alto y Crítico), cargados en SimpleRisk mediante Risk Management → Plan Mitigation.

### Plan 1 — Control de acceso por rol/especialidad

| Campo | Valor |
|---|---|
| **Riesgo asociado** | R01 — Acceso indebido a historias clínicas (#1002) |
| **Estrategia** | Mitigar |
| **Solución actual** | Autenticación con usuario y contraseña individual, sin control de acceso diferenciado por rol o especialidad |
| **Requisitos de seguridad** | Implementar control de acceso basado en roles (RBAC), restringiendo la consulta de historias clínicas únicamente al personal médico/administrativo con necesidad de uso directa sobre cada paciente |
| **Recomendaciones** | Revisar periódicamente los permisos asignados y auditar accesos a historias clínicas para detectar consultas fuera del ámbito de la función del usuario |
| **Esfuerzo** | Minor |
| **Costo estimado** | $0 a $100.000 |
| **Fecha de vencimiento** | 05/10/2026 |
| **Responsable** | Jefe de Sistemas |
| **Estado inicial** | Mitigation Planned — 0% |

### Plan 2 — Segmentación de red para equipamiento IoT

| Campo | Valor |
|---|---|
| **Riesgo asociado** | R06 — Equipamiento médico conectado (IoT) como puerta de entrada (#1007) |
| **Estrategia** | Mitigar |
| **Solución actual** | Dispositivos médicos conectados a la misma red que el resto de los sistemas, sin segmentación |
| **Requisitos de seguridad** | Implementar segmentación de red (VLAN separada) para el equipamiento médico conectado, aislándolo de los sistemas críticos como historias clínicas y facturación |
| **Recomendaciones** | Evaluar la posibilidad de actualizar firmware de los dispositivos y establecer un inventario de equipamiento IoT conectado a la red |
| **Esfuerzo** | Significant |
| **Costo estimado** | $0 a $100.000 |
| **Fecha de vencimiento** | 20/10/2026 |
| **Responsable** | Jefe de Sistemas |
| **Estado inicial** | Mitigation Planned — 0% |

### Plan 3 — Política de contraseñas obligatoria + MFA

| Campo | Valor |
|---|---|
| **Riesgo asociado** | R07 — Contraseñas débiles o reutilizadas (#1008) |
| **Estrategia** | Mitigar |
| **Solución actual** | Autenticación individual con usuario y contraseña, sin política de complejidad ni expiración |
| **Requisitos de seguridad** | Implementar una política de contraseñas obligatoria (longitud mínima, complejidad, expiración periódica) y habilitar autenticación multifactor (MFA) para todos los usuarios del sistema |
| **Recomendaciones** | Priorizar la implementación por tratarse del riesgo de mayor nivel (Crítico); considerar el uso de un gestor de contraseñas corporativo |
| **Esfuerzo** | Considerable |
| **Costo estimado** | $0 a $100.000 |
| **Fecha de vencimiento** | 28/09/2026 |
| **Responsable** | Jefe de Sistemas / Administrador de IT |
| **Estado inicial** | Mitigation Planned — 0% |

## 12. Evidencias

Capturas en `informe/capturas/`:

- `04_riesgo_R01.png`: Risk Details de R01 — Acceso indebido a historias clínicas
- `05_riesgo_R02.png`: Risk Details de R02 — Filtración de datos de facturación y obras sociales
- `06_riesgo_R03.png`: Risk Details de R03 — Phishing al personal
- `07_riesgo_R04.png`: Risk Details de R04 — Indisponibilidad del sistema de turnos
- `08_riesgo_R05.png`: Risk Details de R05 — Pérdida de backups sin redundancia externa
- `09_riesgo_R06.png`: Risk Details de R06 — Equipamiento médico conectado (IoT) como puerta de entrada
- `10_riesgo_R07.png`: Risk Details de R07 — Contraseñas débiles o reutilizadas
- `11_plan_R01.png`: Mitigation Plan Details de R01
- `12_plan_R06.png`: Mitigation Plan Details de R06
- `13_plan_R07.png`: Mitigation Plan Details de R07 
