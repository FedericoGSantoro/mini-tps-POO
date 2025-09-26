// TODO agregar todo lo necesario para completar la implementación del carrito
object carrito {
	var property productos = []
	method agregar(producto) {
		productos.add(producto)
	}

	method estaVacio() {
		return productos.isEmpty()
	}
	
	method cantidadDeProductos() {
		return productos.size()
	}
	
	method totalAAbonar() {
		return productos.sum({producto => producto.precio()})
	}
	
	method productoMasCaro() {
		if (self.estaVacio()) {
			self.error("El carrito esta vacio")
		}
		return productos.max({producto => producto.precio()})
	}
	
	method detalleDeCompra() {
		const productosUnicos = productos.asSet()
		const detallesUnicos = productosUnicos.map({producto => producto.descripcion()})
		return detallesUnicos.sortedBy({detalleAnterior, detalleSiguiente => detalleAnterior < detalleSiguiente})
	}
}

class Producto {
	const property nombre
	method descripcion ()
}

class ProductoUnitario inherits Producto {
	const property precio
	override method descripcion() = nombre
}

class ProductoPorPeso inherits Producto {
	const property peso
	const property precioKilo
	method precio() {
		return peso * precioKilo
	}
	override method descripcion() {
		return nombre + " x " + peso + " kg"
	}
}


