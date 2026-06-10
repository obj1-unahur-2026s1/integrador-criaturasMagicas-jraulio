class Criatura{
    var poderMagico
    var astucia
    var rol

    method poderOfensivo(){
        return poderMagico * 10 + rol.extra()
    }

    method poderMagico(){
        return poderMagico
    }

    method esAstuta()

    method esFormidable(){
        return self.esAstuta() or self.esExtraordinaria()
    }

    method esExtraordinaria(){
        return rol.esExtraordinario(self)
    }

    method cambiarRol(){
        rol = rol.cambio()
    }
}

class Hada inherits Criatura {
  var kilometros = 2

  method aumentarKilometros(km) {
    kilometros = (kilometros + km).min(25)
  }

  override method esAstuta(){
    return astucia > 50
  }

  override method esExtraordinaria() {
    return rol.esExtraordinario(self) and kilometros > 10
  }
  
}

class Duende inherits Criatura{

   override method poderOfensivo(){
    return (poderMagico * 10 + rol.extra()) * 1.1 
   }

   override method esAstuta(){
    return false 
   }

}


object guardian {
  method extra() {
    return 100
  }

  method esExtraordinario(criatura){
    return criatura.poderMagico() > 50
  }

  method cambio(){
    return new Domador(mascotas = [
        new MascotaMitologica (edad = 1, tieneCuernos=false)])
  }
}

class MascotaMitologica {
    const property edad
    const tieneCuernos
}

class Domador {
  const property mascotas = []

  method extra() {
    return self.filtroCuernos().size() * 150
  }

  method filtroCuernos(){
    return mascotas.filter({p => p.tieneCuernos()})
  }

  method esExtraordinario(criatura){
    return criatura.poderMagico() >= 15 and self.todasLasMascotasSonVeteranas()
  }
  method todasLasMascotasSonVeteranas(){
    return mascotas.all({p => p.edad() >= 10})
  }
  method agregarMascota(mascota){
    mascotas.add(mascota)
  }

  method cambio(){
    if (!self.filtroCuernos().size() > 0){
        self.error("no anda")
     }
    return hechicero
  }
}

object hechicero {

  method extra(){
    return 0
  }

  method esExtraordinario(criatura) {
    return true
  }
  method cambio() {
    return guardian
  }

}