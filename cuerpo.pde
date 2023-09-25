/*FBox crearCajaRaw(float w, float h, float g) {
  float x = random(50, width - w - 50);
  float y = random(500, height - h );
  FBox main = new FBox(w, h);
  main.setPosition(x, y);
  main.setFriction(1);
  float we = (w / 30);
  float he = (h / 30);
  main.setDensity((g / (we * he)) * 2);
  main.setNoStroke();
  main.setName("peluches");
  // Seleccionar una imagen aleatoria de los bloques
  PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  main.attachImage(imagenAleatoria);
  
  return main;
}

void creacionCajas(){
for (int i = 0; i < numCajas; i++) {
    float w = 80;
    float h = 60;
    float density = 1000000;
   
    FBox caja = crearCajaRaw(w, h, density);
    cajas[i] = caja;
    mundo.add(caja);
  }
}*/
void creacionPeluche(){
  peluche = new FBox(90, 50);
  peluche.setPosition(random(100,700), 543); // Posición inicial de la garra
  peluche.setNoStroke();
  //peluche.setDensity(1000);
  peluche.setName("peluche");
    // Seleccionar una imagen aleatoria de los bloques
  PImage imagenAleatoria = imagenesBloque[int(random(imagenesBloque.length))];
  peluche.attachImage(imagenAleatoria);
  mundo.add(peluche); // Agrega la garra cerrada al mundo físico
}


void creacionGarra(){
//garra fisica
  garraAbierta = new FBox(50, 100);
  garraAbierta.setPosition(x, y); // Posición inicial de la garra
  garraAbierta.setNoStroke();
  garraAbierta.setName("garra");
  garraAbierta.setStatic(true); // Hacer que la garra sea estática
  garraAbierta.attachImage(garra_abierta); // Asigna la imagen a la garra cerrada
  mundo.add(garraAbierta); // Agrega la garra cerrada al mundo físico

}

class MPrismaticJoint extends FPrismaticJoint {
  MPrismaticJoint(FBody body1, FBody body2) {
    super(body1, body2);
  }
}
