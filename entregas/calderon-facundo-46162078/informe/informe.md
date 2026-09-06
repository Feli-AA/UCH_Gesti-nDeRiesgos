# Informe — TP: Gestión de Riesgos con SimpleRisk

**Alumno:** Facundo Calderón
**DNI:** 46162078

---

## Parte A — Instalación y Configuración Básica

### A.1 Instalación reproducible

El entorno de trabajo utilizado fue **Windows 11**, mientras que la guía original
estaba orientada a Linux. Se verificó que los comandos de Docker son multiplataforma y no
requieren adaptación funcional, solo la instalación previa de **Docker Desktop** (con backend
WSL2)

**Pasos realizados:**

1. Habilitación de WSL2:
   ```
   wsl --install
   ```
2. Instalación de Docker Desktop para Windows (arquitectura AMD64), con instalación
   **"Per-user"** (recomendada, usa backend WSL2 y no requiere privilegios de administrador
   constantes).
3. Verificación de la instalación:
   ```
   docker run hello-world
   ```
   Resultado: mensaje de bienvenida de Docker confirmando que el daemon está corriendo
   correctamente
4. Descarga de la imagen de SimpleRisk:
   ```
   docker pull simplerisk/simplerisk
   ```
5. Levantamiento del contenedor:
   ```
   docker run --name simplerisk -d -p 80:80 -p 443:443 simplerisk/simplerisk
   ```
6. Acceso a la instancia desde `https://localhost/`. El navegador marcó la conexión como no
   segura por tratarse de un certificado autofirmado; se aceptó la excepción para continuar

A diferencia de lo indicado en versiones anteriores de la documentación de SimpleRisk, esta
versión **no incluye un usuario `admin/admin` precargado**. En su lugar, el primer acceso
presenta un formulario de **"Default Admin Account Creation"**, donde se definió la cuenta administradora inicial

La instalación completa quedó automatizada en `entorno/docker-compose.yml` y `entorno/setup.sh`

### A.2 Usuarios y permisos

Se crearon 3 usuarios con roles diferenciados, aplicando el principio de **separación de
funciones** (segregation of duties):

Usuario: `admin_demo`
Full name: Administrador
Rol: Administrador / Responsable de Seguridad
Permisos principales: Acceso total (Grant Admin)

Usuario: `analista_riesgos`
Full name: Analista de Riesgos
Rol: Analista de Riesgos
Permisos principales: Submit New Risk, Modify Risk Details, Plan Mitigations, Review Insignificant/Low/Medium Risks, Add Projects

Usuario: `auditor_demo`
Full name: Auditor Interno
Rol: Auditor
Permisos principales: Review (todos los niveles), Initiate Audits, Comment Compliance

**Jerarquía (Manager):** `admin_demo` sin manager asignado; `analista_riesgos` y `auditor_demo`
reportan a `admin_demo`

**Configuración adicional:** se habilitó "Require password change on login" para los usuarios
`analista_riesgos` y `auditor_demo`, simulando buena práctica de primer acceso. Se dejó
deshabilitado el Multi-Factor Authentication por simplicidad del entorno de prueba —lo cual se
señala como una oportunidad de mejora en las recomendaciones del Reporte Ejecutivo

El detalle completo de usuarios está documentado en `configuracion/usuarios.md` (sin
contraseñas, conforme a las reglas de manejo seguro de información)

### A.3 Primer riesgo de prueba

Se creó un riesgo de prueba para validar el funcionamiento del sistema tras la instalación:

- **Subject:** "Riesgo de prueba - Validación del sistema"
- **Categoría:** Monitoring
- **Risk Source:** System
- **Likelihood:** Unlikely
- **Impact:** Insignificant
- **Resultado:** el riesgo se registró correctamente y apareció en el listado de **View Risks**
  con su nivel calculado automáticamente (0.8 — Bajo), confirmando que la instalación y la
  configuración de usuarios funcionan de punta a punta

---

## Parte B — Escenario Real

### Contexto

Clínica privada de 120 empleados que atiende 800 pacientes por día, con historias clínicas
digitales, datos de obras sociales y facturación. Una auditoría externa reciente identificó
debilidades en su gestión de riesgos

### B.1 Inventario de activos considerados

| ID  | Activo                                           | Tipo                 |
|-----|--------------------------------------------------|----------------------|
| A01 | Sistema de Historias Clínicas Electrónicas (HCE) | Software/Información |
| A02 | Base de datos de pacientes                       | Información          |
| A03 | Sistema de facturación y obras sociales          | Software             |
| A04 | Servidor local / Data center de la clínica       | Hardware             |
| A05 | Red interna                                      | Red                  |
| A06 | Estaciones de trabajo                            | Hardware             |
| A07 | Personal administrativo y médico                 | Humano               |
| A08 | Backups de la base de datos                      | Información          |

### B.2 Registro de riesgos

Se relevaron **7 riesgos específicos** del contexto de la clínica. El detalle completo de cada
uno (descripción, categoría, activos afectados, probabilidad e impacto justificados, controles
existentes, plan de tratamiento y propietario) está documentado en
`configuracion/riesgos.md`. Resumen:

| ID  | Riesgo                                          | Categoría                          | Nivel       | Propietario              |
|-----|-------------------------------------------------|------------------------------------|-------------|--------------------------|
| R01 | Ransomware sobre servidor HCE                   | Technical Vulnerability Management | 6.4 — Alto  | Responsable de Seguridad |
| R02 | Phishing al personal administrativo             | Access Management                  | 4.8 — Alto  | Analista de Riesgos      |
| R03 | Cuentas de ex-empleados no dadas de baja        | Access Management                  | 3.6 — Medio | Responsable de Seguridad |
| R04 | Exposición de HC por BD mal configurada         | Sensitive Data Management          | 4.0 — Alto  | Responsable de Seguridad |
| R05 | Corte de energía sin respaldo                   | Environmental Resilience           | 3.6 — Medio | Responsable de Seguridad |
| R06 | Robo o pérdida de equipo con datos de pacientes | Physical Security                  | 3.2 — Medio | Analista de Riesgos      |
| R07 | Dependencia crítica de proveedor externo        | Third-Party Management             | 3.6 — Medio | Responsable de Seguridad |

**Nota metodológica:** las categorías utilizadas son las que provee SimpleRisk por defecto
(basadas en un framework tipo NIST/CIS), en lugar de las cinco categorías genéricas sugeridas en
el enunciado (confidencialidad/integridad/disponibilidad/legal/operativo). Se optó por respetar
las categorías nativas de la herramienta y mapearlas conceptualmente: por ejemplo, R04
(confidencialidad) corresponde a "Sensitive Data Management", y R01/R05 (disponibilidad)
corresponden a "Technical Vulnerability Management" y "Environmental Resilience"
respectivamente

### B.3 Planes de acción (riesgos de nivel Alto)

Se definieron 3 planes de acción, uno por cada riesgo de nivel Alto:

| Plan                             | Riesgo asociado | Responsable      | Presupuesto estimado | Plazo   | Estado inicial |
|----------------------------------|-----------------|------------------|----------------------|---------|----------------|
| Backups aislados y EDR           | R01             | admin_demo       | $700.000–800.000     | 60 días | Planificado    |
| Capacitación anti-phishing + MFA | R02             | analista_riesgos | $100.000–200.000     | 45 días | Planificado    |
| Auditoría y hardening de BD      | R04             | admin_demo       | $200.000–300.000     | 30 días | Planificado    |

Cada plan se cargó en SimpleRisk vinculado a su riesgo correspondiente (**Risk Management ->
Plan Mitigation**), incluyendo estrategia de tratamiento ("Mitigate" en los 3 casos), esfuerzo de
mitigación, costo estimado, propietario y una descripción de la solución actual y los requisitos
de seguridad a implementar

### B.4 Reporte Ejecutivo

Se generó un Reporte Ejecutivo en PDF dirigido al Directorio
de la clínica, disponible en `reporte-ejecutivo/reporte.pdf`, con la siguiente estructura:

- Resumen ejecutivo del proceso de gestión de riesgos implementado
- Top 5 riesgos por nivel (R01, R02, R04, R03, R05), con sus valores reales extraídos de
  SimpleRisk (Dynamic Risk Report)
- Estado de los 3 planes de acción definidos
- 5 recomendaciones prioritarias: MFA obligatorio, proceso formal de baja de usuarios, backups
  aislados y verificados, cifrado en reposo de la base de datos, y cláusulas de seguridad con
  proveedores externos

El reporte se elaboró de forma independiente (no con el exportador nativo de SimpleRisk),
tomando como fuente de datos la tabla del **Dynamic Risk Report** de la herramienta, para poder
redactar contenido narrativo en lenguaje ejecutivo apropiado para el Directorio

---

## Parte C — Análisis Crítico y Profundización

### C.1 Comparación metodológica: SimpleRisk vs. ISO/IEC 27005

**Enfoque de SimpleRisk.** Implementa una matríz clasica de *Probabilidad × Impacto*, con escalas
fijas de 1 a 5 en cada eje, cuyo producto determina automaticamente el nivel del riesgo (Bajo/Medio/Alto/Crítico). 
El proceso queda embebido en la herramienta: cargar el riesgo, asignarle una puntuación, y el sistema clasifica 
y prioriza por vos

**Enfoque de ISO/IEC 27005.** A diferencia de la 27001, la 27005 no es certificable y funciona
como una guia metodológica pasos a paso para que una organización pueda cumplir con los requisitos de
evaluación y tratamiento de riesgos que si exige la 27001 para certificarse. Es decir, la 27005 le da el "como" a la 27001.
Esto marca una diferencia de naturaleza frente a SimpleRisk: uno es una herramienta de software 
con una metodología fija incorporada, el otro es un marco normativo de referencia que no impone 
una fórmula de cálculo específica, sino un proceso ordenado 
(identificar amenazas y vulnerabilidades -> valorar y priorizar -> decidir tratamiento -> optimizar presupuesto en base a eso -> monitoreo continuo)

**Sobre el tratamiento del riesgo**, ambos enfoques terminan convergiendo en las mismas 
4 opciones (Mitigar, Aceptar, Evitar, Transferir). La diferencia no está en las opciones disponibles, 
sino en que tan formalizda y documentada tiene que estar la decisión: en SimpleRisk simplemente seleccionas 
una estrategia en un campo del formulario; en 27005, esa decisión debería estar respaldada por un analisis
costo-beneficio explícito y, en muchos casos, aprobada formalmente por la direccion antes de ejecutarse

**Ventajas y desventajas:**

| Aspecto                     | SimpleRisk                                   | ISO/IEC 27005                                                            |
|-----------------------------|----------------------------------------------|--------------------------------------------------------------------------|
| Naturaleza                  | Herramienta de software con metodología fija | Guía normativa, agnóstica del metodo de calculo                          |
| Certificable                | No                                           | No (pero habilita la certificación en 27001)                             |
| Optimización de presupuesto | Implícita — se ve que riesgo pesa más        | Explícita — es uno de los objetivos declarados del estándar              |
| Mejora continua             | Depende el uso que le dé el usuario          | Es un requisito formal del propio ciclo (monitoreo y revisión periódica) |
| Velocidad de implementación | Alta                                         | Baja — requiere definir criterios organizacionales antes de empezar      |

**¿Cuándo conviene cada una?** Para la clínica de este escenario —que recien esta 
formalizando su gestión de riesgos tras la auditoría— SimpleRisk resuelve la necesidad inmediata
de tener un registro ordenado y priorizado. Pero si en el futuro la clínica quisiera certificarse bajo ISO 27001,
va a necesitar adoptar el proceso que describe la 27005 como base metodológica formal,
usando probablemente SimpleRisk (o una herramienta similar) como el soporte operativo de ese proceso, no como reemplazo del mismo

### C.2 Integración con herramienta externa: Jira

**Que es.** Jira es una herramienta digital de gestion de proyectos y seguimiento de incidencias y desarrollo ágil

**Objetivo.** Actualmente, un riesgo de nivel Alto identificado en SimpleRisk depende de que
alguien revise manualmente la plataforma para accionar. Integrar SimpleRisk con **Jira** permite
que su creación genere automáticamente un ticket de seguimiento en el tablero del equipo de
IT/Seguridad, con trazabilidad, asignación de responsable y flujo de trabajo propio (To Do → In
Progress → Done)

**Cómo funcionaría.** SimpleRisk expone una API REST (habilitable en Configure → API Settings,
con generación de API Key/Secret) para consultar riesgos y planes de mitigación. Jira expone su
propia API REST (`/rest/api/2/issue`) para crear tickets mediante `POST` autenticado. Un script
intermediario en Python podría:

1. Consultar periódicamente los riesgos con nivel "Alto" o "Crítico" vía la API de SimpleRisk
2. Por cada riesgo nuevo o modificado que cumpla esa condición, armar un payload y enviarlo a la
   API de Jira para crear un ticket
3. Mapear el nivel de riesgo a la prioridad de Jira (Alto → High, Crítico → Highest) y el
   propietario del riesgo al campo `assignee` del ticket

**Ejemplo simplificado del payload hacia Jira:**

```python
import requests
from requests.auth import HTTPBasicAuth

jira_url = "https://tu-dominio.atlassian.net/rest/api/2/issue"
auth = HTTPBasicAuth("tu-email@dominio.com", "API_TOKEN_FICTICIO")

payload = {
    "fields": {
        "project": {"key": "SEC"},
        "summary": "[SimpleRisk] Ransomware sobre servidor de Historias Clínicas Electrónicas",
        "description": "Riesgo de nivel Alto (6.4) detectado en SimpleRisk. "
                        "Ver detalle y plan de mitigación en la plataforma.",
        "issuetype": {"name": "Task"},
        "priority": {"name": "High"},
        "labels": ["simplerisk", "riesgo-alto"]
    }
}

headers = {"Content-Type": "application/json"}
response = requests.post(jira_url, json=payload, headers=headers, auth=auth)
print(response.status_code, response.text)
```

Las credenciales del ejemplo son ficticias; en un entorno real, el token de Jira se gestionaría
como variable de entorno (`.env`, excluida del repositorio por el `.gitignore`) y nunca se
subiría al código fuente

**Valor de la integración.** Cierra el círculo entre la identificación del riesgo (SimpleRisk) y
su tratamiento operativo (Jira), evitando que un riesgo de nivel Alto quede únicamente dentro de
la plataforma de gestión de riesgos sin reflejarse en el flujo de trabajo habitual del equipo
técnico

---

## Conclusiones

El desarrollo de este TP permitió aplicar de punta a punta un ciclo de gestión de riesgos sobre
un escenario realista: desde la instalación de la herramienta, pasando por la configuración de
usuarios con separación de funciones, hasta la identificación, evaluación y tratamiento de
riesgos concretos de una clínica privada. El ejercicio de comparación metodológica evidenció que
la simplicidad de SimpleRisk es una fortaleza para la adopción inicial, pero también una
limitación frente a marcos más formales como ISO/IEC 27005 cuando la organización necesita
madurar su gobierno de riesgos. Finalmente, el diseño de la integración con Jira mostró cómo una
herramienta de gestión de riesgos puede conectarse con las herramientas operativas ya utilizadas 
por los equipos técnicos, para que el riesgo identificado se traduzca efectivamente en acción
