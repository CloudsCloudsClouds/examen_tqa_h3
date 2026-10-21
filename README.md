# examen_tqa_h3
Daniel Bernal

Esto es principalmente un examen de TQA, pero en cierta forma tambien es un experimento sobre hacer TQA de forma correcta con asistencia de IA. O agentes de IA.

Ojo. El bulto del trabajo es hecho por mi persona, pero me estoy asistiendo por agentes de IA locales. Todo el contenido hecho por IA es marcado como tal.

(En cierta forma siento que me estoy disparando en el pie al usar agentes de IA, porque no tengo mucha experiencia con esto. ¿¿Porque estoy haciendo esto?? Seria más rapido hacerlo todo de golpe a mano.)

En todo caso, estoy creando un AGENTS.md

Realmente seria más rapido hacerlo por mi cuenta...

## Commits
Quiero notar que los commits que hago son algo desordenados.

Pero mantengo algo constante. Cada actividad del examen tiene su commit. No veo proposito a complicarme la vida en esta ocacion con ramas.

Cierto. Github. El board y eso...

Voy a seguir un flow correcto.

---

> 🤖 **Sección generada por IA** · agente: OpenCode · modelo: DeepSeek V4.1 Flash · 2026-10-20 · fuente: `Examen_Practico_Hito_3_TQA_Instrucciones.pptx` · revisión humana: pendiente
>
> `[IA]` Resumen del enunciado del Hito 3. Daniel debe revisarlo y corregirlo.

## Resumen del examen (Hito 3) · [IA]

**Modalidad:** individual · **Tiempo sugerido:** 90 minutos.
**Aplicación bajo prueba:** [SauceDemo (Swag Labs)](https://www.saucedemo.com/). Usar los usuarios de demostración indicados en la página.

### Actividades y entregables

| Actividad | Entregable | Puntos clave |
| --- | --- | --- |
| Caja negra | 5 casos funcionales ejecutados | Casos distintos y con propósito. Cada uno: ID/título, precondiciones, datos, pasos, resultado esperado y obtenido, Passed/Failed y evidencia. |
| Caja blanca | Análisis + 3 casos diseñados | Identificar decisiones y condiciones, indicar criterio (sentencias, decisiones o condiciones), calcular el mínimo de casos, justificar cobertura y explicar qué ajuste haría falta si 3 casos no alcanzan. |
| Gherkin | Al menos 2 escenarios | Uno exitoso y uno alternativo o de error. Usar `Feature`, `Scenario`, `Given`, `When`, `Then`; se permite `And`/`But`. |
| Bugs | Defectos reproducibles | ID/título, descripción, precondiciones y datos, pasos, resultado esperado y actual, evidencia y severidad/prioridad. Si la prueba pasa, registrar `Passed`; no inventar bugs. |
| GitHub | Repositorio individual | README, archivos Markdown, Issues y Project Board. Usar Git desde terminal y commits descriptivos. |
| Informe | 1 PDF consolidado | Introducción y URL, los 5 casos y resultados, bugs y evidencias, análisis de caja blanca, escenarios Gherkin y conclusiones. |

### Código de caja blanca

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

Entradas: `edad`, `cuenta_activa`, `saldo`, `monto`. Salidas: no permitida (edad), no permitida (cuenta), aprobada o rechazada.

### Estructura sugerida del repositorio

```text
Examen-Hito-3-TQA/
├── README.md
├── docs/
│   ├── casos_caja_negra.md
│   ├── analisis_caja_blanca.md
│   └── escenarios_gherkin.md
├── bugs/
│   └── bugs_encontrados.md
├── evidencias/
│   └── capturas/
└── entregable/
    └── informe_hito3.pdf
```

### Board de GitHub

Columnas: `To Do`, `In Progress`, `In Review`, `Done`.

Tareas: diseñar casos, analizar código, redactar Gherkin, ejecutar pruebas, registrar resultados, documentar bugs, revisar evidencias, revisar informe, preparar PDF y actualizar README.

### Entrega final

Enviar por Moodle el enlace del repositorio y el informe final en PDF. El repositorio debe incluir los 5 casos con resultados, el análisis de caja blanca con 3 casos, los bugs con evidencia, los escenarios Gherkin, el Project Board con Issues y el PDF consolidado.

---

Esto es contenido mio. Que interesante. Pero debo diferenciar mejor entre el trabajo hecho por IA y por mi.

No voy a dejar que la IA vuelva a trabajar en este archivo.

Por conveniencia, converti las plantillas a typst - basicamente latex pero mas bonito de usar.
(Tambien lo uso para mi integrador y un generador de reportes.)

## Objetivos
### Caja negra
Voy a documentar aquí mi trabajo hecho en www.saucedeomo.com y entonces dejare que la IA llene las plantillas y los reportes de bugs. Incluire documentacion y pruebas.

Porsiacaso tambien añadire git lfs

... cierto. Hay que hacer avance en proyectos de github...

Listo. Trabajare principalmente en github con los issues y pull requests. Listo, ya entiendo porque usar ramas.


Volviendo aquí.

#### TCCJ-001
Loggeado valido llega hasta la pagina de productos. 
- Smoke, unit
- Confirma que el usuario standar puede logear y llegar al catalogo.
- Pasos
  - Ve a www.saucedemo.com
  - loggea usando `standard_user` con `secret_sauce` como contraseña.
  - Cliquea `LOGIN`
- Requerimientos: Un usuario registrado y productos con los cuales llegar al catalogo.
- Importante, si falla todo los demas son invalidos

#### TCCJ-002
Validacion del campo de login
- Comprueba la validacion de los campos. Cada campo que falle debe registrar su fallo y el usuario se debe quedar en el inicio de sesion
- Sanity, unit
- Pasos
  - Abre pagina login (saucedemo), deja usuario vacio e ingresa contraseñá `secret_sauce`, cliquea `LOGIN`. Resultado esperado: Fallo, aun en login.
  - Entra `standard_user`, deja contraseña vacia y da `LOGIn`. Resultado esperado: Fallo, aun en login.
  - Mete `standard_user` y `wrong_password` y cliquea `LOGIN`. Resultado esperado: Fallo, especifico sobre "usuario u contraseña incorrecto". Aun en login.
- Requerimientos. Ninguno.
- Importante, pero menos importante que TCCJ-001.

#### TCCJ-003
Carrito y checkout tienen misma cantidad de items seleccionados
- Verifica que los datos fluyen de forma correcta.
- Integracion, sanidad
- Pasos
  - Login `standard_user`
  [Esto de aquí esta hecho con IA. No hay tiempo. TRADUCIR AL ESPAÑOL EN DOCUMENTO PRESENTABLE]
  - Click “Add to cart” on Sauce Labs Backpack ($29.99) and Sauce Labs Bike Light ($9.99). Expected: cart badge shows 2, and both buttons change to “Remove”.
  - Open the cart. Expected: both items listed with correct prices and quantity 1.
  - Click Checkout, enter any first name, last name, and zip code, then click Continue. Expected: overview lists both items, Item total is $39.98, and Total equals Item total plus Tax.
- Requirements: Items added to the cart appear with correct prices, the badge count matches the cart, the checkout item total equals the sum of item prices, and the order total equals item total plus tax.
- No muy importante, pero para que funcione necesita muchas cosas funcionando. Util.

#### TCCJ-004
Compra de inicio a fin
- Sistema, Aceptacion
- Un camino feliz. Testea compra de un producto desde loggeado a fin.
- Pasos
[IA, TRADUCE]
  - Log in as standard_user with secret_sauce. Expected: Products page.
  - Add Sauce Labs Bolt T-Shirt to the cart. Expected: badge shows 1.
  - Open the cart and click Checkout. Expected: “Checkout: Your Information”.
  - Enter First Name Test, Last Name User, and Zip 12345, then click Continue. Expected: “Checkout: Overview”.
  - Click Finish. Expected: “Thank you for your order!” is displayed.
  - Click Back Home. Expected: Products page with an empty cart badge.
- Requirements: A logged-in user can complete a purchase, see an order confirmation, and return to the catalog with an empty cart.
- Importante. Muy importante.

#### TCCJ-005
Ordenado por precio
- Sanidad, regresion
- Se rompe facil, es lo mas probable que este mal tras hacer un cambio.
- Pasos
[IA, TRADUCE AL ESPAÑOL]
  - Log in as standard_user. Expected: sort defaults to “Name (A to Z)”, with Sauce Labs Backpack first.
  - Select “Price (low to high)”. Expected: order is $7.99 Onesie, $9.99 Bike Light, $15.99 Bolt T-Shirt and Test.allTheThings() T-Shirt (Red) in either order, $29.99 Backpack, $49.99 Fleece Jacket.
  - Select “Price (high to low)”. Expected: exact reverse of step 2, with Fleece Jacket first.
  - Select “Name (Z to A)”. Expected: Test.allTheThings() T-Shirt (Red) first, Sauce Labs Backpack last.
- Requirements: Each sort option reorders the full product list by its criterion, and the default sort is Name (A to Z).
- No muy importante. Pero util de tener cerca.

### Caja blanca
Lo mismo. Test cases. Usar misma plantilla.

Cobertura de sentencias, decisiones, condiciones, y una justificacion.

#### TCCB-001
Validar edad de compra
- Solo ver si eres mayor a 18.
- Pasos
	- Correr funcion con 17: Fallo
	- Correr funcion con 18: Exito

#### TCCB-002
Validar que la funcion corre
- Solo ver si la funcion puede correr para comenzar
- Pasos
	- Correr TCCB-001
	- No falla por ejecucion
	- Correr TCCB-003
	- Falla por condicioines

#### TCCB-003
Validar no acepta letras
- Ver que la funcion falle por condiciones incorrectas
- Pasos
	- Correr `validar_compra("ab", "true", "cien", "A lot"):`
	- La funcion falla
