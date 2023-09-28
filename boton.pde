
void botonGeneral(int ubix, int ubiy, int tamx, int tamy, String pantallapasar) {
  noFill ();
  noStroke();
  rect(ubix, ubiy, tamx, tamy);
  if ((mouseX > ubix) && (mouseX < ubix + tamx) && (mouseY > ubiy) && (mouseY < ubiy + tamy)) {  // Cambio de parámetros
    println(pantallapasar);
    tiempoRestante = tiempoInicial;
    fondoMusica.loop();
    pantalla = pantallapasar;
    
  }
}

void botonPerder(int ubiX, int ubiY, int tamX, int tamY, String pantallapasar) {
  noFill ();
  noStroke();
  rect(ubiX, ubiY, tamX, tamY);
  perderSound.close();
  reiniciarSound.play();
  if ((mouseX > ubiX) && (mouseX < ubiX + tamX) && (mouseY > ubiY) && (mouseY < ubiY + tamY)) {  // Cambio de parámetros
    pantalla = pantallapasar;
}
}
