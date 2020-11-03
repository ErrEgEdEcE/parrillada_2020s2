import comidas.*
import comensales.*

object cocina {
	var property comidasPreparadas = []
	
	method preparar(unaComida) {comidasPreparadas.add(unaComida)}
	method comidasVegetarianas() {
		return comidasPreparadas.filter({each => each.esAptoVegetariano()})
	}
	method comidasCarnivoras() {
		return comidasPreparadas.filter({each => !each.esAptoVegetariano()})
	}
	method tieneBuenaOfertaVegetariana() {
		return (self.comidasCarnivoras().size() - self.comidasVegetarianas().size()).abs() <= 2
	}
	method platoFuerteCarnivoro() {
		self.comidasCarnivoras().max({ each => each.valoracion() })
	}
	
	method comidasQueLeGustanA(comensal) {
		return self.comidasPreparadas().filter({each => comensal.leAgrada(each)})
	}
	method elegirUnPlatoPara(comensal) {
		var plato = self.comidasQueLeGustanA(comensal).anyOne()
		if (comidasPreparadas.contains(plato)) {comensal.comer(plato)}
		else self.error("No le gusta nada de lo que hay")
	}
    
}