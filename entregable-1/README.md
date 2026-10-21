# Entregable 1 · Caja negra

> 🤖 **Archivo creado por IA** · agente: OpenCode · modelo: DeepSeek V4.1 Flash · 2026-10-20 · alcance: estructura y documentación del flujo · revisión humana: pendiente

Organización del trabajo de caja negra sobre SauceDemo (Swag Labs).
La IA escribe el andamiaje y el Typst; el contenido de los casos y los resultados son de Daniel.

## Estructura

```text
entregable-1/
├── README.md
└── caja-negra/
    ├── casos_caja_negra.typ      # renderizador del documento de TCs
    ├── bugs_encontrados.typ      # renderizador del documento de bugs
    ├── datos/
    │   ├── casos.typ             # diccionario de TCs (fuente de verdad)
    │   └── bugs.typ              # diccionario de bugs
    └── evidencias/               # capturas y adjuntos
```

Los estilos compartidos viven en `templates/tqa.typ`. La plantilla original
`templates/plantilla_tc_tqa.typ` no se modifica: queda como referencia.

## Flujo de trabajo

1. **Cargar un caso:** editar `caja-negra/datos/casos.typ` y completar los campos
   del `caso("TC-00X", ...)`. También se puede dictar el contenido a la IA para que lo
   vuelque en el diccionario.
2. **Ejecutar la prueba:** completar el bloque `ejecucion:` del mismo caso con
   `estado`, fecha, resultado observado, pasos ejecutados y evidencias.
3. **Guardar evidencia:** poner las capturas en `caja-negra/evidencias/` con un
   nombre trazable, por ejemplo `TC-001_01.png` o `BUG-001_01.png`.
4. **Registrar bugs:** agregar cada defecto reproducible en `caja-negra/datos/bugs.typ`.
   Si una prueba pasa, no se registra bug: queda como `PASS` en el caso.
5. **Compilar:**

   ```bash
   typst compile --root . entregable-1/caja-negra/casos_caja_negra.typ
   typst compile --root . entregable-1/caja-negra/bugs_encontrados.typ
   ```

   Los PDF quedan junto a los archivos `.typ`:
   `casos_caja_negra.pdf` y `bugs_encontrados.pdf`.

   > Nota: si no tienes instaladas Aptos/Calibri/Carlito, Typst usa DejaVu Sans
   > y muestra warnings de fuentes. No impiden compilar.

6. **Revisar:** leer el PDF y corregir el diccionario, no el renderizador. El
   renderizador solo presenta los datos.

## Estado inicial

- `datos/casos.typ` trae 5 slots (`TC-001` a `TC-005`) con IDs y módulos sugeridos.
- Los campos de contenido están vacíos y se muestran como «Pendiente».
- `datos/bugs.typ` está vacío: todavía no hay bugs inventados.
- El PDF incluye una nota visible de generación por IA y revisión humana pendiente.

## Atribución

- **IA:** estructura de carpetas, módulo de estilos, renderizadores, esquema del
  diccionario y textos de andamiaje.
- **Daniel:** casos, datos, pasos, resultados de ejecución, bugs y evidencias.
- Las marcas y reglas generales están en `AGENTS.md`; el historial de aportes IA
  está en `AI-CHANGELOG.md`.
