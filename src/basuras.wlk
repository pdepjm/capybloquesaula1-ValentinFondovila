import wollok.game.*
import utilidades.*
import combustibles.*

object lataDeCerveza {
  var property position = posicionAleatoria.calcular()
  var property longitudCm = 10
  
  method impactoEnLaHuellaDeCarbono() = 5 * longitudCm
  method nombre() = "lata_roja"
  method image() = self.nombre() + ".png"

  method esReciclable() = true
  
  method tratar() {
    longitudCm *= 0.9
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)

  }
}

object botellaDeGaseosa {
  var impactoEnHuellaDeCarbono = 100
  var property position = posicionAleatoria.calcular()
  
  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method nombre() = "lata_naranja"

  method image() = self.nombre() + ".png"  

  method esReciclable() = true
  
  method tratar() {
    impactoEnHuellaDeCarbono -= 5
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
  }
}

object barrilDeCombustible {
  var property position = posicionAleatoria.calcular()
  var combustibleActual = biogas
  var combustibleAnterior = gasoil
  
  method impactoEnLaHuellaDeCarbono() = combustibleActual.consumo()
  
  method esReciclable() = false
  method nombre() =  "barril"
  method image() = self.nombre() + "_" + combustibleActual.sufijo()+ "_" + ".png"

  method cambiarCombustible() {
    const aux = combustibleActual
    combustibleActual = combustibleAnterior
    combustibleAnterior = aux
  }
  
  method combustibleActual() = combustibleActual
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("cambiarCombustible")
  }
}

object rueda {
  var ancho = 0
  var property position = game.at(0,5)
  const impactoEnHuellaDeCarbono = 50

  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method varieSuAncho(){
    if (ancho != 10){
      ancho += 1
      position = game.at(ancho, 5)
    }
  }

  method volverACero(){
    ancho = 0
    position = game.at(ancho, 5)
  }

  method nombre() =  "rueda"
  method image() = "rueda.png"

  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("cambiar ancho")
    game.removeTickEvent("volver a cero")
  }
}