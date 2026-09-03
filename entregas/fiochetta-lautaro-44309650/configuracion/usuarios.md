# Usuarios y permisos — SimpleRisk

## 1. Administrador
- **Username**: Lauta02
- **Rol**: Administrador del sistema
- **Permisos**: acceso completo a todos los módulos (Governance, Risk Management, Compliance, Asset Management, Assessments, AI)
- **Justificación**: responsable de la configuración general de SimpleRisk y la carga inicial de datos. Representa al Jefe de Sistemas / Responsable de Seguridad de la Información.

## 2. Analista de Riesgos
- **Username**: analista_riesgos
- **Rol**: Analista de riesgos
- **Permisos**:
  - Risk Management: acceso al menú, alta de riesgos, modificación de detalles, planificación de mitigaciones, comentarios, revisión de riesgos de nivel Insignificante/Bajo/Medio, gestión de proyectos
  - Asset Management: acceso al menú
- **Explícitamente sin permiso para**: cerrar riesgos, aceptar mitigaciones, revisar riesgos de nivel Alto/Muy alto, ni nada de Compliance/Governance/AI
- **Justificación**: hace el trabajo operativo diario de identificación y tratamiento de riesgos; las decisiones sobre riesgos de alto impacto quedan reservadas a un rol más senior (separación de funciones).

## 3. Auditor
- **Username**: Auditor_demo
- **Rol**: Auditor
- **Permisos**:
  - Risk Management: acceso al menú, revisión de riesgos de nivel Alto y Muy alto, comentarios
  - Governance: acceso al menú, visualización de excepciones
  - Compliance: acceso al menú, aprobación de tests
- **Explícitamente sin permiso para**: crear, modificar o cerrar riesgos, ni crear/editar frameworks o controles
- **Justificación**: un auditor que puede modificar lo que audita pierde independencia. Este rol solo revisa y aprueba — segregación de funciones.

**Nota de seguridad**: por política de este TP, las contraseñas no se documentan en este archivo ni en ningún otro del repositorio, conforme a la sección 4.1 del enunciado.