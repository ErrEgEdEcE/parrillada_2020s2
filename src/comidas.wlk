class Comida {
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante() {return self.peso() > 250}
}

class Provoleta inherits Comida {
	var property tieneEspecias
	var peso
	
	override method peso() {return peso}
	
	override method esAptoVegetariano() {
		return not tieneEspecias
	}
	
	method esEspecial() {
		return self.esAbundante() or self.tieneEspecias()
	}
	
	override method valoracion() {
		return if (self.esEspecial()) 120
		else 80
	}
}

class HamburguesaDeCarne inherits Comida {
	var tipoDePan 
	override method peso() = 250
	override method esAptoVegetariano() = false
	override method valoracion() {
		return 60 + tipoDePan.valoracion()
	}
}

class HamburguesaVegetariana inherits HamburguesaDeCarne {
	var legumbre
	override method esAptoVegetariano() = true
	override method valoracion() {
		return super() + (2 * legumbre.size()).min(17)
	}
}

class Parrillada inherits Comida {
	const cortesPedidos = []
	
	override method peso() {
		return cortesPedidos.sum({ each => each.peso() })
	}
	override method esAptoVegetariano() = false
	
	override method valoracion() { 
		return 15 * cortesPedidos.max({each => each.calidad()}).calidad() - cortesPedidos.size()
	}	
}

class CorteDeCarne {
	var property calidad
	var property peso
}

object panIndustrial {
	method valoracion() = 0
}
	
object panCasero {
	method valoracion() = 20
}

object panDeMasaMadre {
	method valoracion() = 45
}