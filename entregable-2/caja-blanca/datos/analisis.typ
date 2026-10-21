// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | análisis de cobertura de la función validar_compra
// [HUMANO] Daniel: revisar el criterio elegido y los casos antes de la entrega.

#let decisiones = (
  (id: "D1", expresion: "edad < 18", descripcion: "Rechaza la compra si el usuario es menor de edad."),
  (id: "D2", expresion: "not cuenta_activa", descripcion: "Rechaza la compra si la cuenta no está activa."),
  (id: "D3", expresion: "saldo >= monto and monto > 0", descripcion: "Aprueba la compra si hay saldo suficiente y el monto es positivo."),
)

#let condiciones = (
  (id: "C1", expresion: "edad < 18", decision: "D1"),
  (id: "C2", expresion: "not cuenta_activa", decision: "D2"),
  (id: "C3", expresion: "saldo >= monto", decision: "D3"),
  (id: "C4", expresion: "monto > 0", decision: "D3"),
)

#let sentencias = (
  (id: "S1", expresion: "if edad < 18"),
  (id: "S2", expresion: "return «Compra no permitida: edad»"),
  (id: "S3", expresion: "if not cuenta_activa"),
  (id: "S4", expresion: "return «Compra no permitida: cuenta»"),
  (id: "S5", expresion: "if saldo >= monto and monto > 0"),
  (id: "S6", expresion: "return «Compra aprobada»"),
  (id: "S7", expresion: "return «Compra rechazada»"),
)

#let criterios = (
  (nombre: "Sentencias", minimo: 4, con_3: "No", nota: "Falta ejecutar S7 (Compra rechazada)."),
  (nombre: "Decisiones", minimo: 4, con_3: "No", nota: "Falta D3 falso."),
  (nombre: "Condiciones", minimo: 5, con_3: "No", nota: "Faltan C3 falso y C4 falso; por cortocircuito requieren casos separados."),
)

#let criterio-elegido = "Cobertura de decisiones"

#let justificacion = [
  Se elige cobertura de decisiones porque cada `if` debe tomar sus dos resultados.
  Es más fuerte que cobertura de sentencias y más económica que cobertura de condiciones
  para el alcance de 3 casos. La cobertura de condiciones se analiza abajo, pero exigiría
  más casos por el cortocircuito de `and`.
]

#let minimo-explicacion = [
  Para cobertura de decisiones se necesitan al menos 4 casos. D1 debe ser verdadero y falso.
  D2 solo se evalúa cuando D1 es falso, así que necesita un caso con D1 falso y D2 verdadero,
  y otro con D1 falso y D2 falso. D3 solo se evalúa cuando D1 y D2 son falsos, así que necesita
  un caso con D3 verdadero y otro con D3 falso. Los caminos mínimos son:

  + D1 verdadero.
  + D1 falso, D2 verdadero.
  + D1 falso, D2 falso, D3 verdadero.
  + D1 falso, D2 falso, D3 falso.
]

#let cobertura-3 = [
  Los 3 casos cubren D1 verdadero/falso, D2 verdadero/falso y D3 verdadero: 5 de los 6
  resultados de decisión. Falta D3 falso.
]

#let ajuste = [
  Para completar cobertura de decisiones falta un cuarto caso con D3 falso. Por ejemplo:
  `validar_compra(18, True, 30, 50)` → «Compra rechazada» (C3 falso, S7). Con ese caso,
  el mínimo de 4 se cumple.
]

#let nota-tipos = [
  La función no valida tipos. Si se pasan cadenas (`"ab"`, `"true"`, `"cien"`, `"A lot"`),
  Python lanza `TypeError` antes de evaluar las condiciones; no devuelve un mensaje de dominio.
  Ese comportamiento queda fuera del contrato de la función y no cuenta como cobertura de
  decisiones o condiciones. Si se quisiera documentar robustez, sería un caso adicional de
  tipo negativo por excepción, no uno de los 3 casos de cobertura.
]
