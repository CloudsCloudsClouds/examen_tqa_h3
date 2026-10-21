// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | informe final consolidado
// Compilar: typst compile --root . informe-final/informe_final.typ

#import "../templates/tqa.typ": *
#import "../entregable-1/caja-negra/datos/casos.typ": casos as casos-negros
#import "../entregable-2/caja-blanca/datos/casos.typ": casos as casos-blancos
#import "../entregable-2/caja-blanca/datos/analisis.typ": *

#show: documento.with(
  titulo: "Informe Final — Hito 3 TQA",
  pie: "Daniel Bernal • TQA Hito 3",
)

#let autor = "Daniel Bernal"
#let repo = "https://github.com/CloudsCloudsClouds/examen_tqa_h3"
#let fecha = "2026-10-20"

// ═════════════════════════════════════════════════════════════════════════════
// PORTADA
// ═════════════════════════════════════════════════════════════════════════════
#v(45pt)
#parrafo(alineacion: center, text(font: f-titulos, size: 31pt, weight: "bold")[INFORME FINAL])
#parrafo(alineacion: center, text(size: 19pt, weight: "bold", fill: c-azul)[Testing & Quality Assurance · Hito 3])
#parrafo(alineacion: center, text(size: 12pt)[Caja negra · Caja blanca · Gherkin])
#v(22pt)
#parrafo(alineacion: center, text(size: 14pt, weight: "bold")[#autor])
#parrafo(alineacion: center, text(size: 10pt)[#link(repo)[#repo]])
#parrafo(alineacion: center, text(size: 10pt)[#fecha])

#v(28pt)
#tabla(1,
  table.cell(fill: c-diseno, align: center + horizon,
    text(size: 11pt, weight: "bold")[Aplicación bajo prueba: SauceDemo (Swag Labs) \ https://www.saucedemo.com/]),
)

// ═════════════════════════════════════════════════════════════════════════════
// PRESENTACIÓN
// ═════════════════════════════════════════════════════════════════════════════
#pagebreak()
#sec(nivel: 1)[Presentación]

#parrafo[
  Este informe consolida el trabajo de diseño de pruebas realizado para el Hito 3 de TQA
  sobre SauceDemo (Swag Labs). Incluye los 5 casos de caja negra, el análisis de caja blanca
  con 3 casos y 2 escenarios Gherkin. El alcance de este documento es el diseño de las
  pruebas; la ejecución y los reportes de bugs se documentan por separado.
]

#ficha(
  ("ESTUDIANTE", "Daniel Bernal", "MODALIDAD", "Individual"),
  ("REPOSITORIO", link(repo)[#repo], "APLICACIÓN", link("https://www.saucedemo.com/")[SauceDemo]),
  ("ENTREGA", "Hito 3 · TQA", "FECHA", fecha),
)

#sec("Actividades cubiertas")
#registro(
  c-azul,
  ("Actividad", "Contenido", "Cantidad"),
  (
    ("Caja negra", "Casos funcionales sobre SauceDemo", "5"),
    ("Caja blanca", "Análisis de cobertura y casos sobre validar_compra", "3"),
    ("Gherkin", "Escenarios BDD de login", "2"),
  ),
  centradas: (2,),
)

#sec("Resumen del trabajo")
#parrafo[
  La caja negra cubre inicio de sesión, validación de credenciales, flujo de carrito y
  checkout, compra de inicio a fin y ordenamiento del catálogo. La caja blanca analiza
  decisiones, condiciones y sentencias de `validar_compra`, elige cobertura de decisiones
  y explica el ajuste necesario para completarla. Gherkin documenta el login exitoso y la
  validación de credenciales incompletas o incorrectas.
]

// ═════════════════════════════════════════════════════════════════════════════
// CAJA NEGRA
// ═════════════════════════════════════════════════════════════════════════════
#pagebreak()
#sec(nivel: 1)[Caja negra]

#parrafo[
  Cinco casos funcionales diseñados desde la perspectiva del usuario sobre SauceDemo.
  Cada caso incluye objetivo, precondiciones, datos, pasos, resultado esperado y criterio
  de éxito.
]

#registro(
  c-azul,
  ("ID", "Título", "Módulo", "Tipo", "Prioridad"),
  casos-negros.map(tc => (
    tc.id,
    texto(tc.titulo),
    texto(tc.modulo),
    texto(tc.tipo),
    texto(tc.prioridad),
  )),
  centradas: (0, 4),
)

#let ficha-caso(tc, con-cobertura: false) = {
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

  if con-cobertura {
    sec("6. Cobertura")
    ficha(size: 9pt, ("DECISIÓN / CONDICIÓN", texto(tc.at("cobertura", default: ""))))
  }
}

#for tc in casos-negros {
  pagebreak()
  ficha-caso(tc)
}

// ═════════════════════════════════════════════════════════════════════════════
// CAJA BLANCA
// ═════════════════════════════════════════════════════════════════════════════
#pagebreak()
#sec(nivel: 1)[Caja blanca]

#parrafo[Código analizado:]

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

#sec("Decisiones, condiciones y sentencias")
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

#sec("Criterio y mínimo de casos")
#parrafo[*Criterio:* #criterio-elegido.]
#parrafo[#justificacion]
#parrafo[#minimo-explicacion]

#registro(
  c-azul,
  ("Criterio", "Mínimo", "¿3 casos?", "Observación"),
  criterios.map(c => (c.nombre, str(c.minimo), c.con_3, c.nota)),
  centradas: (1, 2),
)

#sec("Cobertura de los 3 casos")
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

#sec("Ajuste necesario")
#parrafo[#ajuste]

#sec("Nota sobre tipos inválidos")
#parrafo[#nota-tipos]

#pagebreak()
#sec("Casos de caja blanca")
#registro(
  c-azul,
  ("ID", "Título", "Prioridad"),
  casos-blancos.map(tc => (tc.id, texto(tc.titulo), texto(tc.prioridad))),
  centradas: (0, 2),
)

#for tc in casos-blancos {
  pagebreak()
  ficha-caso(tc, con-cobertura: true)
}

// ═════════════════════════════════════════════════════════════════════════════
// GHERKIN
// ═════════════════════════════════════════════════════════════════════════════
#pagebreak()
#sec(nivel: 1)[Gherkin]

#parrafo[
  Escenarios BDD para el inicio de sesión en SauceDemo. Se incluye un camino exitoso
  y una validación con credenciales incompletas o incorrectas.
]

```gherkin
Feature: Login

  @smoke
  Scenario: Valid login reaches Products page
    Given I am on the login page at https://www.saucedemo.com/
    When I log in with username "standard_user" and password "secret_sauce"
    Then I should see the Products page with six items

Feature: Login validation

  @unit
  Scenario Outline: Login rejects missing or incorrect credentials
    Given I am on the login page
    When I log in with username "<username>" and password "<password>"
    Then I should see the error "<error>"
    And I should still be on the login page

    Examples:
      | username      | password       | error                                                                     |
      |               | secret_sauce   | Epic sadface: Username is required                                        |
      | standard_user |                | Epic sadface: Password is required                                        |
      | standard_user | wrong_password | Epic sadface: Username and password do not match any user in this service |
```

// ═════════════════════════════════════════════════════════════════════════════
// CONCLUSIONES
// ═════════════════════════════════════════════════════════════════════════════
#pagebreak()
#sec(nivel: 1)[Conclusiones]

- La caja negra cubre los flujos principales de SauceDemo con 5 casos funcionales distintos.
- La caja blanca elige cobertura de decisiones: los 3 casos cubren 5 de 6 resultados; falta `D3 falso` y se propone un cuarto caso.
- La cobertura de condiciones exigiría 5 casos por el cortocircuito de `and`.
- Gherkin documenta el login exitoso y la validación de credenciales en 2 escenarios.
- El repositorio con el trabajo completo está en #link(repo)[#repo].
