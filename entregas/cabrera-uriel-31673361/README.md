# Trabajo Práctico — Gestión de Riesgos con SimpleRisk

> Entrega individual · `entrega/cabrera-uriel-31673361`

---

## 1. Datos del alumno

| Campo | Dato |
|---|---|
| Nombre completo | Uriel Cabrera |
| Legajo (LU) | 31673361 |
| Email institucional | `cabrerauriel@uch.edu.ar` |
| Comisión | `G` |
| Materia | Seguridad Aplicada a Sistemas de Información |
| Branch | `entrega/cabrera-uriel-31673361` |

---

## 2. Cómo levantar el entorno

### Prerrequisitos

- Docker Desktop con backend WSL 2 (Windows 10/11) o Docker Engine (Linux).
- Virtualización habilitada en la UEFI/BIOS.
- ~3 GB libres de disco para la imagen.

### Levantamiento en un comando

Desde la raíz de esta carpeta:

```bash
cd entorno
chmod +x setup.sh
./setup.sh
```

En Windows, ejecutar el script desde WSL o Git Bash con Docker Desktop iniciado.

### Levantamiento manual (equivalente)

```bash
cd entorno
docker compose pull
docker compose up -d
docker compose ps
```

### Acceso

Abrir **https://localhost:8443**

El certificado es autofirmado, por lo que el navegador muestra una advertencia.
Es el comportamiento esperado de la imagen: se acepta la excepción y se continúa.

En el primer arranque, SimpleRisk presenta su instalador web. La credencial
inicial es la que trae el producto por defecto y **se cambia antes de cargar
cualquier dato**. Por política de la cátedra, ninguna contraseña —ni real ni de
demostración— se documenta en este repositorio.

### Comandos útiles

```bash
docker compose logs -f          # ver logs en vivo
docker compose stop             # detener sin borrar datos
docker compose down             # detener y eliminar el contenedor
docker compose down -v          # ¡CUIDADO! borra también la base de datos
```

---

## 3. Decisiones de diseño

### 3.1 Elección de la imagen: `simplerisk/simplerisk`

SimpleRisk publica dos imágenes oficiales:

| Imagen | Contenido | Elegida |
|---|---|---|
| `simplerisk/simplerisk` | LAMP completo + utilidades de correo en un contenedor | ✅ |
| `simplerisk-minimal` | Sólo la aplicación; requiere base de datos externa | ❌ |

Se eligió la imagen todo en uno porque es la ruta de instalación que el
proveedor documenta oficialmente para Docker y la única que puede levantarse
sin configuración adicional de conexión. La consigna A.1 pide que la
instalación sea **replicable**, y cada componente extra (variables de conexión,
orden de arranque entre contenedores, espera de disponibilidad de la base)
agrega un punto de falla en la máquina del evaluador sin aportar al análisis de
riesgos, que es el objeto del trabajo.

Limitación conocida: al residir la base de datos dentro del mismo contenedor,
la persistencia depende exclusivamente del volumen declarado en la sección 3.3.

### 3.2 Puertos 8080 / 8443 en lugar de 80 / 443

En Windows los puertos privilegiados suelen estar ocupados por otros servicios.
Usar puertos altos evita un conflicto que rompería la reproducibilidad en la
máquina del evaluador.

### 3.3 Persistencia sólo de la base de datos

Se persiste `/var/lib/mysql` mediante un volumen nombrado. Los archivos de la
aplicación no se persisten: se regeneran desde la imagen, lo que mantiene el
entorno reproducible y evita que un volumen desactualizado enmascare la versión
real de la aplicación.

### 3.4 Metodología de valoración de riesgos

Se utiliza la matriz clásica **Probabilidad × Impacto** en escala 1–5, alineada
con la plantilla de la Actividad A03 y con la matriz nativa de SimpleRisk. Los
niveles resultantes son: Bajo (1–4), Medio (5–9), Alto (10–15), Crítico (16–25).

Cada valoración se justifica de forma explícita. Cuando la justificación se
apoya en datos de incidentes reales del sector salud, se cita la fuente en
`configuracion/riesgos.md`.

### 3.5 Supuestos del escenario

Documentados en detalle en `informe/informe.md`, sección "Contexto y supuestos".

---

## 4. Verificación

Palabra clave de verificación de lectura: **girasol**

---

## 5. Estructura de la entrega

```
entregas/cabrera-uriel-31673361/
├── README.md                    # este archivo
├── .gitignore
├── entorno/
│   ├── docker-compose.yml
│   └── setup.sh
├── informe/
│   ├── informe.md
│   └── capturas/
├── configuracion/
│   ├── usuarios.md              # usuarios y roles (SIN contraseñas)
│   └── riesgos.md               # tabla de riesgos definidos
├── scripts/
└── reporte-ejecutivo/
    └── reporte.pdf
```

---

## 6. Checklist de auto-revisión

- [X] No hay credenciales en el repositorio
- [X] El `.gitignore` está correctamente configurado
- [ ] Las capturas no muestran datos sensibles
- [ ] Los archivos `.sql` o dumps no están subidos
- [ ] El informe está en formato legible
- [ ] El reporte ejecutivo está completo
- [ ] Los mensajes de commit son descriptivos
- [ ] Mi branch está actualizada y funciona
