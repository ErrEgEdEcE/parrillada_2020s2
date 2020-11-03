import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	method estaSatisfecho() {
		return comidas.sum({ each => each.peso() }) >= self.peso() * 0.01
	}
	method comer(unaComida) {comidas.add(unaComida)}
}

class Vegetariano inherits Comensal {
	override method leAgrada(unaComida) {
		return unaComida.esAptoVegetariano() and unaComida.valoracion() > 85
	}
	override method estaSatisfecho() {
		return super() and not self.comidas().any({each => each.esAbundante()})
	}
}

class Popular inherits Comensal {
	override method leAgrada(unaComida) {
		return unaComida.esAbundante()
	}
}

class PaladarFino inherits Comensal {
	override method leAgrada(unaComida) {
		return unaComida.peso().between(150, 300) and unaComida.valoracion() > 100
	}
	override method estaSatisfecho() {
		return super() and self.comidas().size().even()
	}
}