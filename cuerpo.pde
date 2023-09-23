FBox crearCajaRaw(float w, float h, float g) {
  float x = random(50, width - w - 50);
  float y = random(500, height - h );
  FBox main = new FBox(w, h);
  main.setPosition(x, y);
  main.setFriction(1);
  float we = (w / 30);
  float he = (h / 30);
  main.setDensity((g / (we * he)) * 2);
  main.setNoStroke();
  
  // Seleccionar una imagen aleatoria de los bloques
  PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  main.attachImage(imagenAleatoria);
  
  return main;
}
