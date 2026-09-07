# TP: Gestión de Riesgos con SimpleRisk

**Alumno:** Nicolás Martinengo
**Legajo (LU):** 31321399
**Email institucional:** martinengodiegonicolas@uch.edu.ar
**Comisión:** A

---

## Cómo levantar el entorno

Requisitos: Docker Desktop (o Docker Engine + Docker Compose) instalado y
corriendo.

```bash
cd entorno/
docker compose up -d
```

La primera vez tarda 1-3 minutos en descargar la imagen. Una vez levantado:

```bash
docker compose ps        # confirma que el contenedor está "Up"
```

Acceder desde el navegador a **http://localhost**. Si el puerto 80 ya está
en uso en tu máquina, cambiá el mapeo en `entorno/docker-compose.yml` a
`"8080:80"` y entrá por `http://localhost:8080`.

**Nota Apple Silicon (Mac M1/M2/M3):** el compose fija
`platform: linux/amd64` porque la imagen de SimpleRisk todavía no tiene build
nativo para arm64; Docker la emula automáticamente sin pasos adicionales.

Al entrar por primera vez, completar el asistente de instalación de
SimpleRisk (verificación de requisitos, base de datos interna, usuario
administrador). No usar credenciales reales; usar credenciales de prueba,
por ejemplo `admin_demo` / una contraseña ficticia.

## Decisiones de diseño

- **Escenario elegido:** clínica privada (120 empleados, 800 pacientes/día),
  con foco en **alta rotación de personal tercerizado** como factor
  organizacional que atraviesa la mayoría de los riesgos identificados.
- **Imagen de Docker:** se usó la imagen oficial todo-en-uno
  `simplerisk/simplerisk` (en vez de la variante `simplerisk-minimal` +
  MySQL separado) para simplificar el entorno de un TP individual, sin
  necesidad de gestionar una base de datos externa.
- **Roles de usuario:** se diseñaron con separación de funciones explícita
  (quien carga riesgos no es quien los aprueba) — ver justificación completa
  en `configuracion/usuarios.md`.
- **Metodología comparada en la Parte C:** FAIR, por ser el contraste más
  claro frente al enfoque cualitativo de SimpleRisk (cualitativo vs.
  cuantitativo) — ver desarrollo en `informe/informe.md`.

## Verificación

girasol

## Estructura del repositorio

```
.
├── README.md
├── .gitignore
├── entorno/
│   ├── docker-compose.yml
│   └── setup.sh
├── informe/
│   ├── informe.md          → desarrollo completo del TP (Partes A, B, C, D)
│   └── capturas/           → screenshots del proceso
├── configuracion/
│   ├── usuarios.md         → usuarios y roles creados, sin contraseñas
│   └── riesgos.md          → matriz de riesgos, tratamiento y planes de acción
└── reporte-ejecutivo/
    └── reporte.pdf         → reporte para el directorio de la clínica
```

## Checklist de auto-revisión

- [x] No hay credenciales en el repositorio.
- [x] El archivo `.gitignore` está correctamente configurado.
- [x] Las capturas de pantalla no muestran datos sensibles.
- [x] Los archivos `.sql` o dumps no están subidos.
- [x] El informe está en un formato legible.
- [x] El reporte ejecutivo está completo.
- [x] Los mensajes de commit son descriptivos.
- [x] Mi branch está actualizada y funciona correctamente.
