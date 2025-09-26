import wollok.game.*

object jardin {
	const property position = game.at(6, 6)
	var property malezas = 30
	
	method image()
	  = if(not self.desprolijo()) "arbusto.png"
	    else "arbusto-desprolijo.png"
	
	method crecerMalezas() {
		malezas += 5 
	}
	
	method desprolijo() = malezas > 20
	
	method emprolijar(nivelProlijidad) {
		if (nivelProlijidad >= 10){
			malezas = 0
		} else if (nivelProlijidad < 9 && nivelProlijidad > 3){
			malezas /= 2
		}
	}
	
}

object spa {
	const property position = game.at(1, 1)
	method image() = "spa.png"
	
	method atender(persona) {
		persona.banioVapor(5)
		persona.masajes()
		persona.banioVapor(15)
	}
}

object olivia {
	var property relax = 4
	
	method image() = "jardinera.png"
	
	method trabajarEnJardin(unJardin){
		if (unJardin.desprolijo()) {
			self.disminuirRelax(2)
		}
		unJardin.emprolijar(relax * 2)
		self.disminuirRelax(1)
	}
	
	method disminuirRelax(estres) {
		relax -= estres
		relax = relax.max(1)
	}
	
	method banioVapor(tiempo) {
		relax += 1 * (tiempo / 5)
	}
	
	method masajes() {
		relax += 3
	}
	
}

object adriano {
	var property contracturas = 0
	
	method image() = "jardinero.png"
	
	method trabajarEnJardin(unJardin){
		const cantMalezas = unJardin.malezas()
		if (self.estaLastimado()) {
			unJardin.emprolijar(1)
		} else {
			unJardin.emprolijar(5)
		}
		self.aumentarContracturas(cantMalezas)
	}
	
	method aumentarContracturas(cantMalezas) {
		contracturas += cantMalezas.min(7)
	}
	
	method banioVapor(_tiempo) {
		if (self.estaLastimado()) {
			contracturas -= 2
		}
	}
	
	method masajes() {
		contracturas -= 5
		contracturas = contracturas.max(0)
	}
	
	method estaLastimado() = contracturas > 10
}
