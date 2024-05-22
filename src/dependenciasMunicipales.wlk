import vehiculos.*

class DependenciaMunicipal {
	
	const cantidadDeEmpleados
	const flotaDeRodados = #{}
	const pedidos = #{}
	
	method agregarAFlota(rodado) { flotaDeRodados.add(rodado) }
	method quitarDeFlota(rodado) { flotaDeRodados.remove(rodado) }
	method pesoTotalFlota() { return flotaDeRodados.map({ rodado => rodado.peso() }).sum() }
	method estaBienEquipada() { 
		return flotaDeRodados.size() > 3 and flotaDeRodados.map({ rodado => rodado.velocidadMaxima() }).all({ rodado => rodado >= 100 })
	}
	method capacidadTotalEnColor(color) { 
		return flotaDeRodados.filter({ rodado => rodado.color().equals(color) }).map({ rodado => rodado.capacidadDePasajeros() }).sum()
	}
	method colorDelRodadoMasRapido() { return flotaDeRodados.max({ rodado => rodado.velocidadMaxima() }).color() }
	method capacidadFaltante() { return cantidadDeEmpleados - flotaDeRodados.map({ rodado => rodado.capacidadDePasajeros() }).sum() }
	method esGrande() { return cantidadDeEmpleados >= 40 and flotaDeRodados.size() >= 5 }
	method agregar(pedido) { pedidos.add(pedido) }
	method quitar(pedido) { pedidos.remove(pedido) }
	method totalDePasajeros() { return pedidos.map({ pedido => pedido.cantidadDePasajeros() }).sum() }
	method pedidosImposiblesDeSatisfacer() {
		return pedidos.filter({ pedido => !pedido.algunVehiculoPuedeSatisfacer(flotaDeRodados) })
	}
	method todosIncompatiblesCon(color) { 
		return pedidos.all({ pedido => !pedido.coloresIncompatibles().intersection(#{color}).isEmpty() })
	}
	method relajarPedidos() { pedidos.forEach({ pedido => pedido.relajar() }) }
	
}

class Pedido{
	
	const distanciaARecorrer
	var tiempoMaximo
	const cantidadDePasajeros
	const coloresIncompatibles = #{}
	
	method tiempoMaximo() { return tiempoMaximo }
	method cantidadDePasajeros() { return cantidadDePasajeros }
	method coloresIncompatibles() { return coloresIncompatibles }
	method velocidadRequerida() { return distanciaARecorrer / tiempoMaximo}
	method puedeSatisfacerUnPedido(auto) { 
		return auto.velocidadMaxima() > self.velocidadRequerida() + 10 and auto.capacidadDePasajeros() >= cantidadDePasajeros and
			coloresIncompatibles.all({ color => color != auto.color() })
	}
	method algunVehiculoPuedeSatisfacer(vehiculos){
		return vehiculos.any({ vehiculo => self.puedeSatisfacerUnPedido(vehiculo) })
	}
	method acelerar() { tiempoMaximo = tiempoMaximo - 1 }
	method relajar() { tiempoMaximo = tiempoMaximo + 1 }
}







