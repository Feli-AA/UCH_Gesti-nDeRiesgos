# Usuarios y Roles — SimpleRisk

> **Ninguna contraseña se documenta en este archivo.** Las credenciales se
> comunican por canal aparte si el docente las requiere para la evaluación.

## Roles definidos

| # | Usuario | Rol | Justificación del rol |
|---|---|---|---|
| 1 | `admin_sistemas_clinica` | Administrador | Gestión de la plataforma, alta de usuarios y configuración. |
| 2 | `analista_riesgos` | Analista de Riesgos | Alta y valoración de riesgos, carga de planes de acción. |
| 3 | `auditor_interno` | Auditor | Sólo lectura sobre riesgos y reportes. Verifica sin poder modificar. |

## Matriz de permisos

| Permiso | Administrador | Analista | Auditor |
|---|:---:|:---:|:---:|
| Crear/editar riesgos | ✅ | ✅ | ❌ |
| Valorar riesgos | ✅ | ✅ | ❌ |
| Crear planes de acción | ✅ | ✅ | ❌ |
| Ver reportes | ✅ | ✅ | ✅ |
| Gestionar usuarios | ✅ | ❌ | ❌ |
| Configurar la plataforma | ✅ | ❌ | ❌ |

## Principio aplicado

La separación responde al **principio de menor privilegio**: el auditor no puede
modificar aquello que audita, lo que preserva la independencia del control. El
analista opera sobre riesgos pero no sobre la configuración de la plataforma,
evitando que pueda alterar las escalas de valoración con las que se lo evalúa.

## Evidencia

Capturas en `../informe/capturas/` (pendiente).
