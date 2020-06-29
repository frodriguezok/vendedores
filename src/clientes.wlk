import vendedor.*
import centrosDeDistribucion.*

class Cliente {
	var property tipo
	
	method puedeSerAtendido(unVendedor)
}


class ClienteInseguro {
	method tipo(inseguro)
	
	method puedeSetAtendido(unVendedor){
		return unVendedor.versatil() and unVendedor.firme()
	}
	
}

class ClienteDetallista {
	method tipo(detallista)
	
	method puedeSerAtendido(unVendedor){
		return unVendedor.certificaciones().count({c=> c.certificadoPorProducto()}) >= 3
	}
}

class ClienteHumanista {
	method tipo(humanista)
	
	method puedeSerAtendido(unVendedor){
		return unVendedor.personaFisica()
	}
	
}
object inseguro {
	const tipo = self
	method tipo(){return tipo }
}

object detallista {
	const tipo = self
	method tipo(){return tipo }
}

object humanista {
	const tipo = self
	method tipo(){return tipo }
}