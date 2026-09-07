# Registro de Riesgos de la Clínica Privada

### Escala de Valoración (5x5)
* **Probabilidad (P):** 1 (Raro), 2 (Improbable), 3 (Posible), 4 (Probable), 5 (Casi seguro)
* **Impacto (I):** 1 (Insignificante), 2 (Menor), 3 (Moderado), 4 (Mayor), 5 (Catastrófico)
* **Nivel de Riesgo:** Bajo (1-4), Medio (5-9), Alto (10-15), Crítico (16-25)

---

### Tabla de Riesgos Identificados

| ID | Activo Afectado | Amenaza | Categoría | P | I | Val | Nivel | Controles Existentes | Estrategia | Propietario |
| :--- | :--- | :--- | :--- | :---: | :---: | :---: | :---: | :--- | :--- | :--- |
| **R01** | HCD / Sistema Médico | Phishing a personal administrativo para robo de credenciales | Confidencialidad / Integridad | 4 | 4 | **16** | **Crítico** | Filtro de correo básico | Mitigar (MFA + Capacitación) | Jefa de Admisión |
| **R02** | Servidor de Datos HCD | Infección por Ransomware e inoperatividad de historias clínicas | Disponibilidad / Operativo | 3 | 5 | **15** | **Alto** | Antivirus endpoint tradicional | Mitigar (EDR + Backups offline) | Dir. de Tecnología |
| **R03** | Terminales de Consultorios | Extracción no autorizada de datos de pacientes mediante USB | Confidencialidad / Legal | 4 | 3 | **12** | **Alto** | Políticas en papel | Mitigar (Bloqueo USB por GPO) | Oficial de Cumplimiento |
| **R04** | Servidores Centrales | Interrupción eléctrica prolongada por falla de UPS sin grupo electrógeno | Disponibilidad / Operativo | 2 | 4 | **8** | **Medio** | UPS individual de 15 min | Mitigar (Grupo electrógeno) | Jefe de Mantenimiento |
| **R05** | Base de Datos MySQL | Acceso no autorizado por credenciales por defecto en servidores | Confidencialidad / Integridad | 2 | 5 | **10** | **Alto** | Firewall perimetral | Mitigar (Hardening DB) | Admin. de Base de Datos |
| **R06** | Copias de Seguridad | Imposibilidad de restauración por corrupción de backups no verificados | Disponibilidad / Integridad | 3 | 4 | **12** | **Alto** | Backups diarios automáticos | Mitigar (Pruebas trimestrales) | Dir. de Tecnología |
| **R07** | Infraestructura Data Center | Fuga de agua o incendio por ubicación física inadecuada (bajo cocina/pileta) | Disponibilidad / Físico | 2 | 5 | **10** | **Alto** | Detección básica de humo | Mitigar (Relocalización de servidor) | Gerente Operativo |
