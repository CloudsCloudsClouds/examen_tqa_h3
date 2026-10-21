# Entregable 1 · Caja negra

> 🤖 **Archivo creado por IA** · agente: OpenCode · modelo: DeepSeek V4.1 Flash · 2026-10-20 · alcance: estructura y documentación del flujo · revisión humana: aprobada por Daniel

Diseño de los 5 casos de prueba de caja negra sobre SauceDemo (Swag Labs).
El contenido de los casos sale del README de Daniel; la IA lo tradujo y lo volcó al Typst.

## Estructura

```text
entregable-1/
├── README.md
└── caja-negra/
    ├── casos_caja_negra.typ      # renderizador del documento de TCs
    └── datos/
        └── casos.typ             # diccionario de TCs (fuente de verdad)
```

Los estilos compartidos viven en `templates/tqa.typ`. La plantilla original
`templates/plantilla_tc_tqa.typ` no se modifica: queda como referencia.

## Alcance

Este entregable contiene **solo el diseño de los casos**. No incluye ejecución,
resultados, evidencias ni reportes de bugs; eso se trabaja en otro entregable.

## Flujo de trabajo

1. **Cargar o ajustar un caso:** editar `caja-negra/datos/casos.typ` y completar
   los campos del `caso("TCCJ-00X", ...)`. También se puede dictar el contenido a
   la IA para que lo vuelque en el diccionario.
2. **Compilar:**

   ```bash
   typst compile --root . entregable-1/caja-negra/casos_caja_negra.typ
   ```

   El PDF queda en `entregable-1/caja-negra/casos_caja_negra.pdf`.

   > Nota: si no tienes instaladas Aptos/Calibri/Carlito, Typst usa DejaVu Sans
   > y muestra warnings de fuentes. No impiden compilar.

3. **Revisar:** leer el PDF y corregir el diccionario, no el renderizador. El
   renderizador solo presenta los datos.

## Estado inicial

- `datos/casos.typ` contiene los 5 casos `TCCJ-001` a `TCCJ-005`, traducidos
  desde el README de Daniel.
- Cada caso tiene objetivo, precondiciones, datos, pasos, resultado esperado y
  criterio de éxito.
- El PDF no incluye marcadores de generación por IA, a pedido de Daniel.

## Atribución

- **Daniel:** casos, pasos, datos, prioridades y criterios del README.
- **IA:** esquema del diccionario, traducción al español, formato Typst y
  renderizador.
- Las marcas y reglas generales están en `AGENTS.md`; el historial de aportes IA
  está en `AI-CHANGELOG.md`.
