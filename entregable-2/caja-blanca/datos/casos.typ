// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | diccionario de casos de caja blanca
// [HUMANO] Daniel: revisar los valores y los resultados esperados antes de la entrega.
//
// Alcance: solo diseño de casos. No incluye ejecución ni reportes de bugs.
// Los IDs TCCB-001 a TCCB-003 se conservan del README; los datos se ajustaron
// para que cada caso cubra una decisión distinta y permita justificar la cobertura.

#let dato(dato: "", valor: "", origen: "", observacion: "") = (
  dato: dato,
  valor: valor,
  origen: origen,
  observacion: observacion,
)

#let paso(accion: "", dato: "", esperado: "") = (
  accion: accion,
  dato: dato,
  esperado: esperado,
)

#let caso(
  id,
  titulo: "",
  prioridad: "Media",
  tipo: "Caja blanca / Decisión",
  modulo: "validar_compra",
  ambiente: "Local / Python 3",
  objetivo: "",
  precondiciones: (estado: "", usuario: "", configuracion: ""),
  datos: (),
  pasos: (),
  criterio: "",
  cobertura: "",
) = {
  let precondiciones = if precondiciones == none { (:) } else { precondiciones }
  (
    id: id,
    titulo: titulo,
    prioridad: prioridad,
    tipo: tipo,
    modulo: modulo,
    ambiente: ambiente,
    objetivo: objetivo,
    precondiciones: (: estado: "", usuario: "", configuracion: "", ..precondiciones),
    datos: datos,
    pasos: pasos,
    criterio: criterio,
    cobertura: cobertura,
  )
}

#let casos = (
  caso(
    "TCCB-001",
    titulo: "Edad menor de 18",
    prioridad: "Alta",
    tipo: "Caja blanca / Decisión",
    modulo: "validar_compra",
    ambiente: "Local / Python 3",
    objetivo: "Verificar que la función rechaza la compra cuando la edad es menor de 18.",
    precondiciones: (
      estado: "Función validar_compra definida y disponible.",
      usuario: "N/A",
      configuracion: "Intérprete de Python 3.",
    ),
    datos: (
      dato(dato: "edad", valor: "17", origen: "Preparado"),
      dato(dato: "cuenta_activa", valor: "True", origen: "Preparado"),
      dato(dato: "saldo", valor: "100", origen: "Preparado"),
      dato(dato: "monto", valor: "50", origen: "Preparado"),
    ),
    pasos: (
      paso(
        accion: "Ejecutar validar_compra(17, True, 100, 50)",
        dato: "17, True, 100, 50",
        esperado: "Retorna «Compra no permitida: edad».",
      ),
    ),
    criterio: "La función retorna «Compra no permitida: edad» y no evalúa las condiciones de cuenta ni de saldo.",
    cobertura: "D1 verdadero (C1 verdadero); sentencia S2. No cubre D2 ni D3.",
  ),

  caso(
    "TCCB-002",
    titulo: "Cuenta inactiva",
    prioridad: "Media",
    tipo: "Caja blanca / Decisión",
    modulo: "validar_compra",
    ambiente: "Local / Python 3",
    objetivo: "Verificar que la función rechaza la compra cuando la cuenta no está activa, aunque la edad sea válida.",
    precondiciones: (
      estado: "Función validar_compra definida y disponible.",
      usuario: "N/A",
      configuracion: "Intérprete de Python 3.",
    ),
    datos: (
      dato(dato: "edad", valor: "18", origen: "Preparado"),
      dato(dato: "cuenta_activa", valor: "False", origen: "Preparado"),
      dato(dato: "saldo", valor: "100", origen: "Preparado"),
      dato(dato: "monto", valor: "50", origen: "Preparado"),
    ),
    pasos: (
      paso(
        accion: "Ejecutar validar_compra(18, False, 100, 50)",
        dato: "18, False, 100, 50",
        esperado: "Retorna «Compra no permitida: cuenta».",
      ),
    ),
    criterio: "La función retorna «Compra no permitida: cuenta».",
    cobertura: "D1 falso; D2 verdadero (C2 verdadero); sentencia S4. D3 no se evalúa.",
  ),

  caso(
    "TCCB-003",
    titulo: "Compra aprobada",
    prioridad: "Alta",
    tipo: "Caja blanca / Decisión",
    modulo: "validar_compra",
    ambiente: "Local / Python 3",
    objetivo: "Verificar que la compra se aprueba cuando la edad es válida, la cuenta está activa y el saldo cubre un monto positivo.",
    precondiciones: (
      estado: "Función validar_compra definida y disponible.",
      usuario: "N/A",
      configuracion: "Intérprete de Python 3.",
    ),
    datos: (
      dato(dato: "edad", valor: "18", origen: "Preparado"),
      dato(dato: "cuenta_activa", valor: "True", origen: "Preparado"),
      dato(dato: "saldo", valor: "100", origen: "Preparado"),
      dato(dato: "monto", valor: "50", origen: "Preparado"),
    ),
    pasos: (
      paso(
        accion: "Ejecutar validar_compra(18, True, 100, 50)",
        dato: "18, True, 100, 50",
        esperado: "Retorna «Compra aprobada».",
      ),
    ),
    criterio: "La función retorna «Compra aprobada».",
    cobertura: "D1 falso; D2 falso; D3 verdadero (C3 verdadero y C4 verdadero); sentencia S6.",
  ),
)
