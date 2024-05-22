import wollok.game.*

class Corsa {
	
	const color
	
	method capacidadDePasajeros() { return 4 }
	method velocidadMaxima() { return 150 }
	method peso() { return 1300 }
	method color() { return color }
	
}

class RenaultKwid{
	
	var tieneTanqueAdicional = false
	
	method capacidadDePasajeros() { return if (tieneTanqueAdicional) 3 else 4}
	method velocidadMaxima() { return if (tieneTanqueAdicional) 110 else 120 }
	method peso() { return if (tieneTanqueAdicional) 1350 else 1200 }
	method color() { return "Azul" }
	method agregarOQuitarTanque() { tieneTanqueAdicional = !tieneTanqueAdicional }
	
}

object trafic{
	
	var interior = interiorComodo
	var motor = motorPulenta
	
	method cambiarInterior() { interior = if(interior.equals(interiorComodo)) interiorPopular else interiorComodo }
	method cambiarMotor() { motor = if(motor.equals(motorPulenta)) motorBataton else motorPulenta }
	method capacidadDePasajeros() { return interior.capacidadDePasajeros() }
	method velocidadMaxima() { return motor.velocidadMaxima() }
	method peso() { return interior.peso() + motor.peso() + 4000 }
	method color() { return "Blanco" }
	
}

object interiorComodo{
	
	method capacidadDePasajeros() { return 5 }
	method peso() { return 700 }
	
}

object interiorPopular{
	
	method capacidadDePasajeros() { return 12 }
	method peso() { return 700 }
	
}

object motorPulenta{
	
	method velocidadMaxima() { return 130 }
	method peso() { return 800 }
	
}

object motorBataton{
	
	method velocidadMaxima() { return 80 }
	method peso() { return 500 }
	
}

class AutoEspecial{
	
	const capacidadDePasajeros
	const velocidadMaxima
	const peso
	const color
	
	method capacidadDePasajeros() { return capacidadDePasajeros }
	method velocidadMaxima() { return velocidadMaxima }
	method peso() { return peso }
	method color() { return color }
	
}