import wollok.game.*

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
  var property position = game.at(10,10)
  const impactoEnLaHuellaDeCarbonoTotal = 0

  var sufijo = ""
  var imagen = "sans.webp"

  method dormir() {
    if(imagen == "sans.webp"){
      imagen = "sansdormido.png"
    }
    else {
      imagen = "sans.webp"
    }
  }

  //sans.png sans-dormido.png method image() = "sans" + sufijo + ".png"

  method impactoEnLaHuellaDeCarbono() = impactoEnLaHuellaDeCarbonoTotal
  
  method image() = imagen
}
