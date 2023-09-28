import ddf.minim.*;

Minim minim;
AudioPlayer fondoMusica;
AudioPlayer perderSound;
AudioPlayer relojSound;
AudioPlayer relojSound2;  
AudioPlayer pelucheSound;
AudioPlayer ganarSound;
AudioPlayer reiniciarSound;

boolean juegoComenzado = false;
int tiempoInicial = 30;
int tiempoRestante = tiempoInicial;
boolean jugar = false;
int tiempoAnterior;

import fisica.*;
FWorld mundo;
FBox[] peluches;
FBox peluche, peluche_1, peluche_2, peluche_3, peluche_4, peluche_5;
String pantalla;
PImage inicio, fondo, pantallaperder,pantallaGanar;
PImage[] imagenesBloque = new PImage[8];
int numCajas = 5;
boolean ganaste = false;

PImage cursorAbierto;
PImage cursorCerrada;
boolean clicPresionado = false;
PImage instruccionesImg; 


void setup() {
  size(800, 600);
  inicio = loadImage("Inicio2.png");
  fondo = loadImage("background_roto.png");
  pantallaperder = loadImage("pantalla_perder.png");
  pantallaGanar = loadImage("pantalla_ganar.png");
  for (int i = 0; i < 8; i++) {
    imagenesBloque[i] = loadImage("bloque" + (i+1) + ".png");
  }
  
   instruccionesImg = loadImage("instrucciones2.png");
  
  pantalla = "inicio";
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(1);

     peluche_1  = creacionPeluche(); 
     peluche_2  = creacionPeluche();
     peluche_3  = creacionPeluche();
     peluche_4  = creacionPeluche();
     peluche_5  = creacionPeluche();
  
//peluche1 = creacionPeluche();
//peluche = creacionPeluche();
//creacionPeluche1();


  //sonidos
  minim = new Minim(this);
  
  perderSound = minim.loadFile("perder.mp3");
  ganarSound = minim.loadFile ("Ganar.mp3");
  reiniciarSound = minim.loadFile ("Apertura.mp3");

  fondoMusica = minim.loadFile("Juego.mp3");
  fondoMusica.loop();
  fondoMusica.setGain(0.5);
  
  relojSound = minim.loadFile("Reloj.mp3");
  relojSound2 = minim.loadFile("Reloj2.mp3");
  pelucheSound = minim.loadFile("peluche.mp3");
  //sonidos
  
  noCursor();
  cursorAbierto = loadImage("garra_abierta.png");
  cursorCerrada = loadImage("garra_cerrada.png");
  
}

void draw() {
  
 if (pantalla == "inicio") {
    pantallaInicio();
  } else if (pantalla == "juego") {
     pantallaJuego();
  } else if (pantalla == "perder") {
   pantallaPerder();
  }else if (pantalla=="ganar"){
  pantallaGanar();
  } else if (pantalla == "instrucciones") {  // Agregamos la pantalla de instrucciones.
    pantallaInstrucciones();
  }
  
  int cursorOffsetX = cursorAbierto.width / 2;  
  int cursorOffsetY = cursorAbierto.height;    
  
  if (clicPresionado) {
    image(cursorCerrada, mouseX - cursorOffsetX, mouseY - cursorOffsetY);
  } else {
    image(cursorAbierto, mouseX - cursorOffsetX, mouseY - cursorOffsetY);
  }
}

void mousePressed() {
  if (pantalla == "inicio") {
    clicPresionado = true;
    botonGeneral(550, 190, 155, 150, "instrucciones");
  } else if (pantalla == "juego" ) {
    clicPresionado = true;
    tiempoAnterior = millis();
    pelucheSound.rewind(); // Reiniciamos el sonido para que se pueda reproducir desde el principio
    pelucheSound.play();
  } else if (pantalla=="perder"){
    clicPresionado = true;
    botonPerder(120, 400, 155, 150, "inicio" );
  } else if (pantalla == "instrucciones") {  // Cambiamos cualquier clic en instrucciones a la pantalla de juego.
    pantalla = "juego";  // Cambia a la pantalla de juego.
  }
   
  
}

void mouseReleased() {
  clicPresionado = false;
}

void pantallaInstrucciones() {
  background(255);
  image(instruccionesImg, 0, 0, width, height);

}

void stop() {
  perderSound.close();
  fondoMusica.close();
  relojSound.close();
  relojSound2.close();
  pelucheSound.close();
  ganarSound.close();
  minim.stop();
  super.stop();
}
