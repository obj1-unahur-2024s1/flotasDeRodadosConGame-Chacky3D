import wollok.game.*

object corsa {
	
	var imagen = "autitoAzul.png"
	var position = game.at(0,0)
	
	/*const color
	
	method capacidadDePasajeros() { return 4 }
	method velocidadMaxima() { return 150 }
	method peso() { return 1300 }
	method color() { return color }*/
	
	method imagen() { return imagen }
	method imagen(nuevaImagen) { imagen = nuevaImagen }
	method position() { return position }
	method position(nuevaPosicion) { position = nuevaPosicion }
	
}