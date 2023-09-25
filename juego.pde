PImage temporizador;

void pantallaJuego() {
  background(fondo);
  
  // Actualiza y dibuja el mundo de física
  mundo.step();
  mundo.draw();
   
  
  // Cambiar la visibilidad de la garra según el estado de la mano
  if (manoAbierta == true && manoCerrada == false) {
    garraAbierta.attachImage(garra_abierta); // Asigna la imagen a la garra cerrada
    garraAbierta.setPosition(x, y); // Actualizar la posición de la garra cerrada
  } else if (manoAbierta == false && manoCerrada == true) {
    garraAbierta.attachImage(garra_cerrada); // Asigna la imagen a la garra cerrada
    garraAbierta.setPosition(x, y); // Actualizar la posición de la garra cerrada
    atraerAUnPunto();
}


  temporizador= loadImage("temporizador.png");
  
  image(temporizador, 55, 20, 150, 100);

 
}
