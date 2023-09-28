PImage temporizador;

void pantallaJuego() {
  background(fondo);  
  temporizador= loadImage("temporizador.png");
  image(temporizador, 55, 20, 150, 100);  
  mundo.step();
  mundo.draw();
  
 if (!juegoComenzado) {
      jugar = true;
      tiempoAnterior = millis();
      juegoComenzado = true;
    }
 if (millis() - tiempoAnterior >= 1000) {
      tiempoAnterior = millis();
      if (tiempoRestante > 0) {
        tiempoRestante--;
        
        if (tiempoRestante <= 10) {
          relojSound.play();
          
          if (tiempoRestante <= 3 && !relojSound2.isPlaying()) {
            relojSound2.play();
          }
        }
 } else {
        jugar = false;
        pantallaPerder();
        perderSound.play();
        fondoMusica.pause();
      }
    }
 fill(255);
 String tiempoFormateado = nf(tiempoRestante / 60, 2) + ":" + nf(tiempoRestante % 60, 2);
 textSize(22);
 text(tiempoFormateado, 115, 86);
 
 float yPeluche1 = peluche_1.getY(); 
 float yPeluche2 = peluche_2.getY();
 float yPeluche3 = peluche_3.getY();
 float yPeluche4 = peluche_4.getY();
 float yPeluche5 = peluche_5.getY();
 
 float max1 = min(yPeluche1, yPeluche2, yPeluche3);
 float max2 = min(yPeluche4, yPeluche5);
 float max = min(max1, max2);
 
 FBox pelucheMax;
 if (peluche_1.getY() == max) {
   pelucheMax=peluche_1;
 } else if (peluche_2.getY() == max) {
   pelucheMax=peluche_2;
 } else if (peluche_3.getY() == max) {
   pelucheMax=peluche_3;
 } else if (peluche_4.getY() == max) {
   pelucheMax=peluche_4;
 } else  {
   pelucheMax=peluche_5;
 }

 println(pelucheMax);
 float distancia1 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_1.getX(),peluche_1.getY()); 
 float distancia2 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_2.getX(),peluche_2.getY()); 
 float distancia3 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_3.getX(),peluche_3.getY()); 
 float distancia4 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_4.getX(),peluche_4.getY()); 
 float distancia5 = dist(pelucheMax.getX(),pelucheMax.getY(),peluche_5.getX(),peluche_5.getY()); 
 float distanciaMenor = 1000000;
 FBox pelucheCercano;
 
 if (distancia1 != 0 && distancia1 < distanciaMenor){
   distanciaMenor=distancia1;
   pelucheCercano=peluche_1;
 }
 if (distancia2 != 0 && distancia2 < distanciaMenor){
   distanciaMenor=distancia2;
   pelucheCercano=peluche_2;
 }
 if (distancia3 != 0 && distancia3 < distanciaMenor){
   distanciaMenor=distancia3;
   pelucheCercano=peluche_3;
 }
 if (distancia4 != 0 && distancia4 < distanciaMenor){
   distanciaMenor=distancia4;
   pelucheCercano=peluche_4;
 }
 if (distancia5 != 0 && distancia5 < distanciaMenor){
   distanciaMenor=distancia5;
   pelucheCercano=peluche_5;
 }
 
 println(max);
 println(max<=350);
 println(clicPresionado==false);
 println(distanciaMenor<=70);
 println();
 if (max<=380 && clicPresionado==false && distanciaMenor<=70){
    pantalla="ganar"; 
 }
 //float yPeluche1 = peluche1.getY();
// println(yPeluche1);

//if ( yPeluche <= 520 || yPeluche1 <= 520 && clicPresionado == false){

//pantalla="ganar";}

}  
    
