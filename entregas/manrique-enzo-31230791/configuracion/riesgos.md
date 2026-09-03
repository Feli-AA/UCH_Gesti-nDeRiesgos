# Registro de Riesgos (Parte B)

A continuación se definen los 7 riesgos específicos para la clínica privada 

---

### Riesgo 1: Infección por Ransomware en Servidores Centrales
* **ID en SimpleRisk:** 1002
* **Categoría:** Disponibilidad
* **Activos Afectados:** Servidores centrales, Historias Clínicas
* **Probabilidad (1-5) y Justificación:** 4 (Probable). El sector salud es un objetivo de alto valor para grupos de cibercriminales y la infraestructura actual carece de defensas proactivas contra amenazas modernas, dependiendo únicamente de un antivirus tradicional.
* **Impacto (1-5) y Justificación:** 5 (Catastrófico). El secuestro y cifrado de los servidores paraliza totalmente la atención de los 800 pacientes diarios, bloquea el acceso a historiales médicos críticos y frena por completo la facturación de la clínica.
* **Nivel Resultante:** Crítico (Valor: 20)
* **Controles Existentes:** Antivirus básico basado en firmas. No existen copias de seguridad inmutables ni aisladas de la red local.
* **Plan de Tratamiento:** Mitigar (EDR + Backups inmutables)
* **Propietario:** Directorio

---

### Riesgo 2: Acceso no autorizado por compromiso de credenciales
* **ID en SimpleRisk:** 1003
* **Categoría:** Confidencialidad
* **Activos Afectados:** Portal Web de Médicos, Base de Datos de Pacientes
* **Probabilidad (1-5) y Justificación:** 4 (Probable). Los ataques de phishing y la reutilización de contraseñas son extremadamente comunes. Al estar el portal expuesto a internet con autenticación simple, la obtención de credenciales de un médico es altamente factible.
* **Impacto (1-5) y Justificación:** 3 (Moderado). Permite a un atacante visualizar, alterar o descargar historias clínicas, lo que constituye una brecha de privacidad y expone a la clínica a multas y daño reputacional.
* **Nivel Resultante:** Alto (Valor: 12)
* **Controles Existentes:** Autenticación de un solo factor (únicamente usuario y contraseña) sin políticas de bloqueo por múltiples intentos fallidos.
* **Plan de Tratamiento:** Mitigar (Implementación obligatoria de Autenticación Multifactor / TOTP).
* **Propietario:** Seguridad Informática / Infraestructura IT

---

### Riesgo 3: Compromiso de la red interna por falta de controles perimetrales
* **ID en SimpleRisk:** 1004
* **Categoría:** Confidencialidad / Integridad
* **Activos Afectados:** Red Perimetral, Servidor de Historias Clínicas
* **Probabilidad (1-5) y Justificación:** 3 (Posible). Sin un IPS (Sistema de Prevención de Intrusiones) activo, los escaneos automatizados y ataques de red desde internet alcanzan directamente los equipos internos sin ningún filtro.
* **Impacto (1-5) y Justificación:** 4 (Mayor). Un atacante que logre acceso a la red interna puede pivotar hacia equipos de diagnóstico médico y bases de datos, alterando operaciones críticas.
* **Nivel Resultante:** Alto (Valor: 12)
* **Controles Existentes:** Router provisto por el ISP (Proveedor de Internet) con configuración por defecto, sin segmentación de red.
* **Plan de Tratamiento:** Mitigar (Implementación de Firewall NGFW perimetral y segmentación por VLANs).
* **Propietario:** Infraestructura IT
---

### Riesgo 4: Exposición de datos por Inyección SQL en el portal de pacientes
* **ID en SimpleRisk:** 1005
* **Categoría:** Confidencialidad
* **Activos Afectados:** Portal Web de Médicos, Base de Datos de Pacientes
* **Probabilidad (1-5) y Justificación:** 3 (Posible). Los formularios web expuestos al exterior son sondeados de manera constante por bots automatizados buscando vulnerabilidades de inyección.
* **Impacto (1-5) y Justificación:** 5 (Catastrófico). Un ataque exitoso permite la exfiltración masiva, alteración o eliminación total de las historias clínicas de la base de datos.
* **Nivel Resultante:** Crítico (Valor: 15)
* **Controles Existentes:** Código backend heredado (legacy) que concatena entradas del usuario directamente en la base de datos sin sanitización.
* **Plan de Tratamiento:** Mitigar (Refactorización del código con Prepared Statements y despliegue de un WAF).
* **Propietario:** Líder de Desarrollo

---

### Riesgo 5: Acceso interno indebido a historias clínicas por exceso de privilegios
* **ID en SimpleRisk:** 1006
* **Categoría:** Confidencialidad
* **Activos Afectados:** Base de Datos de Pacientes
* **Probabilidad (1-5) y Justificación:** 2 (Improbable). Aunque los empleados tienen acuerdos de confidencialidad, el exceso de permisos facilita accesos por curiosidad o error humano a registros médicos no asignados.
* **Impacto (1-5) y Justificación:** 3 (Moderado). Compromete la privacidad individual de ciertos pacientes, lo cual genera un impacto reputacional y posibles multas normativas aisladas.
* **Nivel Resultante:** Medio (Valor: 6)
* **Controles Existentes:** Autenticación básica en el sistema interno, pero todos los médicos tienen acceso global a todos los pacientes, no solo a los propios.
* **Plan de Tratamiento:** Aceptar temporalmente o Mitigar (Auditoría de roles y restricción de vistas a pacientes asignados).
* **Propietario:** Administrador DBA
---

### Riesgo 6: Pérdida definitiva de historias clínicas ante un desastre físico
* **ID en SimpleRisk:** 1007
* **Categoría:** Disponibilidad
* **Activos Afectados:** Servidor de Historias Clínicas, Base de Datos de Pacientes
* **Probabilidad (1-5) y Justificación:** 2 (Improbable). Si bien un desastre ambiental (incendio, inundación) o una falla eléctrica masiva no ocurren con frecuencia, la probabilidad no es nula.
* **Impacto (1-5) y Justificación:** 5 (Catastrófico). Al estar los backups en la misma ubicación física, un siniestro destruiría tanto los datos de producción como los de respaldo, resultando en la pérdida total del historial de la clínica.
* **Nivel Resultante:** Alto (Valor: 10)
* **Controles Existentes:** Copias de seguridad locales almacenadas en la misma sala de servidores (sin política off-site).
* **Plan de Tratamiento:** Mitigar (Implementar esquema de backups 3-2-1 con almacenamiento inmutable en la nube).
* **Propietario:** Infraestructura IT

---

### Riesgo 7: Robo físico de notebooks en consultorios médicos
* **ID en SimpleRisk:** 1008
* **Categoría:** Confidencialidad
* **Activos Afectados:** Notebooks
* **Probabilidad (1-5) y Justificación:** 3 (Posible). Los consultorios tienen un alto tránsito diario de pacientes y terceros. El hurto de un equipo portátil o el acceso a una sesión desbloqueada en un descuido es un escenario común.
* **Impacto (1-5) y Justificación:** 2 (Menor). El impacto se limita al costo de reposición del hardware y a la potencial exposición de los datos de los pacientes que el médico estaba atendiendo en ese momento, sin comprometer la totalidad de la base de datos.
* **Nivel Resultante:** Medio (Valor: 6)
* **Controles Existentes:** Cámaras de seguridad en pasillos comunes, pero sin restricciones físicas sobre los equipos ni políticas de bloqueo de pantalla automáticas.
* **Plan de Tratamiento:** Mitigar (Uso de candados físicos Kensington, cifrado de disco completo con BitLocker y política de bloqueo automático de sesión tras 5 minutos de inactividad).
* **Propietario:** Médicos de Guardia / Seguridad Informática

