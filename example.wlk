// Se pide:
// a) Modelar a Julieta y los juegos mencionados, de forma tal 
// que podamos hacer que Julieta juegue y nos informe cuántos tickets
// tiene.

// ------------------------------------------------------------------
//  JUGADORES
// ------------------------------------------------------------------

object julieta {
  var tickets = 15    // me anticipo a que va a cambiar durante el programa ---> var property tickets = 15
  var cansancio = 0   // "arranca con un cansancio en cero"
  const punteria = 20
  
  method punteria() = punteria // o method punteria() = 20

  method fuerza() = 80 - cansancio  // para que se recalcule solo, a medida que se modifique la variable cansancio

  method tickets() = tickets  // para que nos informe cuantos tickets tiene julieta (getter)
  method tickets(ticketsNuevos) { tickets = ticketsNuevos } // (setter)

  method jugar(juego) {         // self es referencia al objeto mismo
    tickets = tickets + juego.ticketsGanados(self)          // extraigo las partes comunes a todos los juegos 
    cansancio = cansancio + juego.cansancioQueProduce()
  }

  method puedeCanjear(premio) = tickets >= premio.costo() 

}

// ------------------------------------------------------------------
//  JUEGOS
// ------------------------------------------------------------------

object tiroAlBlanco {
  method ticketsGanados(jugador) = (jugador.punteria() / 10).roundUp()  // roundUp() es para rendondear
  method cansancioQueProduce() = 3
}

object pruebaDeFuerza {
  method ticketsGanados(jugador) = if(jugador.fuerza() > 75) 20 else 0 // "si la fuerza del jugador es mayor a 75, gana 20 tickets, sino, gana 0"
  method cansancioQueProduce() = 8 
}

object ruedaDeLaFortuna {
  var aceitada = true // comieza aceitada ----> var property aceitada = true (property para que no se tenga que hacer el setter y el getter)

  method aceitada() = aceitada                        // para consultar sobre su estado (getter)
  method aceitada(nuevoValor) {aceitada = nuevoValor} // para modificar el estado (setter)
  
  method ticketsGanados(jugador) = 0.randomUpTo(20).roundUp()  // devolve un numero random, y luego redondeamelo en entero (es como una composicion de izq a derecha)
  method cansancioQueProduce() = if(aceitada) 0 else 1  // "si la rueda esta aceitada(true), no nos cansa, si no esta aceitada(falsa), causa 1 de cansancio"
}

// b) Extender el programa para saber si Julieta puede canjear alguno de los premios disponibles. 
// La mano viene dura y en la feria quedan solamente dos premios disponibles: 
// - Un osito de peluche que cuesta 45 tickets y 
// - un taladro rotopercutor Bosch de 750w y mandril de 13mm, cuyo costo el dueño de la feria ajusta todos
// los días en base al precio del dólar.

// ------------------------------------------------------------------
//  PREMIOS
// ------------------------------------------------------------------
object ositoDePeluche {
  method costo() = 45
}

object taladroRotopercutor {
  //var property dolar = 500
  //method costo() = dolar
  var property costo = 200 // lo inicializo con algo por lo menos 
}

// c) Agregar al sistema a Gerundio, otro chico más que visita la feria. 
// Geru es el hijo del dueño así que no necesita juntar tickets y puede canjear el premio que quiera cuando quiera. 
// Para pensar: ¿Qué mensajes necesita entender Gerundio?

object gerundio {
  method jugar(juego) {}
  method puedeCanjear(premio) = true
}

