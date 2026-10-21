// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | renderizador de caja blanca (análisis + 3 casos)
// Compilar: typst compile --root . entregable-2/caja-blanca/casos_caja_blanca.typ

#import "../../templates/tqa.typ": *
#import "datos/analisis.typ": *
#import "datos/casos.typ": casos

#show: documento.with(
  titulo: "Casos de prueba — Caja blanca",
  pie: "TQA • Caja blanca • validar_compra",
)

#let autor = "Daniel Bernal"
#let fecha = "2026-10-20"

// ── Portada ───────────────────────────────────────────────────────────────────
#v(35pt)
#parrafo(alineacion: center, text(font: f-titulos, size: 30pt, weight: "bold")[CASOS DE PRUEBA])
#parrafo(alineacion: center, text(size: 17pt, weight: "bold", fill: c-azul)[Caja blanca · validar_compra])
#parrafo(alineacion: center, text(size: 11pt)[TQA · Hito 3 · Entregable 2])
#parrafo(alineacion: center, text(size: 10pt)[#autor · #fecha])

#v(18pt)
#tabla(1,
  table.cell(fill: c-diseno, align: center + horizon,
    text(size: 12pt, weight: "bold")[ANÁLISIS Y DISEÑO \ Cobertura de decisiones sobre validar_compra.]),
)

#parrafo(alineacion: center, arriba: 2.5pt,
  text(size: 9pt, style: "italic", fill: c-gris)[Alcance: análisis de cobertura y 3 casos de prueba.])

// ── Código y análisis ────────────────────────────────────────────────────────
#pagebreak()
#sec(nivel: 1)[Código bajo análisis]

```python
def validar_compra(edad, cuenta_activa, saldo, monto):
    if edad < 18:
        return "Compra no permitida: edad"
    if not cuenta_activa:
        return "Compra no permitida: cuenta"
    if saldo >= monto and monto > 0:
        return "Compra aprobada"
    return "Compra rechazada"
```

#sec(nivel: 1)[Análisis de cobertura]

#sec("1. Decisiones, condiciones y sentencias")
#registro(
  c-azul,
  ("ID", "Expresión", "Qué controla"),
  decisiones.map(d => (d.id, d.expresion, d.descripcion)),
  centradas: (0,),
)

#parrafo[Condiciones simples:]

#registro(
  c-azul,
  ("ID", "Expresión", "Decisión"),
  condiciones.map(c => (c.id, c.expresion, c.decision)),
  centradas: (0, 2),
)

#parrafo[Sentencias:]

#registro(
  c-azul,
  ("ID", "Sentencia"),
  sentencias.map(s => (s.id, s.expresion)),
  centradas: (0,),
)

#sec("2. Criterio elegido")
#parrafo[*Criterio:* #criterio-elegido.]
#parrafo[#justificacion]

#pagebreak()
#sec("3. Mínimo de casos")
#parrafo[#minimo-explicacion]

#registro(
  c-azul,
  ("Criterio", "Mínimo", "¿3 casos?", "Observación"),
  criterios.map(c => (c.nombre, str(c.minimo), c.con_3, c.nota)),
  centradas: (1, 2),
)

#sec("4. Cobertura de los 3 casos")
#registro(
  c-azul,
  ("Caso", "D1", "D2", "D3", "Cobertura"),
  (
    ("TCCB-001", "V", "—", "—", "D1 verdadero; S2"),
    ("TCCB-002", "F", "V", "—", "D1 falso, D2 verdadero; S4"),
    ("TCCB-003", "F", "F", "V", "D1 falso, D2 falso, D3 verdadero; S6"),
  ),
  centradas: (0, 1, 2, 3),
)
#parrafo[#cobertura-3]

#sec("5. Ajuste necesario")
#parrafo[#ajuste]

#sec("6. Nota sobre tipos inválidos")
#parrafo[#nota-tipos]

// ── Casos ────────────────────────────────────────────────────────────────────
#pagebreak()
#sec(nivel: 1)[Casos de prueba]
#parrafo[Los 3 casos usan la plantilla de diseño; no incluyen ejecución.]

#registro(
  c-azul,
  ("ID", "Título", "Prioridad"),
  casos.map(tc => (tc.id, texto(tc.titulo), texto(tc.prioridad))),
  centradas: (0, 2),
)

#let ficha-caso(tc) = {
  sec(nivel: 1)[#tc.id · #texto(tc.titulo)]

  ficha(
    ("ID DEL TC", tc.id, "PRIORIDAD", texto(tc.prioridad)),
    ("TÍTULO", texto(tc.titulo), "TIPO", texto(tc.tipo)),
    ("MÓDULO", texto(tc.modulo), "AMBIENTE", texto(tc.ambiente)),
  )

  sec("1. Objetivo")
  ficha(size: 9pt, ("¿QUÉ SE QUIERE VALIDAR?", texto(tc.objetivo)))

  sec("2. Precondiciones")
  ficha(
    ("Estado inicial", texto(tc.precondiciones.estado)),
    ("Usuario / permisos", texto(tc.precondiciones.usuario)),
    ("Configuración", texto(tc.precondiciones.configuracion)),
  )

  sec("3. Datos de prueba")
  if tc.datos.len() == 0 {
    ficha(size: 9pt, ("Datos", "Pendiente"))
  } else {
    registro(
      c-azul,
      ("Dato", "Valor", "Origen", "Observación"),
      tc.datos.map(d => (
        texto(d.dato),
        texto(d.valor),
        texto(d.origen),
        texto(d.observacion, defecto: "—"),
      )),
      centradas: (),
    )
  }

  sec("4. Pasos y resultados esperados")
  if tc.pasos.len() == 0 {
    parrafo[Pendiente.]
  } else {
    registro(
      c-azul,
      ("#", "Paso / acción", "Dato utilizado", "Resultado esperado"),
      tc.pasos.enumerate().map(((i, p)) => (
        str(i + 1),
        texto(p.accion),
        texto(p.dato, defecto: "—"),
        texto(p.esperado),
      )),
      centradas: (0,),
    )
  }

  sec("5. Resultado esperado final")
  ficha(size: 9pt, ("CRITERIO DE ÉXITO", texto(tc.criterio)))

  sec("6. Cobertura")
  ficha(size: 9pt, ("DECISIÓN / CONDICIÓN", texto(tc.cobertura)))
}

#for tc in casos {
  pagebreak()
  ficha-caso(tc)
}
