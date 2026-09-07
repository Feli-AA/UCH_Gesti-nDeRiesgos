# Trabajo Práctico: Gestión de Riesgos con SimpleRisk

## Datos del estudiante

- **Nombre completo:** Mateo Di Leo
- **LU:** 31904464
- **Correo institucional:** mateodileoblas@uch.edu.ar
- **Comisión:** DIV-2016
- **Materia:** Seguridad de Sistemas

## Descripción

Este trabajo práctico aborda la gestión de riesgos de seguridad mediante SimpleRisk. El análisis se desarrolla sobre el escenario simulado de una clínica privada que administra historias clínicas digitales, información de obras sociales y datos de facturación.

## Instalación del entorno

### Requisitos

- Windows 10 u 11
- WSL 2
- Docker Desktop
- Git

### Levantar el entorno

Desde la carpeta personal de la entrega, ingresar en la carpeta `entorno`:

```powershell
cd entorno
docker compose up -d
```

Docker descargará automáticamente la imagen oficial de SimpleRisk y creará el contenedor.

También puede utilizarse el script de instalación para Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\setup.ps1
```

### Acceso a la aplicación

Abrir en el navegador:

```text
https://localhost:8444
```

El navegador puede mostrar una advertencia debido al certificado local autofirmado utilizado por SimpleRisk.

### Detener el entorno

```powershell
docker compose down
```

### Volver a iniciar el entorno

```powershell
docker compose up -d
```

## Decisiones de diseño

- Se eligió Docker porque permite desplegar SimpleRisk de manera aislada y reproducible.
- Se utilizará una escala de probabilidad e impacto de 1 a 5.
- El escenario corresponde a una clínica privada ficticia.
- No se utilizarán datos personales, credenciales ni información clínica real.
- La palabra de verificación de lectura es: **girasol**.

## Checklist de auto-revisión

- [ ] No hay credenciales en el repositorio.
- [ ] El `.gitignore` está correctamente configurado.
- [ ] Las capturas no muestran datos sensibles.
- [ ] No se subieron archivos `.sql` ni dumps.
- [ ] El informe está en formato legible.
- [ ] El reporte ejecutivo está completo.
- [ ] Los mensajes de commit son descriptivos.
- [ ] La branch está actualizada y funciona.


