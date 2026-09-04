# Registro de riesgos

## Riesgo de prueba

Se creó un primer riesgo para verificar el funcionamiento de la instalación y los permisos asignados al rol Analista de Riesgos.

| Campo | Valor |
|---|---|
| ID en SimpleRisk | 1001 |
| Referencia externa | TEST-001 |
| Nombre | Prueba funcional - indisponibilidad del sistema de turnos |
| Activo afectado | Sistema de gestión de turnos |
| Categoría | Environmental Resilience |
| Fuente | System |
| Responsable | Administradora Demo |
| Registrado por | Solange Abraham |
| Probabilidad | Credible |
| Impacto | Moderate |
| Método de cálculo | Classic |
| Resultado en SimpleRisk | 3.6 - Low |
| Estado inicial | New |

SimpleRisk normaliza el producto de probabilidad e impacto a una escala de 0 a 10. Para este riesgo, la combinación seleccionada produce un resultado de 3.6.

La prueba permitió validar correctamente:

- El acceso mediante un usuario no administrador.
- El cambio obligatorio de contraseña.
- La autenticación multifactor.
- Los permisos del rol Analista de Riesgos.
- La creación y asociación de un activo.
- El registro y cálculo de un riesgo.

## Evidencia

La captura del riesgo creado se encuentra en:
informe/capturas/05_riesgo_prueba.png
