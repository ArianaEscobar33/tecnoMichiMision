String conseguirNombre(FBody cuerpo)
{
  String nombre = "nada";
  
  if (cuerpo != null)
  {
    nombre = cuerpo.getName();
    
    if (nombre == null)
    {
      nombre = "nada";
    }
  }
  
  return nombre;
}

void garraAbiertaCerrada(){
// Cambiar la visibilidad de la garra según el estado de la mano
  if (manoAbierta == true && manoCerrada == false) {
    garraAbierta.attachImage(garra_abierta); // Asigna la imagen a la garra cerrada
    garraAbierta.setPosition(x, y); // Actualizar la posición de la garra cerrada
  } else if (manoAbierta == false && manoCerrada == true) {
    garraAbierta.attachImage(garra_cerrada); // Asigna la imagen a la garra cerrada
    garraAbierta.setPosition(x, y); // Actualizar la posición de la garra cerrada
  }
}

void conseguirValoresXY(){

    
    xGarra = garraAbierta.getX();
    yGarra = garraAbierta.getY();
    xPeluche = peluche.getX();
    yPeluche = peluche.getY();
   // int xGarraEntero = round(xGarra);
    //int yGarraEntero = round(yGarra);
    
 
 println("Garra - x = " + xGarra + ", y = " + yGarra);
 
 
}


void contactStarted(FContact contacto)
{
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();
  
  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);
   if(manoCerrada==true){
  if (nombre1 == "garra" && nombre2 == "peluche") {
    println("contacto");
    peluche.addForce((xGarra-xPeluche) * 100, (yGarra-yPeluche)*100);
    
    }

  if (nombre2 == "garra" && nombre1 == "peluche"){
    println("contacto");
    peluche.addForce((xGarra-xPeluche) * 1000, (yGarra-yPeluche)*1000);
    
  }
}
}

void atraerAUnPunto()
{
  ArrayList<FBody> cuerpos = mundo.getBodies();
  
  //float factor = 100;
  
  for (FBody cuerpo : cuerpos)
  {
    float dx = garraAbierta.getX() - cuerpo.getX();
    float dy = garraAbierta.getY() - cuerpo.getY();
    
    if (dist(garraAbierta.getX(), garraAbierta.getY(), cuerpo.getX(), cuerpo.getY()) < 55)
    {
      cuerpo.addForce(dx * 100, dy * 100);
    }
  }
  
}
