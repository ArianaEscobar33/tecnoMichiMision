FBox creacionPeluche(){
  peluche = new FBox(90, 50);
  peluche.setPosition(random(100,700),543); // Posición inicial 
  peluche.setNoStroke();
  peluche.setFriction(1);
  peluche.setDensity(1000);
  peluche.setName("peluche");
    // Seleccionar una imagen aleatoria de los bloques
  PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  peluche.attachImage(imagenAleatoria);
  mundo.add(peluche); // Agrega la garra cerrada al mundo físico
  
  return peluche;
}
