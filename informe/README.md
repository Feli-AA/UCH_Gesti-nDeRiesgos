# Informe de Gestión de Riesgos - SimpleRisk

**Alumno:** Ignacio De Paz  
**Legajo:** 123456  
**Proyecto:** girasol  

---

## 1. Contexto Operativo
El presente trabajo analiza la gestión de riesgos en una clínica médica que cuenta con **120 empleados** y administra **800 Historias Clínicas Digitales (HCD)** de pacientes. Para la implementación del Sistema de Gestión de Seguridad de la Información (SGSI), se desplegó SimpleRisk mediante Docker.

## 2. Gestión de Usuarios y Roles
Se crearon perfiles para delimitar responsabilidades:
* **María Gómez:** Analista de Riesgos.
* **Carlos López:** Auditor de Seguridad.
* **Juan Pérez / Ignacio De Paz:** Administradores.

*(Evidencia: `capturas/01-usuarios.png`)*

## 3. Identificación del Riesgo Principal
Se registró el riesgo **"Compromiso de credenciales de HCD por Phishing"** sobre el activo **Servidor HCD**, asignando un impacto *Extreme/Catastrophic* y probabilidad *Likely*.

### Metáfora N° 1: El Lobo y Caperucita
El atacante actúa como el *Lobo Feroz*, disfrazando correos maliciosos para engañar a los empleados (*Caperucita*) y obtener credenciales de acceso a las 800 HCD.

*(Evidencia: `capturas/02-riesgo-creado.png`)*

## 4. Matriz de Riesgos y Dashboard
La evaluación consolidada posiciona el riesgo en nivel **High (8)** dentro del mapa de calor del Dashboard, contabilizando **OPEN RISKS: 1**.

*(Evidencia: `capturas/03-matriz.png`)*

## 5. Plan de Mitigación
Se definió la estrategia **Mitigate** con la implementación de autenticación de doble factor (MFA) para el acceso a HCD y capacitaciones anti-phishing.

### Metáfora N° 2: Los Tres Cerditos
* **Casa de Paja:** Defensa débil basada únicamente en contraseñas simples.
* **Casa de Madera:** Defensa intermedia con contraseñas complejas y antivirus.
* **Casa de Ladrillo:** Defensa robusta mediante Autenticación de Doble Factor (MFA) y concientización continua al personal.

*(Evidencia: `capturas/04-planes-accion.png`)*
