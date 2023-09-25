void pantallaInicio() {
  background(inicio);
  fill(255, 0, 0);
  rect(350, 300, 100, 50);
  garraAbiertaCerrada();
}

void botonInicio() {
  if ((mouseX > 350) && (mouseX < 350 + 100) && (mouseY > 300) && (mouseY < 300 + 50)) {
    pantalla = "juego";
  }
}
