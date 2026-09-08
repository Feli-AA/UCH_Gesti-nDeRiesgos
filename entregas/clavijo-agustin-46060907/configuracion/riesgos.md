# Registro de Riesgos 

Los siguientes 7 riesgos fueron identificados para el escenario de la clínica privada (120 empleados, 800 pacientes/día, historias clínicas digitales, datos de obras sociales y facturación), a partir de la auditoría externa reciente que detectó debilidades en la seguridad de la información.

## Resumen

| ID | Riesgo | Categoría | Probabilidad | Impacto | Score | Nivel |
|---|---|---|---|---|---|---|
| 1002 | Acceso indebido a historias clínicas digitales | Gestión de acceso | Probable | Extremo/Catastrófico | 8 | Muy Alto |
| 1004 | Filtración de datos por proveedor externo de facturación | Gestión de terceros | Creíble | Importante | 4.8 | Alto |
| 1005 | Phishing dirigido a personal administrativo | Gestión de acceso | Probable | Moderado | 4.8 | Alto |
| 1007 | Incumplimiento de normativa de protección de datos de salud | Política y procedimiento | Creíble | Importante | 4.8 | Alto |
| 1008 | Pérdida de datos por falla en el proceso de backups | Resiliencia ambiental | Improbable | Extremo/Catastrófico | 4 | Alto |
| 1003 | Caída prolongada del servidor de historias clínicas | Gestión de vulnerabilidades técnicas | Improbable | Importante | 3.2 | Medio |
| 1006 | Acceso físico no autorizado al data center | Seguridad física | Improbable | Importante | 3.2 | Medio |

## Detalle por riesgo

### 1002 - Acceso indebido a historias clínicas digitales
- **Descripción:** el personal administrativo cuenta con acceso a historias clínicas de pacientes que no forman parte de sus funciones, debido a que el sistema no diferencia permisos por rol.
- **Activos afectados:** servidor de historias clínicas, base de datos de pacientes
- **Fuente de riesgo:** Gente
- **Mapeo de riesgo:** R-AC-4 - Acceso no autorizado
- **Mapeo de amenaza:** MT-2 - Piratería informática y otros delitos cibernéticos
- **Controles existentes:** login con usuario/contraseña individual, sin roles diferenciados
- **Dueño:** Analista de Riesgos

### 1004 - Filtración de datos por proveedor externo de facturación
- **Descripción:** la empresa externa que gestiona la facturación y los datos de obras sociales podría sufrir una brecha de seguridad, exponiendo datos de pacientes fuera del control directo de la clínica.
- **Activos afectados:** datos de facturación, datos de obra social
- **Fuente de riesgo:** Externo
- **Mapeo de riesgo:** R-GV-5 - Prácticas inadecuadas de terceros
- **Mapeo de amenaza:** MT-2 - Piratería informática y otros delitos cibernéticos
- **Controles existentes:** contrato de servicio sin cláusulas específicas de seguridad
- **Dueño:** Analista de Riesgos

### 1005 - Phishing dirigido a personal administrativo
- **Descripción:** un empleado del área administrativa podría recibir un correo fraudulento y entregar sus credenciales, permitiendo un acceso no autorizado a los sistemas internos.
- **Activos afectados:** credenciales de usuario, correo corporativo, sistemas internos
- **Fuente de riesgo:** Gente
- **Mapeo de riesgo:** R-AC-4 - Acceso no autorizado
- **Mapeo de amenaza:** MT-2 - Piratería informática y otros delitos cibernéticos
- **Controles existentes:** ninguna capacitación formal en seguridad
- **Dueño:** Analista de Riesgos

### 1007 - Incumplimiento de normativa de protección de datos de salud
- **Descripción:** la clínica no tiene políticas escritas sobre el manejo de datos de salud, algo que la auditoría externa ya señaló como debilidad.
- **Activos afectados:** todos los datos de pacientes, reputación institucional
- **Fuente de riesgo:** Proceso
- **Mapeo de riesgo:** R-GV-4 - Prácticas internas inadecuadas
- **Mapeo de amenaza:** MT-2 - Piratería informática y otros delitos cibernéticos (ver nota de justificación abajo)
- **Controles existentes:** ninguna política formal documentada
- **Dueño:** Analista de Riesgos
- **Nota:** se asoció MT-2 porque la ausencia de políticas documentadas aumenta la probabilidad e impacto de un eventual incidente cibernético, aunque el riesgo en sí es de naturaleza normativa/organizacional.

### 1008 - Pérdida de datos por falla en el proceso de backups
- **Descripción:** se realizan backups diarios de la base de datos de pacientes, pero nunca se comprobó si permiten una restauración completa en caso de que el servidor principal falle.
- **Activos afectados:** base de datos de pacientes, historial médico
- **Fuente de riesgo:** Proceso
- **Mapeo de riesgo:** R-BC-2 - Pérdida/corrupción de datos
- **Mapeo de amenaza:** MT-2 - Piratería informática y otros delitos cibernéticos (ver nota de justificación abajo)
- **Controles existentes:** backup automático diario, sin pruebas de restauración
- **Dueño:** Analista de Riesgos
- **Nota:** se relacionó con MT-2 porque, ante un ataque cibernético como un ransomware, es cuando realmente se pone a prueba si los backups sirven o no.

### 1003 - Caída prolongada del servidor de historias clínicas
- **Descripción:** una falla de hardware o software en el servidor de historias clínicas dejaría al personal médico sin acceso al historial de los pacientes durante la atención, ya que no existe un equipo de respaldo.
- **Activos afectados:** servidor de HC, red interna
- **Fuente de riesgo:** Sistema
- **Mapeo de riesgo:** R-BC-1 - Interrupción de la actividad comercial
- **Mapeo de amenaza:** MT-7 - Interrupción del servicio público (ver nota de justificación abajo)
- **Controles existentes:** ninguno (punto único de falla)
- **Dueño:** Analista de Riesgos
- **Nota:** se eligió MT-7 porque un corte de energía o de conectividad es de las causas más comunes de caída de un servidor, aunque también puede deberse a una falla interna de hardware sin relación con servicios públicos.

### 1006 - Acceso físico no autorizado al data center
- **Descripción:** la sala de servidores no cuenta con un control de acceso propio, por lo que personal externo o de limpieza puede ingresar sin registro alguno.
- **Activos afectados:** servidores físicos, equipamiento de red
- **Fuente de riesgo:** Proceso
- **Mapeo de riesgo:** R-AM-1 - Bienes perdidos, dañados o robados
- **Mapeo de amenaza:** MT-5 - Delitos físicos
- **Controles existentes:** puerta con llave común, sin registro de acceso
- **Dueño:** Analista de Riesgos

## Riesgo excluido del análisis

**#1001 - Riesgo de prueba - validación del sistema:** utilizado únicamente para validar la instalación de SimpleRisk (carga, categorización y puntuación de un riesgo). No representa un riesgo real de la clínica. Fue cerrado con motivo "Rechazado".