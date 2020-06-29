import ciudad.*
import certificado.*
import centrosDeDistribucion.*
class Vendedor{
	const certificaciones = []
	method agregarCerfiticaciones(certificacion){
		certificaciones.add(certificacion)
	}
	method certificaciones(){return certificaciones}
	
	method sumarCertificaciones(){
		return certificaciones.sum({c => c.puntos() })
	}
	
	method puedeTrabajar(ciudad)
	
	method versatil(){
		return self.certificaciones().size() >= 3 
		and self.certificaciones().any({c=> c.esPorObjetos()})
		and self.certificaciones().any({c=> not c.esPorObjetos()})
	}
	
	method certificadoNoPorProducto(){
		return self.certificaciones().any({c=> not c.esPorObjetos()})
	}
	
	method certificadoPorProducto(){
		return self.certificaciones().any({c=> c.esPorObjetos()})
	}
	
	method firme(){
		return certificaciones.sum({c => c.puntos()}) >= 30
	}
	method tieneAfinidad(unCentro)
	method influyente()

	method candidato(unCentro){
		return self.versatil() and self.tieneAfinidad(unCentro)
	}
}
class VendedorFijo inherits Vendedor {
	var property ciudad
	const property personaFisica = true
	override method puedeTrabajar(unaCiudad){
		return self.ciudad() == ciudad
	}
	
	override method influyente(){
		return false
	}
	
	override method tieneAfinidad(unCentro){
		return self.puedeTrabajar(unCentro.ciudad())
	}
	
}

class Viajante inherits Vendedor {
	const provincias = []
	const property personaFisica = true
	method trabajaEn(provincia) {
		provincias.add(provincia)
	}
	method provincia(){return provincias}
	
	override method puedeTrabajar(unaCiudad){
		return provincias.any({p => p == unaCiudad.provincia()})
	}
	method sumaPoblacion(){
		return provincias.sum({p => p.poblacion()})
	}
	
	override method influyente(){
		return self.sumaPoblacion() >= 10000000
	}
	
	override method tieneAfinidad(unCentro){
		return self.puedeTrabajar(unCentro.ciudad())
	}
}

class ComercioCorresponsal inherits Vendedor {
	const sucursales = []
	const property personaFisica = false
	method agregarSucursalesEn(ciudad){
		sucursales.add(ciudad)
	}
	
	method sucursalesEn(){return sucursales}
	
	override method puedeTrabajar(unaCiudad){
		return sucursales.contains(unaCiudad)
	}
	
	override method influyente(){
		return sucursales.size() >= 5 or 
		sucursales.map({c=>c.provincia()}).asSet().size() >= 3
	}
	
	override method tieneAfinidad(unCentro){
		return self.puedeTrabajar(unCentro.ciudad()) 
		and sucursales.any({s => not unCentro.puedeCubrir(s)})
	}
}


