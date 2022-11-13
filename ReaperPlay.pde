import oscP5.*; // -->se importan las librerías oscP5 y netP5
import netP5.*;

OscP5 oscP5; //--> definición del objeto

int puerto; //--> Se define un puerto de entrada para la comunicación osc

//Variables para las imágenes a animar.
int maxImages = 22;
int imageIndex = 0;
PImage[] images = new PImage[maxImages];

//Variables generales.
PImage fondo;
PFont fuente;
float colorR, radio;
String texto,vlrS;
int num, colorE, color1, color2, color3, c1, c2, c3;
float ang, vlr, cond, valor, v, vl, vr, Clip;

void setup(){
  size(600, 600);
  fondo = loadImage("fondo-circulo.jpg");
  background (30, 30, 30);
  surface.setTitle("ReaperPlay | Sergio Ordóñez");
  surface.setResizable(false);//Si se ingresa true se le puede modificar el tamaño de la ventana.
  fuente = loadFont("BeyondTheMountains-60.vlw");  
  texto = (" ");
  colorR = 255;
  for (int i = 0; i < images.length; i++){
    images[i] = loadImage("DK_"+ i + ".png");
  }
  
  frameRate(18);
  num = 0;  
  ang = 0;
  radio = 0;
  valor = 0;
  vl = 0;
  
  puerto = 9005; // Puerto para comunicación con Reaper.
  oscP5 = new OscP5(this, puerto);
}

void draw(){ 
  fondo.resize(width, height);
  image(fondo, 0, 0);  
  noStroke();
  textFont(fuente);
  bienvenido();
  fill(245,121,109);
  circle(width/2, height/2, 200);
  fill(127.5, 255, 127.5);
  circle(width/2, height/2, 180);
  
  switch(num){
    case 1:
    Clilp();
    l();
    r();
    play();break;
    case 2:
    pause(); break;
    case 3:
    Clilp();
    l();
    r();
    track1();break;
    case 4:
    Clilp();
    l();
    r();
    track2();break;
    case 5:
    Clilp();
    l();
    r();
    track3();break;
    case 6:
    Clilp();
    l();
    r();
    master();break;
  }
}

void oscEvent(OscMessage theOscMessage){
  if(theOscMessage.checkAddrPattern("/master/vu")==true){
    valor = theOscMessage.get(0).floatValue();//Obtengo el valor del argumento
  }
  
  if(theOscMessage.checkAddrPattern("/master/vu/L")==true){
    vl = theOscMessage.get(0).floatValue();
  }
  if(theOscMessage.checkAddrPattern("/master/vu/R")==true){
    vr = theOscMessage.get(0).floatValue();
  }

  if(theOscMessage.checkAddrPattern("/play")==true){
    cond = theOscMessage.get(0).floatValue();
    if (cond == 1.0){
      num = 1;
    }
    else {
      num = 2;
    }
  } 
    
  if(theOscMessage.checkAddrPattern("/track/1/volume")==true){
    vlr = theOscMessage.get(0).floatValue(); 
    num = 3;
  }
  
  if(theOscMessage.checkAddrPattern("/track/2/volume")==true){
    vlr = theOscMessage.get(0).floatValue();  
    num = 4;
  }
  
  if(theOscMessage.checkAddrPattern("/track/3/volume")==true){
    vlr = theOscMessage.get(0).floatValue();  
    num = 5;
  }
  
  if(theOscMessage.checkAddrPattern("/master/volume")==true){     
    vlr = theOscMessage.get(0).floatValue();
    num = 6;
  }
}
