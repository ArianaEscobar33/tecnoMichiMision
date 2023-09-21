void pantallaJuego() {
  background(fondo);
  mundo.step();
  mundo.draw();

  if (ganaste) {
    fill(255, 0, 0);
    textSize(32);
    text("¡Ganaste!", width / 2 - 80, height / 2);
  }
}
