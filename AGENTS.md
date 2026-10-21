# Modelo de trabajo: atribución IA ↔ humano

> 🤖 **Archivo creado por IA** · agente: OpenCode · modelo: DeepSeek V4.1 Flash · 2026-10-20 · revisión humana: pendiente

Regla única: **lo que no está marcado es trabajo de Daniel; todo lo que produce una IA se marca.**

## Marcas

| Marca | Uso |
| --- | --- |
| `[IA]` | Texto, tabla o bloque producido por una IA. |
| `[HUMANO]` | Trabajo de Daniel dentro de un archivo mixto. |
| `[IA+HUMANO]` | Base de IA revisada o reescrita por Daniel. |

## Archivos completos de IA

La primera línea del archivo debe identificar a la IA y su alcance:

- **Markdown:** `> 🤖 **Generado por IA** · agente · modelo · fecha · alcance`
- **Código:** `# IA | agente | modelo | fecha | alcance` (o `//`, `--`, `%` según el lenguaje)
- **HTML:** `<!-- IA | agente | modelo | fecha | alcance -->`

## Ediciones parciales

Antes del bloque tocado: `[IA · agente · fecha]` y una línea con lo que cambió.
Nunca reescribir ni borrar texto humano en silencio.

## Commits

Si una IA escribió todo o parte de un commit:

```text
AI: <agente> / <modelo>
AI-scope: <archivos o secciones>
```

Los commits hechos solo por Daniel no llevan ese trailer.

## Límites

1. La IA no borra ni reescribe trabajo humano sin marcarlo.
2. La IA no se atribuye trabajo humano.
3. La marca no transfiere responsabilidad: Daniel revisa y valida.
4. Las capturas de la aplicación son evidencia, no contenido IA; si la IA las transcribe o redacta, sí se marcan.
5. Ante la duda, marcar.

## Registro de aportes IA

| Fecha | Agente / modelo | Archivos | Alcance |
| --- | --- | --- | --- |
| 2026-10-20 | OpenCode / DeepSeek V4.1 Flash | `AGENTS.md` | Política completa, a pedido de Daniel |
