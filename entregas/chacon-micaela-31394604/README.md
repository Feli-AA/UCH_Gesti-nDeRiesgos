# Trabajo Práctico — Gestión de Riesgos con SimpleRisk

## Datos de la alumna

- **Nombre completo:** Micaela Chacón
- **LU:** 31394604
- **Email institucional:** micachacon12@gmail.com
- **Comisión:** G

---

## Descripción

En este trabajo se utilizó SimpleRisk para realizar un análisis inicial de riesgos sobre el caso de una clínica privada.

El escenario plantea una organización de 120 empleados que atiende aproximadamente 800 pacientes por día y trabaja con:

- Historias clínicas digitales.
- Datos de obras sociales.
- Información de facturación.

Además, la clínica atravesó una auditoría externa en la que se detectaron debilidades en su gestión de riesgos.

A partir de este escenario se configuró un entorno local de SimpleRisk, se crearon usuarios con diferentes permisos, se registró un riesgo de prueba para validar el funcionamiento de la herramienta y luego se identificaron y analizaron siete riesgos correspondientes al caso de la clínica.

---

## Estructura de la entrega

La estructura final de la entrega es la siguiente:

```text
entregas/chacon-micaela-31394604/
├── README.md
├── .gitignore
├── entorno/
│   └── docker-compose.yml
├── configuracion/
│   ├── usuarios.md
│   └── riesgos.md
├── informe/
│   ├── informe.md
│   └── capturas/
│       ├── README.md
│       └── capturas.png
└── reporte-ejecutivo/
    └── reporte.pdf
```

---

# Instalación y ejecución

## Requisitos

Para reproducir el entorno se necesita:

- Docker Desktop.
- Docker Compose.
- Navegador web.
- Puertos `80` y `443` disponibles.

---

## Levantar SimpleRisk

Desde la carpeta:

```text
entorno/
```

ejecutar:

```bash
docker compose up -d
```

Para verificar que el contenedor se encuentre funcionando:

```bash
docker ps
```

Luego acceder desde el navegador a:

```text
https://localhost
```

Durante la instalación local puede aparecer una advertencia del navegador relacionada con el certificado HTTPS utilizado por el entorno.

---

## Detener el entorno

```bash
docker compose stop
```

---

## Volver a iniciarlo

```bash
docker compose start
```

El archivo:

```text
entorno/docker-compose.yml
```

permite reproducir la instalación base utilizada durante el trabajo.

La configuración posterior de usuarios, riesgos y planes de mitigación fue realizada manualmente desde la interfaz de SimpleRisk.

---

# Configuración de usuarios

Se crearon tres usuarios con funciones diferentes dentro de SimpleRisk:

| Usuario | Rol | Función principal |
|---|---|---|
| `admin_demo` | Administrador | Administración general de SimpleRisk |
| `analista_riesgos` | Analista de Riesgos | Registrar, analizar y planificar mitigaciones |
| `auditor_demo` | Auditor | Revisar y comentar riesgos sin modificarlos |

La configuración se realizó buscando aplicar dos principios:

## Mínimo privilegio

Cada usuario recibió únicamente los permisos necesarios para cumplir su función.

## Segregación de funciones

Se separaron las tareas de administración, análisis y auditoría para evitar que un único usuario controle todo el ciclo de gestión de riesgos.

El detalle de usuarios y permisos se encuentra en:

[`configuracion/usuarios.md`](configuracion/usuarios.md)

---

# Riesgo de prueba

Antes de comenzar con el análisis de la clínica se creó un riesgo de prueba para comprobar que SimpleRisk funcionara correctamente.

Este riesgo permitió validar:

- La instalación del entorno.
- La creación de riesgos.
- La asignación de probabilidad e impacto.
- El registro de activos.
- El funcionamiento general de la herramienta.

El riesgo de prueba corresponde a:

**R01 — Riesgo de prueba: indisponibilidad del sistema clínico**

Este riesgo no forma parte de los siete riesgos analizados posteriormente para el escenario de la clínica.

---

# Riesgos de la clínica

Luego del riesgo de prueba se registraron siete riesgos relacionados con el escenario planteado.

| ID | Riesgo |
|:---:|---|
| **R02** | Ransomware sobre historias clínicas digitales |
| **R03** | Acceso no autorizado a historias clínicas digitales |
| **R04** | Falla o pérdida de copias de seguridad de información clínica |
| **R05** | Caída del sistema de gestión clínica durante la atención |
| **R06** | Phishing dirigido al personal de la clínica |
| **R07** | Modificación incorrecta de información médica de pacientes |
| **R08** | Filtración de datos de pacientes y obras sociales |

El detalle completo de los riesgos, activos, amenazas, vulnerabilidades, probabilidad, impacto, tratamiento y medidas propuestas se encuentra en:

[`configuracion/riesgos.md`](configuracion/riesgos.md)

---

# Criterio de evaluación

Se utilizó la matriz de **Probabilidad × Impacto** indicada en la plantilla proporcionada por la cátedra.

Tanto la probabilidad como el impacto se valoraron utilizando una escala de `1` a `5`.

El valor se obtiene mediante:

**Riesgo = Probabilidad × Impacto**

La clasificación utilizada es:

| Resultado | Nivel |
|:---:|:---:|
| **1 – 4** | Bajo |
| **5 – 9** | Medio |
| **10 – 15** | Alto |
| **16 – 25** | Crítico |

SimpleRisk también muestra un valor propio para los riesgos registrados dentro de la herramienta.

Para evitar mezclar metodologías, el nivel utilizado en el análisis académico de esta entrega es el obtenido mediante la matriz definida por la cátedra.

---

# Planes de mitigación

Se configuraron tres planes de mitigación asociados a riesgos prioritarios:

| Riesgo | Plan |
|---|---|
| **R02 — Ransomware** | Medidas para reducir el riesgo asociado a ransomware |
| **R04 — Copias de seguridad** | Medidas para mejorar la recuperación de información |
| **R05 — Caída del sistema clínico** | Medidas orientadas a continuidad y recuperación |

Los planes fueron configurados dentro de SimpleRisk y cuentan con sus correspondientes capturas de evidencia.

---

# Informe

El desarrollo del trabajo se encuentra documentado en:

[`informe/informe.md`](informe/informe.md)

En este archivo se incluye:

- Contexto del caso.
- Instalación utilizada.
- Configuración de usuarios.
- Análisis de riesgos.
- Tratamientos propuestos.
- Planes de mitigación.
- Comparación metodológica.
- Propuesta de integración con una herramienta externa.
- Consideraciones de seguridad.
- Conclusiones.

---

# Evidencias

Las capturas utilizadas para demostrar la configuración realizada en SimpleRisk se encuentran en:

[`informe/capturas/`](informe/capturas/)

Las evidencias incluyen:

- Usuarios y permisos.
- Riesgo de prueba.
- Riesgos correspondientes al caso de la clínica.
- Planes de mitigación.

Las referencias específicas a las imágenes también se encuentran documentadas en:

- [`configuracion/usuarios.md`](configuracion/usuarios.md)
- [`configuracion/riesgos.md`](configuracion/riesgos.md)

---

# Decisiones tomadas

## Uso de Docker

Se utilizó Docker para disponer de una instalación local de SimpleRisk y dejar documentada una forma reproducible de levantar el entorno.

---

## Separación entre información del caso y decisiones del análisis

Durante el trabajo se tomó como información del escenario únicamente aquello indicado expresamente en la consigna.

Cuando fue necesario definir elementos como:

- Clasificación de activos.
- Criticidad.
- Responsables propuestos.
- Probabilidad.
- Impacto.
- Tratamiento.
- Salvaguardas.

se los consideró decisiones realizadas como parte del análisis y no datos proporcionados por el caso de la clínica.

---

## Evaluación de riesgos

La clasificación académica se realizó utilizando la matriz de Probabilidad × Impacto proporcionada por la cátedra.

Los valores propios mostrados por SimpleRisk se conservaron como parte de la configuración de la herramienta, pero no fueron utilizados para reemplazar la escala definida en la plantilla.

---

## Permisos de usuarios

Los permisos fueron distribuidos buscando aplicar:

- Principio de mínimo privilegio.
- Segregación de funciones.

El administrador posee funciones de administración.

El analista puede registrar, modificar y analizar riesgos, además de planificar mitigaciones.

El auditor se utiliza para tareas de revisión sin modificar el registro de riesgos.

---

## Tratamiento de riesgos

Para los riesgos identificados se propusieron medidas de mitigación.

Las salvaguardas documentadas representan propuestas realizadas durante el análisis y no controles que la consigna indique que la clínica tenga actualmente implementados.

---

# Seguridad de la entrega

Para evitar la exposición de información sensible se tuvieron en cuenta las siguientes medidas:

- No documentar contraseñas.
- No subir tokens ni claves API.
- Utilizar usuarios ficticios.
- Utilizar un archivo `.gitignore`.
- No subir archivos de bases de datos o dumps.
- Revisar las capturas antes de incorporarlas al repositorio.
- Evitar que las imágenes muestren credenciales o información sensible.

---

# Verificación

Palabra clave solicitada en la consigna:

**girasol**

---

# Checklist de auto-revisión

Este checklist debe completarse al finalizar toda la entrega.

- [ ] No hay credenciales en el repositorio.
- [ ] El `.gitignore` está correctamente configurado.
- [ ] Las capturas no muestran datos sensibles.
- [ ] Los archivos `.sql` o dumps no están subidos.
- [ ] El informe está en formato legible.
- [ ] El reporte ejecutivo está completo.
- [ ] Los mensajes de commit son descriptivos.
- [ ] La branch correspondiente está actualizada y funciona.
