import oscP5.*; //<>//
OscP5 oscP5;
float x = 0; // posicion de la mano
float y = 0; // posicion de la mano

import fisica.*;
FWorld mundo;
FBox garraCerrada;
FBox garraAbierta;
FBox[] cajas;
int numCajas = 10; // Número de cajas iniciales

String pantalla;
PImage inicio, fondo,garra_abierta, garra_cerrada; 
PImage[] imagenesBloque = new PImage[8]; // Arreglo para almacenar las imágenes de los bloques
boolean manoCerrada = false; // Variable para rastrear si la mano está cerrada o abierta
boolean manoAbierta = true; // Supongamos que la garra está abierta al principio

//boolean ganaste = false;


void setup() {
  size(800, 600);
  oscP5 = new OscP5(this, 8008); // Reemplaza 8008 con el puerto correcto de HandPose OSC
  inicio = loadImage("Inicio2.png");
  fondo = loadImage("fondo.png");
  garra_abierta = loadImage("garra_abierta.png"); 
  garra_cerrada = loadImage("garra_cerrada.png");
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  
  pantalla = "inicio";
  
  //instanciado de bloques
   for (int i = 0; i < 8; i++) {
    imagenesBloque[i] = loadImage("bloque" + (i+1) + ".png");
  }
   cajas = new FBox[numCajas]; // Inicializa el arreglo

  for (int i = 0; i < numCajas; i++) {
    float w = 80;
    float h = 60;
    float density = 1000000;
   
    FBox caja = crearCajaRaw(w, h, density);
    cajas[i] = caja;
    mundo.add(caja);
  }
  //instanciado de bloques
//garra fisica
  garraAbierta = new FBox(50, 650);
  garraAbierta.setPosition(x, y); // Posición inicial de la garra
  garraAbierta.setNoStroke();
  garraAbierta.setStatic(true); // Hacer que la garra sea estática
  garraAbierta.attachImage(garra_abierta); // Asigna la imagen a la garra cerrada
  mundo.add(garraAbierta); // Agrega la garra cerrada al mundo físico

}

void draw() {
  if (pantalla == "inicio") {
    pantallaInicio();
  } else if (pantalla == "juego") {
    pantallaJuego();
  }
  
}

void mousePressed() {
  if (pantalla == "inicio") {
    botonInicio();
  } else if (pantalla == "juego") {
   
  }
}
