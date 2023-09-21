import fisica.*; //<>//
FWorld mundo;

String pantalla;
PImage inicio, fondo,garra_abierta;
PImage[] imagenesBloque = new PImage[8]; // Arreglo para almacenar las imágenes de los bloques
int PUERTO_OSC = 12345;
FBox[] cajas;
int numCajas = 20; // Número de cajas iniciales
int cajasApiladas = 0; // Número de cajas apiladas
boolean ganaste = false;

Receptor receptor;

Administrador admin;

void setup() {
  size(800, 600);
  inicio = loadImage("Inicio2.png");
  fondo = loadImage("fondo.png");
  garra_abierta=loadImage("garra_abierta.png");
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();

  setupOSC(PUERTO_OSC);

  receptor = new Receptor();
  
  admin = new Administrador(mundo);
  
  /*for(int i=0; i<100; i++){
  
    FCircle c = new FCircle(random(20, 50));
    c.setPosition(random (50, width-50), random(50, height-50));
    c.setFill(random(255), random(255), random(255));
    mundo.add(c);
  }*/
  // Cargar las imágenes de los bloques
  for (int i = 0; i < 8; i++) {
    imagenesBloque[i] = loadImage("bloque" + (i+1) + ".png");
  }
  
  pantalla = "inicio";
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(1);
  
  cajas = new FBox[numCajas]; // Inicializa el arreglo

  for (int i = 0; i < numCajas; i++) {
    float w = 80;
    float h = 60;
    color c = color(random(255), random(255), random(255));
    float density = 1000000;
   
    FBox caja = crearCajaRaw(w, h, c, density);
    cajas[i] = caja;
    mundo.add(caja);
  }
}

void draw() {
    if (pantalla == "inicio") {
    pantallaInicio();
  } else if (pantalla == "juego") {
    pantallaJuego();
  }

  

  receptor.actualizar(mensajes); //  
  receptor.dibujarBlobs(width, height);


  // Eventos de entrada y salida
  for (Blob b : receptor.blobs) {

    if (b.entro) {
      admin.crearPuntero(b);
      println("--> entro blob: " + b.id);
    }
    if (b.salio) {
      admin.removerPuntero(b);
      println("<-- salio blob: " + b.id);
    }
    
    admin.actualizarPuntero(b);
  }

  //println("cantidad de blobs: " + receptor.blobs.size());
  
  
}

void mousePressed() {
  if (pantalla == "inicio") {
    botonInicio();
  } else if (pantalla == "juego" && cajasApiladas < 5) {
   
  }
}
