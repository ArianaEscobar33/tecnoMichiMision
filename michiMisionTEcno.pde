import fisica.*; //<>//
import oscP5.*;
OscP5 oscP5;
float x = 400; // posicion de la mano
float y = 0; // posicion de la mano
float xPeluche;
float xGarra;
float yPeluche;
float yGarra;

FWorld mundo;
//FBox garraCerrada;
FBox garraAbierta;
FBox peluche;
MPrismaticJoint prismatico;
//FBox[] cajas;
//int numCajas = 1; // Número de cajas iniciales

String pantalla;
PImage inicio, fondo,garra_abierta, garra_cerrada,bloque1,pantallaperder; 
PImage[] imagenesBloque = new PImage[8]; // Arreglo para almacenar las imágenes de los bloques
boolean manoCerrada = false; // Variable para rastrear si la mano está cerrada o abierta
boolean manoAbierta = true; // Supongamos que la garra está abierta al principio

//boolean ganaste = false;

//audio
import ddf.minim.*;

Minim minim;
AudioPlayer fondoMusica;
AudioPlayer perderSound;
AudioPlayer relojSound;
AudioPlayer relojSound2;  // Agregamos un nuevo AudioPlayer para Reloj2.mp3

boolean juegoComenzado = false;
int tiempoInicial = 20;
int tiempoRestante = tiempoInicial;
boolean jugar = false;
int tiempoAnterior;
//audio
void setup() {
  size(800, 600);
  oscP5 = new OscP5(this, 8008); // Reemplaza 8008 con el puerto correcto de HandPose OSC
  
  inicio = loadImage("Inicio2.png");
  fondo = loadImage("fondo.png");
  garra_abierta = loadImage("garra_abierta.png"); 
  garra_cerrada = loadImage("garra_cerrada.png");
  pantallaperder = loadImage("pantalla_perder.png");
  //bloque1 = loadImage("bloque1.png");
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  
  pantalla = "inicio";
  
  //instanciado de bloques
   for (int i = 0; i < 8; i++) {
    imagenesBloque[i] = loadImage("bloque" + (i+1) + ".png");
 }
   //cajas = new FBox[numCajas]; // Inicializa el arreglo
   creacionGarra();
   creacionPeluche();
   mundo.add(prismatico);
   
   prismatico = new MPrismaticJoint(garraAbierta, peluche);
   
   //audio
   // Inicializa la biblioteca Minim
  minim = new Minim(this);
  
  // Carga el archivo de sonido "perder.mp3"
  perderSound = minim.loadFile("perder.mp3");
  
  // Carga el archivo de música de fondo "Juego.mp3"
  fondoMusica = minim.loadFile("Juego.mp3");
  fondoMusica.loop();
  fondoMusica.setGain(0.5); // Ajusta el volumen de la música de fondo
  
  // Carga el archivo de sonido "Reloj.mp3"
  relojSound = minim.loadFile("Reloj.mp3");
  
  // Carga el archivo de sonido "Reloj2.mp3"
  relojSound2 = minim.loadFile("Reloj2.mp3");
   //audio
}

void draw() {
  background(255); // Dibuja la pantalla

  if (pantalla == "inicio") {
    pantallaInicio();
  } else if (pantalla == "juego") {
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
          
          // Agregamos esta condición para el sonido Reloj2.mp3
          if (tiempoRestante <= 3 && !relojSound2.isPlaying()) {
            relojSound2.play();
          }
        }
      } else {
        jugar = false;
        pantallaPerder();
        perderSound.play();
        fondoMusica.pause(); // Pausa la música de fondo
      }
    }

    pantallaJuego();
    
    fill(255);
    String tiempoFormateado = nf(tiempoRestante / 60, 2) + ":" + nf(tiempoRestante % 60, 2);
    textSize(25);
    text(tiempoFormateado, 120, 86);
  } else if (pantalla == "perder") {
    image(pantallaperder, 0, 0, width, height);
    perderSound.play();
    fondoMusica.pause(); // Pausa la música de fondo cuando se muestra la pantalla de perder
    relojSound.pause(); // Pausa el sonido de reloj cuando se muestra la pantalla de perder
  }
}

void mousePressed() {
  if (pantalla == "inicio") {
    botonInicio();
  } else if (pantalla == "juego") {
    jugar = true;
    tiempoAnterior = millis();

  
  }
}

void pantallaPerder() {
  pantalla = "perder";
  // Agrega aquí cualquier lógica adicional relacionada con la pantalla de perder
}

void stop() {
  perderSound.close();
  fondoMusica.close();
  relojSound.close();
  relojSound2.close();  // Cerramos el sonido Reloj2.mp3
  minim.stop();
  super.stop();
}
