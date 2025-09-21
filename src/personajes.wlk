import wollok.game.*
import utilidades.*

object capy {
  var property position = game.origin()
  var impactoEnLaHuellaDeCarbonoTotal = 0 
  
  method recolectarBasura(basura){
    game.removeVisual(basura)
    game.say(self, "Recolecté: barril de " + basura.nombre())
    impactoEnLaHuellaDeCarbonoTotal += basura.impactoEnLaHuellaDeCarbono()
  }
  
  method tratar(){
    impactoEnLaHuellaDeCarbonoTotal = (impactoEnLaHuellaDeCarbonoTotal - 20).max(0)
  }
  
  method impactoEnLaHuellaDeCarbono() = impactoEnLaHuellaDeCarbonoTotal
  
  method image() = "capy_tranqui.png"
}

object sans {
  var property position = posicionAleatoria.calcular()
  const impactoEnLaHuellaDeCarbonoTotal = 0

  var sufijo = ".png"

  method dormir() {
    if(sufijo == ".png"){
      sufijo = "dormido.gif"
    }
    else {
      sufijo = ".png"
    }
  }

  method impactoEnLaHuellaDeCarbono() = impactoEnLaHuellaDeCarbonoTotal

  method image() = "sans" + sufijo
  
}