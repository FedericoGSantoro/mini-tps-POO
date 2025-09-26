class NaveDeCarga inherits Nave {
	var property carga = 0

	method sobrecargada() = carga > 100

	override method velocidadMaxima() = if(!self.sobrecargada()) 100000 else 80000

	method recibirAmenaza() {
		carga = 0
	}

}

class NaveDePasajeros inherits Nave {
	var property cantidadDePasajeros = 0

	method tripulacion() = cantidadDePasajeros + 4

	override method velocidadMaxima() = 300000 / self.tripulacion()

}

class Nave {
	var property velocidad = 0
	
	method excedeVelocidad () = self.velocidad() > self.velocidadMaxima()
	
	method velocidadMaxima ()
	
	method propulsar() {
		if (!self.excedeVelocidad()) {
			velocidad += 20000
		} else {
			self.error("La nave excede la velocidad y no puede propulsarse")
		}
	}
}

class NaveDeResiduos inherits NaveDeCarga{
	override method recibirAmenaza() {
		velocidad = 0
	}
	
	override method velocidadMaxima() {
		if(!self.sobrecargada()) {
			return 100000 * 0.75
		} else {
			return 80000 * 0.75
			}
	}
	
	override method propulsar() {
		if (!self.sobrecargada()) {
			super()
		} else {
			self.error("La nave de residuos esta sobrecargada y no puede propulsarse")
		}
	}
	
}