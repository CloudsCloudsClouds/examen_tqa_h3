// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | esquema y volcado a Typst de los casos de caja negra
// [HUMANO] Contenido de los 5 casos: Daniel (README). Traducción y formato: IA.
//
// Este archivo es la fuente de verdad de los casos de caja negra.
// Alcance: solo diseño de casos. No incluye ejecución ni reportes de bugs.
// El documento se genera desde casos_caja_negra.typ; no hace falta editar el renderizador.
//
// Estructura de un caso:
//   caso("TCCJ-001",
//     titulo: "...",
//     prioridad: "Alta",
//     tipo: "Smoke / Unitario",
//     modulo: "...",
//     ambiente: "QA",
//     objetivo: "...",
//     precondiciones: (estado: "...", usuario: "...", configuracion: "..."),
//     datos: (
//       dato(dato: "Usuario", valor: "...", origen: "...", observacion: ""),
//     ),
//     pasos: (
//       paso(accion: "...", dato: "...", esperado: "..."),
//     ),
//     criterio: "...",
//   )

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
  tipo: "Funcional",
  modulo: "",
  ambiente: "QA",
  objetivo: "",
  precondiciones: (estado: "", usuario: "", configuracion: ""),
  datos: (),
  pasos: (),
  criterio: "",
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
  )
}

#let casos = (
  caso(
    "TCCJ-001",
    titulo: "Inicio de sesión válido y acceso al catálogo",
    prioridad: "Alta",
    tipo: "Smoke / Unitario",
    modulo: "Inicio de sesión",
    ambiente: "QA",
    objetivo: "Confirmar que un usuario estándar puede iniciar sesión y llegar a la página de productos.",
    precondiciones: (
      estado: "Usuario registrado y catálogo con productos disponibles.",
      usuario: "standard_user con contraseña secret_sauce.",
      configuracion: "Navegador con acceso a https://www.saucedemo.com/.",
    ),
    datos: (
      dato(dato: "URL", valor: "https://www.saucedemo.com/", origen: "SauceDemo"),
      dato(dato: "Usuario", valor: "standard_user", origen: "SauceDemo"),
      dato(dato: "Contraseña", valor: "secret_sauce", origen: "SauceDemo"),
    ),
    pasos: (
      paso(
        accion: "Abrir la página de inicio de sesión",
        dato: "https://www.saucedemo.com/",
        esperado: "Se muestra el formulario de login.",
      ),
      paso(
        accion: "Ingresar el usuario y la contraseña",
        dato: "standard_user / secret_sauce",
        esperado: "Los campos quedan completos.",
      ),
      paso(
        accion: "Presionar LOGIN",
        esperado: "Se accede a la página de productos (catálogo).",
      ),
    ),
    criterio: "El usuario standard_user inicia sesión y llega al catálogo. Si este caso falla, los demás casos de caja negra quedan invalidados.",
  ),

  caso(
    "TCCJ-002",
    titulo: "Validación de campos en el inicio de sesión",
    prioridad: "Media",
    tipo: "Sanity / Unitario",
    modulo: "Inicio de sesión",
    ambiente: "QA",
    objetivo: "Comprobar que el formulario rechaza credenciales incompletas o incorrectas y mantiene al usuario en el inicio de sesión.",
    precondiciones: (
      estado: "Ninguna.",
      usuario: "N/A",
      configuracion: "Navegador con acceso a https://www.saucedemo.com/.",
    ),
    datos: (
      dato(dato: "Usuario válido", valor: "standard_user", origen: "SauceDemo"),
      dato(dato: "Contraseña válida", valor: "secret_sauce", origen: "SauceDemo"),
      dato(dato: "Contraseña incorrecta", valor: "wrong_password", origen: "Preparado"),
      dato(dato: "Campos vacíos", valor: "Sin usuario o sin contraseña", origen: "Preparado"),
    ),
    pasos: (
      paso(
        accion: "Abrir el login, dejar el usuario vacío, ingresar la contraseña secret_sauce y presionar LOGIN",
        dato: "Usuario vacío / secret_sauce",
        esperado: "La validación falla, se muestra el error del campo y el usuario permanece en el inicio de sesión.",
      ),
      paso(
        accion: "Ingresar standard_user, dejar la contraseña vacía y presionar LOGIN",
        dato: "standard_user / contraseña vacía",
        esperado: "La validación falla, se muestra el error del campo y el usuario permanece en el inicio de sesión.",
      ),
      paso(
        accion: "Ingresar standard_user y wrong_password, presionar LOGIN",
        dato: "standard_user / wrong_password",
        esperado: "La validación falla con un mensaje específico de usuario o contraseña incorrectos; el usuario permanece en el inicio de sesión.",
      ),
    ),
    criterio: "Los tres escenarios de validación fallan de forma controlada, muestran el error correspondiente y no permiten el acceso.",
  ),

  caso(
    "TCCJ-003",
    titulo: "Carrito y checkout conservan la misma cantidad de productos",
    prioridad: "Baja",
    tipo: "Integración / Sanidad",
    modulo: "Carrito y checkout",
    ambiente: "QA",
    objetivo: "Verificar que los productos y sus precios fluyen correctamente desde el catálogo hasta el resumen del checkout.",
    precondiciones: (
      estado: "Usuario con credenciales válidas y catálogo disponible.",
      usuario: "standard_user",
      configuracion: "Navegador con acceso a https://www.saucedemo.com/.",
    ),
    datos: (
      dato(dato: "Producto 1", valor: "Sauce Labs Backpack ($29.99)", origen: "SauceDemo"),
      dato(dato: "Producto 2", valor: "Sauce Labs Bike Light ($9.99)", origen: "SauceDemo"),
      dato(dato: "Datos de checkout", valor: "Nombre: Test; Apellido: User; Zip: 12345", origen: "Preparado"),
    ),
    pasos: (
      paso(
        accion: "Iniciar sesión con standard_user",
        dato: "standard_user / secret_sauce",
        esperado: "Se muestra la página de productos.",
      ),
      paso(
        accion: "Agregar Sauce Labs Backpack y Sauce Labs Bike Light al carrito",
        dato: "Backpack $29.99 / Bike Light $9.99",
        esperado: "El contador del carrito muestra 2 y ambos botones cambian a Remove.",
      ),
      paso(
        accion: "Abrir el carrito",
        dato: "Carrito con 2 productos",
        esperado: "Aparecen ambos productos con sus precios correctos y cantidad 1.",
      ),
      paso(
        accion: "Presionar Checkout, ingresar nombre, apellido y código postal, y presionar Continue",
        dato: "Test / User / 12345",
        esperado: "El resumen lista ambos productos, el Item total es $39.98 y el Total equivale al Item total más los impuestos.",
      ),
    ),
    criterio: "Los productos agregados aparecen con precios correctos, el contador del carrito coincide con la cantidad de productos, el Item total del checkout es la suma de los precios y el Total es el Item total más los impuestos.",
  ),

  caso(
    "TCCJ-004",
    titulo: "Compra de inicio a fin (camino feliz)",
    prioridad: "Alta",
    tipo: "Sistema / Aceptación",
    modulo: "Checkout / Compra",
    ambiente: "QA",
    objetivo: "Validar una compra completa desde el inicio de sesión hasta la confirmación y el regreso al catálogo.",
    precondiciones: (
      estado: "Usuario con credenciales válidas y catálogo disponible.",
      usuario: "standard_user",
      configuracion: "Navegador con acceso a https://www.saucedemo.com/.",
    ),
    datos: (
      dato(dato: "Producto", valor: "Sauce Labs Bolt T-Shirt", origen: "SauceDemo"),
      dato(dato: "Datos de checkout", valor: "Nombre: Test; Apellido: User; Zip: 12345", origen: "Preparado"),
    ),
    pasos: (
      paso(
        accion: "Iniciar sesión con standard_user",
        dato: "standard_user / secret_sauce",
        esperado: "Se muestra la página de productos.",
      ),
      paso(
        accion: "Agregar Sauce Labs Bolt T-Shirt al carrito",
        dato: "Bolt T-Shirt",
        esperado: "El contador del carrito muestra 1.",
      ),
      paso(
        accion: "Abrir el carrito y presionar Checkout",
        dato: "Carrito con 1 producto",
        esperado: "Se muestra Checkout: Your Information.",
      ),
      paso(
        accion: "Ingresar nombre, apellido y código postal, y presionar Continue",
        dato: "Test / User / 12345",
        esperado: "Se muestra Checkout: Overview.",
      ),
      paso(
        accion: "Presionar Finish",
        esperado: "Se muestra Thank you for your order!",
      ),
      paso(
        accion: "Presionar Back Home",
        esperado: "Se vuelve a la página de productos con el contador del carrito vacío.",
      ),
    ),
    criterio: "El usuario completa la compra, ve la confirmación y vuelve al catálogo con el carrito vacío.",
  ),

  caso(
    "TCCJ-005",
    titulo: "Ordenamiento del catálogo por precio",
    prioridad: "Baja",
    tipo: "Sanidad / Regresión",
    modulo: "Catálogo / Ordenamiento",
    ambiente: "QA",
    objetivo: "Comprobar que las opciones de ordenamiento reordenan correctamente la lista completa de productos.",
    precondiciones: (
      estado: "Usuario con credenciales válidas y catálogo disponible.",
      usuario: "standard_user",
      configuracion: "Navegador con acceso a https://www.saucedemo.com/.",
    ),
    datos: (
      dato(dato: "Opciones de orden", valor: "Name (A to Z), Price (low to high), Price (high to low), Name (Z to A)", origen: "SauceDemo"),
      dato(dato: "Producto de referencia", valor: "Sauce Labs Backpack", origen: "SauceDemo"),
    ),
    pasos: (
      paso(
        accion: "Iniciar sesión con standard_user",
        dato: "standard_user / secret_sauce",
        esperado: "El orden por defecto es Name (A to Z) y Sauce Labs Backpack aparece primero.",
      ),
      paso(
        accion: "Seleccionar Price (low to high)",
        dato: "Price (low to high)",
        esperado: "El orden es $7.99 Onesie, $9.99 Bike Light, $15.99 Bolt T-Shirt y Test.allTheThings() T-Shirt (Red) en cualquier orden, $29.99 Backpack, $49.99 Fleece Jacket.",
      ),
      paso(
        accion: "Seleccionar Price (high to low)",
        dato: "Price (high to low)",
        esperado: "El orden es exactamente el inverso del paso 2, con Fleece Jacket primero.",
      ),
      paso(
        accion: "Seleccionar Name (Z to A)",
        dato: "Name (Z to A)",
        esperado: "Test.allTheThings() T-Shirt (Red) aparece primero y Sauce Labs Backpack último.",
      ),
    ),
    criterio: "Cada opción de ordenamiento reordena la lista completa de productos según su criterio y el orden por defecto es Name (A to Z).",
  ),
)
