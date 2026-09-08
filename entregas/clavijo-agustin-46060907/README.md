# TP4 - Herramientas de Gestión de Riesgo: SimpleRisk

## Datos personales

- **Nombre completo:** Agustín Clavijo
- **LU:** 46060907
- **Email institucional:** agustinclavijo@uhc.edu.ar

## Instrucciones para levantar el entorno

El entorno se instaló usando Docker sobre Windows 11 (con Docker Desktop + WSL2), a partir de la imagen oficial de SimpleRisk en DockerHub. Los pasos para reproducirlo son:

1. Instalar Docker Desktop (requiere WSL2 habilitado en Windows).
2. Descargar la imagen de SimpleRisk:
```
docker pull simplerisk/simplerisk
```
3. Levantar el contenedor:
```
docker run --name simplerisk -d -p 80:80 -p 443:443 simplerisk/simplerisk
```
4. Acceder desde el navegador a `https://localhost/` (va a aparecer una advertencia de certificado autofirmado, es esperable hay que aceptar y continuar).
5. Completar el asistente de instalación inicial, creando la cuenta de administrador.
6. Una vez dentro, crear los usuarios y roles adicionales desde **Configure/Settings > Users & Access** (ver detalle en `configuracion/usuarios.md`).

## Decisiones de diseño

- **Metodología de riesgos:** se utilizó la matriz clásica de probabilidad × impacto que trae SimpleRisk por defecto (escala 1-5 en cada eje), por ser la más adecuada para una primera etapa de madurez en gestión de riesgos de la organización simulada.
- **Escenario:** se tomó como supuesto que la clínica no cuenta con un área de seguridad formalizada previamente, y que el usuario Administrador cumple el rol de responsable de seguridad de la información.
- **Roles y permisos:** se diseñaron siguiendo el principio de mínimo privilegio. El rol Analista puede cargar y planificar el tratamiento de riesgos, pero no cerrarlos ni aprobarlos; esas acciones quedan reservadas al Administrador, ya que se consideran decisiones de supervisión.
- **Priorización de mitigaciones:** de los 7 riesgos definidos, 5 resultaron de nivel Alto o superior. Por restricciones de tiempo, se desarrollaron planes de mitigación formales solo para los 3 de mayor criticidad y viabilidad de implementación a corto plazo. El detalle está en `informe/informe.md`.
- **Carpeta `scripts/`:** no se incluye en esta entrega, ya que no se automatizó ningún proceso adicional (se optó por la actividad D1 de la Parte D, que es de análisis, no de implementación).

## Checklist de auto-revisión

- [ x ] No hay credenciales reales en el repositorio
- [ x ] El `.gitignore` está correctamente configurado
- [ x ] Las capturas no muestran datos sensibles
- [ x ] No se subieron archivos `.sql` o dumps
- [ x ] El informe está en formato legible
- [ x ] El reporte ejecutivo está completo
- [ x ] Los mensajes de commit son descriptivos
- [ x ] Mi branch está actualizada y funciona

---

*Nota de verificación de lectura: girasol.*