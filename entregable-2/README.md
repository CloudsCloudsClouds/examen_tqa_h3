# Entregable 2 · Caja blanca

> 🤖 **Archivo creado por IA** · agente: OpenCode · modelo: DeepSeek V4.1 Flash · 2026-10-20 · alcance: análisis de cobertura y 3 casos de prueba · revisión humana: pendiente

Análisis de cobertura y diseño de 3 casos de prueba para la función
`validar_compra(edad, cuenta_activa, saldo, monto)`.

## Estructura

```text
entregable-2/
├── README.md
└── caja-blanca/
    ├── casos_caja_blanca.typ      # renderizador del documento
    └── datos/
        ├── analisis.typ           # decisiones, condiciones, sentencias y criterios
        └── casos.typ              # diccionario de TCCB-001 a TCCB-003
```

Los estilos compartidos viven en `templates/tqa.typ`.

## Alcance

Este entregable contiene **solo el análisis y el diseño de los 3 casos**.
No incluye ejecución, resultados, evidencias ni reportes de bugs.

## Criterio y cobertura

- **Criterio elegido:** cobertura de decisiones.
- **Mínimo calculado:** 4 casos.
- **Con los 3 casos:** se cubren 5 de los 6 resultados de decisión; falta `D3 falso`.
- **Ajuste necesario:** agregar un cuarto caso con `validar_compra(18, True, 30, 50)`
  → «Compra rechazada» para cubrir `D3 falso` y `S7`.
- **Sentencias:** también requieren 4 casos (falta `S7` con 3).
- **Condiciones:** requieren 5 casos por el cortocircuito de `and` (faltan `C3 falso`
  y `C4 falso`).

## Casos

| ID | Título | Cobertura principal |
| --- | --- | --- |
| `TCCB-001` | Edad menor de 18 | `D1` verdadero; `S2` |
| `TCCB-002` | Cuenta inactiva | `D1` falso, `D2` verdadero; `S4` |
| `TCCB-003` | Compra aprobada | `D1` falso, `D2` falso, `D3` verdadero; `S6` |

Los IDs se conservan del README. Los títulos y datos se ajustaron para que cada caso
cubra una decisión distinta. El caso original de “letras” se documenta como nota de
tipos inválidos: la función no valida tipos y Python lanza `TypeError` antes de evaluar
las condiciones, por lo que no cuenta como cobertura de decisiones o condiciones.

## Compilar

```bash
typst compile --root . entregable-2/caja-blanca/casos_caja_blanca.typ
```

El PDF queda en `entregable-2/caja-blanca/casos_caja_blanca.pdf`.

> Nota: si no tienes instaladas Aptos/Calibri/Carlito, Typst usa DejaVu Sans
> y muestra warnings de fuentes. No impiden compilar.

## Atribución

- **Daniel:** intención de los casos, IDs `TCCB-001` a `TCCB-003` y notas del README.
- **IA:** análisis de cobertura, cálculo del mínimo, ajuste de datos, redacción y Typst.
- Las marcas y reglas generales están en `AGENTS.md`; el historial de aportes IA
  está en `AI-CHANGELOG.md`.
- El PDF no incluye marcadores visibles de generación por IA, a pedido de Daniel.
