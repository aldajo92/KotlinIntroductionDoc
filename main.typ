#import "@preview/may:0.1.1": *
#import "@preview/wrap-it:0.1.1": *
#show: may
// Some other variants
// #show: may-serif

// Configurar idioma en español
#set text(lang: "es")
#set figure(supplement: "Figura")

// Personalizar código inline: sin fondo
#show raw.where(block: false): it => text(font: "DejaVu Sans Mono", size: 0.9em, fill: rgb("#1e5c99"))[#it.text]

= Introducción a Kotlin

#align(center)[
  _By Alejandro Gomez Florez (\@aldajo92)_
  _Ingeniero de Control | Ms Matemáticas aplicadas_

]

>| Guia en desarrollo.

Hola, espero que te encuentres de maravilla. Desde el 2016 he tenido la oportunidad de trabajar en grandes proyectos móviles tales como:

- Zelle [2016-2017]: Aplicación para transacción de dinero entre bancos en EE.UU como Chase, Wells Fargo, Bank of America, entre otros.
- Rappi  [2017-2019]: App usada ampliamente en Latinoamérica; contribuí en la infraestructura, así como en diferentes secciones como restaurantes, Rappi Favor y pago de facturas.
- Disney World App [2019-2021]: App para navegar en los parques de Disney como Walt Disney World, Disneyland Resort, Animal Kingdom, EPCOT y Hollywood Studios, entre otros.
- #link("http://All.Health")[All.Health] [2021-2022]: Startup enfocada en diagnóstico y prevención de enfermedades usando teléfonos móviles, empleando un smart band que detecta signos vitales.

#figure(
  image("images/kotlin_banner.png", width: 100%),
  caption: [
    _Fuente:_ #link("https://developersbreach.com/kotlin-java-and-interoperability/")
  ],
) <fig:kotlin-vm>


Es para mí un gusto poder desarrollar esta guía, inspirada en aspectos que tomé del aprendizaje autónomo, alejada un poco del formalismo académico. Me he puesto en su lugar ya que en algun momento tambien fui un principiante; el desarrollo de apps móviles no es algo que se imparta formalmente en universidades o academias; por lo tanto, les brindaré consejos útiles para que puedan abordar el aprendizaje de manera practica. Vamos a empezar con un par de aspectos a considerar:

- Kotlin es un lenguaje de programación que se compila usando el compilador `kotlinc` a bytecode (.class) para ser ejecutado en la JVM (Java Virtual Machine), como se muestra en la @fig:kotlin-vm.
- Kotlin nace de la necesidad de poder trabajar con la JVM y con el Android Runtime, usando un lenguaje open source que no requiera licencia.
- Hasta 2017 Java era el lenguaje oficial para el desarrollo de apps móviles; luego Google hizo oficial Kotlin ese año.
- Kotlin y Java son compatibles, pero requiere experiencia y paciencia para trabajar con ambos lenguajes. No es necesario saber Java para empezar a programar en Kotlin.
- Actualmente Kotlin se usa para trabajar en diferentes áreas, no solo en mobile:
  - Se usa para crear sistemas del lado del backend con frameworks como #link("https://spring.io/projects/spring-framework")[Spring].
  - Gracias a la versión #link("https://kotlinlang.org/docs/multiplatform.html")[Kotlin Multiplatform] se puede también usar para generar apps para otros dispositivos más allá de Android, como iOS y web.
- Cuenta con una amplia documentación, además de poder correrse en un playground de forma gratuita y sin necesidad de registrarse. #link("https://play.kotlinlang.org/")

== Contenido complementario

Aprender cualquier lenguaje requiere de práctica y paciencia. Así como los gimnasios los podemos usar para entrenar nuestros músculos, existen formas equivalentes para entrenar nuestra capacidad de programar y de resolver problemas a nuestro ritmo. Es por ello que recomiendo un par de sitios web donde pueden practicar y repasar conceptos:

- #link("https://leetcode.com/")[Leetcode.com]: Sitio web donde pueden practicar problemas de programación y algoritmos empleados en entrevistas de trabajo de empresas como Google, Amazon, Microsoft, entre otras.
- #link("https://github.com/alidehkhodaei/kotlin-cheat-sheet")[Kotlin cheat sheet]: Repositorio con un cheat sheet de Kotlin para repasar conceptos del lenguaje.
- #link("https://devhints.io/kotlin")[Kotlin Devhints]: Resumen con pequeñas cartas (cards) con la sintaxis y ejemplos prácticos.
- #link("https://www.programiz.com/kotlin-programming")[Programiz]: Sitio web con tutoriales y ejercicios para aprender Kotlin.



== Primeros pasos

Vamos a revisar el siguiente código (usar este enlace https://pl.kotl.in/sCnSFbDSI para verlo en el navegador):

```kotlin
// Conversor de millas a km
fun main(){
    // Definimos la entrada
    val millas = 36

    // Definimos la operacion: 1 milla -> 1.609 km. milla*1.609 [km]
    val kilometros = millas * 1.609

    // Definimos la salida
    println(kilometros)
}
```

A partir del codigo anterior se recomienda tener en cuenta los siguientes conceptos para empezar:

- El comentario se realiza con el símbolo `//` seguido del texto del comentario.
```kotlin
// Este es un comentario
```

- El bloque `main` es el punto de entrada de una aplicación Kotlin. Se define como una función con la palabra reservada `fun` seguido del nombre de la funcion, en este caso `main`. El nombre de la funcion es libre, pero `main` es un nombre reservado.
```kotlin
fun main(){
    // Bloque de codigo
}
```

- Las variables se definen con la palabra reservada `val` para variables inmutables y `var` para variables mutables.
```kotlin
val nombre = "Juan"
var edad = 20
```

- Las operaciones se realizan con los operadores aritméticos tradicionales: `+`, `-`, `*`, `/`, `%`.
```kotlin
val resultado = 10 + 5
```

- La función `println` se usa para imprimir un mensaje en la consola.
```kotlin
println("Hola, mundo!")
```

== Tipos de datos

Aca hay una lista de los tipos de datos más comunes en Kotlin:

```kotlin
    val booleanVar: Boolean = true
    val byteVar: Byte = 127
    val shortVar: Short = 32767
    val intVar: Int = 2147483647
    val longVar: Long = 9223372036854775807L
    val floatVar: Float = 3.14f
    val doubleVar: Double = 3.14159265358979323846
    val charVar: Char = 'A'
    val stringVar: String = "Hello, world!"
```

En el ejemplo anterior se puede observar que las variables se definen con un tipo de dato explícito usando el formato `val nombre: Tipo = valor`. Esta es una forma opcional de declarar el tipo de dato, pero gracias a la inferencia de tipos de Kotlin no es necesario especificarlo explícitamente. Por lo tanto, lo siguiente es equivalente al ejemplo anterior:

```kotlin
    val booleanVar = true
    val byteVar = 127
    val shortVar = 32767
    val intVar = 2147483647
    val longVar = 9223372036854775807L
    val floatVar = 3.14f
    val doubleVar = 3.14159265358979323846
    val charVar = 'A'
    val stringVar = "Hello, world!"
```

Las variables en Kotlin también pueden declararse sin un valor inicial, pero en ese caso, el tipo debe especificarse explícitamente:

```kotlin
var z: Double // Válido, z no tiene valor inicial
// println(z) // Inválido, z no está inicializada y no tiene valor aún
z = 3.14     // Válido, z es inicializada con un valor
```

Tipos de conversiones:
```kotlin
    val str: String = "123"
    val num: Int = str.toInt() // Convert String to Int

    val dbl: Double = 123.45
    val int: Int = dbl.toInt() // Convert Double to Int

    val lng: Long = 9876543210
    val flt: Float = lng.toFloat() // Convert Long to Float

    val bol: Boolean = true
    val strBol: String = bol.toString() // Convert Boolean to String

    val char: Char = 'A'
    val intChar: Int = char.code // Convert Char to Int usando la propiedad .code

    val byte: Byte = 127
    val short: Short = byte.toShort() // Convert Byte to Short
```

== Funciones

#figure(
  image("images/function.png", width: 80%),
  caption: [Anatomía de una función: \
    #link("https://www.geeksforgeeks.org/kotlin/kotlin-functions/")],
) <fig:function-anatomy>

En Kotlin, las funciones se definen usando la palabra reservada `fun` seguido del nombre de la función. Las funciones son bloques de código reutilizables que realizan una tarea específica.

Función básica sin parámetros y sin retorno:
```kotlin
fun saludar() {
    println("¡Hola, mundo!")
}

fun main() {
    saludar() // Imprime: ¡Hola, mundo!
}
```

Funciones con parámetros:
```kotlin
fun saludar(nombre: String) {
    println("¡Hola, $nombre!")
}

fun main() {
    saludar("Juan")  // Imprime: ¡Hola, Juan!
    saludar("María") // Imprime: ¡Hola, María!
}
```

Funciones con múltiples parámetros:
```kotlin
fun sumar(a: Int, b: Int) {
    val resultado = a + b
    println("La suma es: $resultado")
}

fun main() {
    sumar(5, 3)   // Imprime: La suma es: 8
    sumar(10, 20) // Imprime: La suma es: 30
}
```

Funciones con valor de retorno:
```kotlin
fun sumar(a: Int, b: Int): Int {
    return a + b
}

fun main() {
    val resultado = sumar(5, 3)
    println(resultado) // Imprime: 8
}
```

Funciones con parámetros por defecto:
```kotlin
fun saludar(nombre: String = "Usuario", edad: Int = 0) {
    println("Hola $nombre, tienes $edad años")
}

fun main() {
    saludar()                    // Imprime: Hola Usuario, tienes 0 años
    saludar("Ana")               // Imprime: Hola Ana, tienes 0 años
    saludar("Carlos", 25)        // Imprime: Hola Carlos, tienes 25 años
    saludar(edad = 30, nombre = "Luis") // Argumentos con nombre
}
```

Funciones de expresión única:
```kotlin
fun doble(x: Int): Int = x * 2

fun esParOrImpar(numero: Int): String = if (numero % 2 == 0) "Par" else "Impar"

fun main() {
    println(doble(5))        // Imprime: 10
    println(esParOrImpar(4)) // Imprime: Par
    println(esParOrImpar(7)) // Imprime: Impar
}
```

Ejemplo práctico con calculadora simple:
```kotlin
fun calcular(operacion: String, a: Int, b: Int): Int {
    return when (operacion) {
        "sumar" -> a + b
        "restar" -> a - b
        "multiplicar" -> a * b
        "dividir" -> a / b
        else -> 0
    }
}

fun main() {
    println(calcular("sumar", 10, 5))       // Imprime: 15
    println(calcular("restar", 10, 5))      // Imprime: 5
    println(calcular("multiplicar", 10, 5)) // Imprime: 50
    println(calcular("dividir", 10, 5))     // Imprime: 2
}
```


== Arrays & Collections

Arrays en Kotlin se definen usando las funciones `arrayOf`, `intArrayOf`, `doubleArrayOf`, `charArrayOf`, `booleanArrayOf`, `shortArrayOf` y `byteArrayOf`.

```kotlin
    val numbers: IntArray = intArrayOf(1, 2, 3, 4, 5)
    val names: Array<String> = arrayOf("John", "Jane", "Jim", "Jill")
    val mixed: Array<Any> = arrayOf(1, "two", 3.0)
```

Los arrays, en general, son un tipo de estructura de dato que permite almacenar un conjunto de elementos del mismo tipo, con un tamaño fijo. En Kotlin los arrays son *mutables en su contenido* (se puede hacer `array[i] = nuevoValor`), pero su *tamaño es inmutable*: no se pueden agregar o eliminar posiciones sin crear un nuevo array. Se pueden declarar de diferentes maneras:
```kotlin
// 1. Usando arrayOf con valores iniciales
val array1 = arrayOf(1, 2, 3, 4, 5)

// 2. Usando intArrayOf para arrays de tipo primitivo Int
val array2 = intArrayOf(1, 2, 3, 4, 5)

// 3. Declarando un array de un tamaño fijo, inicializado con un valor
val array3 = Array(5) { 0 } // Array de 5 elementos, todos ceros

// 4. Arrays de otro tipo específico
val array4 = DoubleArray(5) // Todos los valores serán 0.0 por defecto

// 5. Inicialización personalizada usando un índice
val array5 = Array(5) { i -> i * i } // [0, 1, 4, 9, 16]

// 6. Usando emptyArray para un array vacío, luego se puede llenar
val array6 = emptyArray<String>()

```

Acceso a los elementos de un array:
```kotlin
    val array = arrayOf(7, 3, 9, 1, 5)
    println(array[0]) // Imprime 7
    println(array[1]) // Imprime 3
    println(array[2]) // Imprime 9
    println(array[3]) // Imprime 1
    println(array[4]) // Imprime 5
```

Modificación de los elementos de un array:

```kotlin
    val array = arrayOf(7, 3, 9, 1, 5)
    array[0] = 10 // Modifica el primer elemento a 10
    println(array[0]) // Imprime 10
```

Eliminación de elementos de un array (creando un nuevo array sin los dos primeros elementos):

```kotlin
    var array = arrayOf(7, 3, 9, 1, 5)
    array = array.drop(2).toTypedArray() // Elimina los dos primeros elementos
    println(array.contentToString()) // Imprime [9, 1, 5]
```

Tamaño de un array:
```kotlin
    val array = arrayOf(7, 3, 9, 1, 5)
    println(array.size) // Imprime 5
```

En Kotlin, las *collections* permiten almacenar y gestionar conjuntos de elementos del mismo tipo, con tamaño variable. Existen colecciones *inmutables* (solo lectura), como `List`, `Set` y `Map`, que se crean con `listOf`, `setOf` y `mapOf`, y colecciones *mutables* que permiten modificar su contenido, como `MutableList`, `MutableSet` y `MutableMap`, creadas con `mutableListOf`, `mutableSetOf` y `mutableMapOf`:

```kotlin
    // Lista inmutable (permite elementos repetidos)
    val list: List<Int> = listOf(1, 2, 3, 4, 5)
    // Set inmutable (no permite elementos repetidos)
    val set: Set<String> = setOf("one", "two", "three")
    // Map inmutable (clave-valor)
    val map: Map<String, Int> = mapOf("one" to 1, "two" to 2, "three" to 3)

    // Lista mutable
    val mutableList: MutableList<Int> = mutableListOf(1, 2, 3, 4, 5)
    // Set mutable
    val mutableSet: MutableSet<String> = mutableSetOf("one", "two", "three")
    // Map mutable
    val mutableMap: MutableMap<String, Int> = mutableMapOf("one" to 1, "two" to 2, "three" to 3)
```

Acceso a los elementos de una collection:
```kotlin
    val list = listOf(1, 2, 3, 4, 5)
    println(list[0]) // Imprime 1
    println(list[1]) // Imprime 2
    println(list[2]) // Imprime 3
    println(list[3]) // Imprime 4
    println(list[4]) // Imprime 5
```

Modificación de los elementos de una collection (lista mutable):
```kotlin
    val list = mutableListOf(1, 2, 3, 4, 5)
    list[0] = 10 // Modifica el primer elemento a 10
    // Ejemplo para eliminar un elemento de una lista mutable:
    list.removeAt(0) // Elimina el primer elemento de la lista
    println(list[0]) // Imprime 10
```

== Strings

En Kotlin, las cadenas de texto se representan con el tipo `String`, que es una *secuencia inmutable de caracteres*. Aunque no es técnicamente un array, se comporta de manera similar: se puede acceder a caracteres individuales por índice usando corchetes (`str[0]`), obtener su longitud con `str.length`, e iterarlos. Sin embargo, a diferencia de los arrays, los `String` son inmutables, por lo que no puedes modificar un carácter individual directamente.

Se pueden crear de diferentes maneras:
```kotlin
    val str1 = "Hola, mundo!"
    val str2 = """Hola, mundo!"""
    val str3 = """
    Hola, mundo!
    """
```

Acceso a caracteres individuales:
```kotlin
    val str = "Hola, mundo!"
    println(str[0]) // Imprime 'H'
    println(str[1]) // Imprime 'o'
    println(str[2]) // Imprime 'l'
    println(str[3]) // Imprime 'a'
    println(str[4]) // Imprime ','
```

Longitud de un string:
```kotlin
    val str = "Hola, mundo!"
    println(str.length) // Imprime 12
```

Iteración sobre los caracteres de un string:
```kotlin
    val str = "Hola, mundo!"
    for (char in str) {
        println(char) // Imprime cada carácter del string
    }
```

Concatenación de strings:
```kotlin
    val str1 = "Hola, "
    val str2 = "mundo!"
    val str3 = str1 + str2
    println(str3) // Imprime "Hola, mundo!"
```

Template strings:
```kotlin
    val name = "Juan"
    val age = 20
    val str = "Hola, $name! Tienes $age años."
    println(str) // Imprime "Hola, Juan! Tienes 20 años."
```

Busqueda de subcadenas:
```kotlin
    val str = "Hola, mundo!"
    println(str.contains("mundo")) // Imprime true
    println(str.contains("Hola")) // Imprime true
    println(str.contains("hola")) // Imprime false
```

== Flow Control

#figure(
  image("images/control_flow.png"),
  caption: [Representación visual "Control Flow".],
) <fig:control-flow-diagram>

El control flow se refiere a la forma en la que se condiciona el flujo de ejecución de un programa. En Kotlin, se puede controlar el flujo de ejecución usando las palabras reservadas: `if`, `else`, `when`, `for`, `while`, `do-while`.

```kotlin
    // Estructura de control if exclusivo
    val numero = 7
    if (numero > 0) {
        println("El número es positivo")
    }
```

```kotlin
    // Estructura de control if-else
    val x = 10
    if (x > 5) {
        println("x es mayor a 5")
    } else {
        println("x es menor o igual a 5")
    }
```

```kotlin
    // Estructura de control if-else if-else (múltiples condiciones)
    val nota = 85
    if (nota >= 90) {
        println("Excelente")
    } else if (nota >= 80) {
        println("Muy bien")
    } else if (nota >= 70) {
        println("Bien")
    } else if (nota >= 60) {
        println("Suficiente")
    } else {
        println("Insuficiente")
    }
```

Ejemplo práctico con argumentos y flujo de control:
```kotlin
fun main(args: Array<String>) {
    // Verificar si hay argumentos
    if (args.isEmpty()) {
        println("No se proporcionaron argumentos.")
    } else {
        val comando = args[0]

        // Evaluar el comando recibido
        if (comando == "saludar") {
            println("¡Hola! Bienvenido al programa.")
        } else if (comando == "ayuda") {
            println("Comandos disponibles: saludar, ayuda, salir")
        } else if (comando == "salir") {
            println("¡Hasta luego!")
        } else {
            println("Comando no reconocido: $comando")
        }
    }
}
```

Una forma mas optima:
```kotlin
fun main(args: Array<String>) {
   // Verificar si hay argumentos
   if (args.isEmpty()) {
       println("No se proporcionaron argumentos.")
       return
   }

   val comando = args[0]

   // Evaluar el comando recibido
   if (comando == "saludar") {
       println("¡Hola! Bienvenido al programa.")
   } else if (comando == "ayuda") {
       println("Comandos disponibles: saludar, ayuda, salir")
   } else if (comando == "salir") {
       println("¡Hasta luego!")
   } else {
       println("Comando no reconocido: $comando")
   }
```

Ejemplo con números:
```kotlin
fun main(args: Array<String>) {
   if (args.isEmpty()) {
       println("No se proporcionaron argumentos.")
       return
   }

   val numero = args[0].toInt()

   if (numero > 0) {
       println("El número es positivo")
   } else if (numero < 0) {
       println("El número es negativo")
   } else {
       println("El número es cero")
   }
}
```


// == Operadores

// == Tables and Wraps

// #wrap-content(
//   figure(table(
//     columns: 3,
//     "Benchmark", "A/%", "B/%",
//     table.hline(),
//     "jo", "13.3", "33.2",
//     "jojo", "11.1", "28.3",
//     "ours", "100.0", "100.0",
//     table.hline()
//   ), caption: [A sample table, ours is the best.]),
//   lorem(60),
//   align: right
// )

// == Codeblocks and Formulas

// $
// vb(x)_(t+1) &= sqrt(macron(alpha)_t) vb(x)_0 + sqrt(1 - macron(alpha)_t) vb(epsilon) quad &"Forward"\
// vb(x)_(t-1) &= 1/sqrt(1 - beta_t) (vb(x)_t - (beta_t)/sqrt(1 - macron(alpha)_t) vb(epsilon)_theta (vb(x)_t, t)) + sqrt(beta_t) vb(epsilon) quad &"Backward"
// $

// ```python
// // DDPM step
// def p_sample_ddpm(self, model: nn.Module, x_t: torch.Tensor, t: torch.Tensor):
//     eps = model(x_t, t)
//     beta_t = self.betas[t][:, None, None, None]
//     alpha_t = self.alphas[t][:, None, None, None]
//     alpha_bar_t = self.alpha_bars[t][:, None, None, None]
//     sqrt_one_minus_alpha_bar_t = self.sqrt_one_minus_alpha_bars[t][:, None, None, None]
//     mean = 1 / torch.sqrt(alpha_t) * (x_t - beta_t / sqrt_one_minus_alpha_bar_t * eps)
//     if (t == 0).all():
//         return mean
//     noise = torch.randn_like(x_t)
//     sigma = torch.sqrt(beta_t)
//     return mean + sigma * noise
// ```
