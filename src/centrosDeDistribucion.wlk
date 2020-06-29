import certificado.*

class CentroDeDistribucion {
	var property ciudad
	const vendedores = #{}
	
	method vendedorDelCentro(unVendedor){
		if(vendedores.contains(unVendedor)) {
			self.error("El vendedor ya esta trabajando en nuestro centro de distribucion")
		}else{
			vendedores.add(unVendedor)
		}
	}
	
	method vendedorEstrella(){
		return vendedores.max({v => v.sumarCertificaciones()})
	}
	
	method puedeCubrir(unaCiudad){
		return vendedores.any({v => v.puedeTrabajar(unaCiudad)})
	}
	
	method vendedoresGenericos(){
		return vendedores.filter({ v => v.certificadoNoPorProducto()})
	}
	
	method esRobusto(){
		return vendedores.filter({v=> v.firme()}).size() >= 3
	}
	
	method repartirCertificacion(){
		vendedores.forEach({v => v.agregarCerfiticaciones(new Certificados(puntos=30))})
	}
	

}
