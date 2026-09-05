# Matriz e Inventario de Riesgos - Clínica Privada

### Riesgo 1: Compromiso de credenciales del sistema de Historias Clínicas Digitales (HCD) por Phishing
* **Categoría:** Confidencialidad / Integridad[cite: 5, 6]
* **Activos afectados:** Sistema de HCD, Servidor Web, Credenciales de médicos[cite: 5, 6]
* **Probabilidad:** 4 (Probable)[cite: 5, 6]
* **Impacto:** 5 (Catastrófico)[cite: 5, 6]
* **Nivel de Riesgo:** 20 (Crítico)[cite: 2, 3]
* **Controles Existentes:** Filtro de correo básico sin autenticación multifactor (MFA)[cite: 5, 6]
* **Tratamiento:** Mitigar (Implementar MFA obligatorio y capacitación)[cite: 5, 6]
* **Propietario:** CISO / Jefe de Sistemas[cite: 5, 6]

---

### Riesgo 2: Infección por Ransomware en el servidor de almacenamiento de imágenes médicas
* **Categoría:** Disponibilidad / Operativo[cite: 5, 6]
* **Activos afectados:** Servidor NAS, Sistema PACS/DICOM[cite: 5, 6]
* **Probabilidad:** 4 (Probable)[cite: 5, 6]
* **Impacto:** 5 (Catastrófico)[cite: 5, 6]
* **Nivel de Riesgo:** 20 (Crítico)[cite: 2, 3]
* **Controles Existentes:** Antivirus básico en endpoints, respaldos semanales[cite: 5, 6]
* **Tratamiento:** Mitigar (Segregación de red, respaldos inmutables e EDR)[cite: 5, 6]
* **Propietario:** Administrador de Infraestructura[cite: 5, 6]

---

### Riesgo 3: Interrupción de la atención por falla en la infraestructura eléctrica sin respaldo UPS
* **Categoría:** Disponibilidad[cite: 5, 6]
* **Activos afectados:** Servidores locales, Switches, Terminales de consultorios[cite: 5, 6]
* **Probabilidad:** 3 (Posible)[cite: 5, 6]
* **Impacto:** 4 (Mayor)[cite: 5, 6]
* **Nivel de Riesgo:** 12 (Alto)[cite: 2, 3]
* **Controles Existentes:** UPS individual solo en el rack principal[cite: 5, 6]
* **Tratamiento:** Mitigar (Grupo electrógeno automatizado)[cite: 5, 6]
* **Propietario:** Encargado de Mantenimiento[cite: 5, 6]

---

### Riesgo 4: Fuga de datos de facturación y Obras Sociales por transmisión no cifrada
* **Categoría:** Legal / Confidencialidad[cite: 5, 6]
* **Activos afectados:** Base de datos de Facturación, Canales de red externos[cite: 5, 6]
* **Probabilidad:** 3 (Posible)[cite: 5, 6]
* **Impacto:** 4 (Mayor)[cite: 5, 6]
* **Nivel de Riesgo:** 12 (Alto)[cite: 2, 3]
* **Controles Existentes:** Validación de archivos por clave hash[cite: 5, 6]
* **Tratamiento:** Mitigar (Forzar canal SFTP/HTTPS cifrado)[cite: 5, 6]
* **Propietario:** Responsable de Facturación[cite: 5, 6]

---

### Riesgo 5: Acceso físico no autorizado al Data Center de la clínica
* **Categoría:** Confidencialidad / Disponibilidad[cite: 5, 6]
* **Activos afectados:** Racks de servidores, Routers, Cableado estructurado[cite: 5, 6]
* **Probabilidad:** 2 (Improbable)[cite: 5, 6]
* **Impacto:** 4 (Mayor)[cite: 5, 6]
* **Nivel de Riesgo:** 8 (Medio)[cite: 2, 3]
* **Controles Existentes:** Llave física asignada al personal de guardia[cite: 5, 6]
* **Tratamiento:** Mitigar (Control de acceso biométrico y CCTV)[cite: 5, 6]
* **Propietario:** Jefe de Seguridad Física[cite: 5, 6]

---

### Riesgo 6: Alteración indebida de HCD por sesiones dejadas abiertas en consultorios
* **Categoría:** Integridad[cite: 5, 6]
* **Activos afectados:** Sistema de HCD, Terminales de médicos[cite: 5, 6]
* **Probabilidad:** 4 (Probable)[cite: 5, 6]
* **Impacto:** 2 (Menor)[cite: 5, 6]
* **Nivel de Riesgo:** 8 (Medio)[cite: 2, 3]
* **Controles Existentes:** Cierre de sesión manual[cite: 5, 6]
* **Tratamiento:** Mitigar (Bloqueo automático por inactividad)[cite: 5, 6]
* **Propietario:** Director Médico[cite: 5, 6]

---

### Riesgo 7: Desecho inseguro de reportes médicos o fichas en papel
* **Categoría:** Legal / Confidencialidad[cite: 5, 6]
* **Activos afectados:** Impresiones de fichas médicas, Documentación en papel[cite: 5, 6]
* **Probabilidad:** 3 (Posible)[cite: 5, 6]
* **Impacto:** 3 (Moderado)[cite: 5, 6]
* **Nivel de Riesgo:** 9 (Medio)[cite: 2, 3]
* **Controles Existentes:** Ninguno[cite: 5, 6]
* **Tratamiento:** Mitigar (Servicio de triturado seguro y política de escritorio limpio)[cite: 5, 6]
* **Propietario:** Oficial de Cumplimiento[cite: 5, 6]
