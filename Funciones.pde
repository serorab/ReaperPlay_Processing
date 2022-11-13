//Funciones de movimiento.

//Rota bolitas a la derecha.
void rotacion(){
  colorR = random(150);
  ang = ang + 0.20;
  translate(width/2, height/2);
  fill(colorR);
  rotate (ang);
  circle(67, 67, 12);
  fill(colorR);
  circle(-67, -67, 12);
}

//Cículo palpitante del centro. Palpita dependiendo los valores que envíe el "Vu" de Reaper.
void circuloC(){
  colorR = random(100);
  radio = valor * 150;
  fill(colorR,121,109, 95);
  circle(width/2, height/2, radio);
}

//Circulo volumen. Crece o decrece si aumenta o disminuye el volumen de ese track.
void circuloV(){
  colorR = (48);
  radio = vlr * 150;
  fill(colorR,78,132);
  circle(width/2, height/2, radio);  
}

//Rota bolitas a la izquierda.
void rotacionR(){
  colorR = random(150);
  ang = vlr * 10;
  translate(width/2, height/2);
  fill(colorR);
  rotate (ang);
  circle(67, 67 , 12);
  circle(-67,-67, 12);
}

//Deja la bolitas quietas en la última posición.
void noRotacion(){
  translate(width/2, height/2);
  fill(0);
  rotate (ang);
  circle(67, 67 , 12);
  circle(-67,-67, 12);  
}

//Texto superior
void bienvenido(){
  fill(colorR, 255, 255);
  text ("ReaperPlay", (width/2)-130, (height/2)-200);
}

//Muestra la palabra "Play" y ejecuta la función "circuloC()" para mover círculo del centro y rota bolitas externas a la derecha.
void play(){ 
  colorR = random(255);
  texto = ("Play"); 
  circuloC();
  fill(255);
  text (texto, (width/2)-45, (height/2)+20); 
  rotacion();
}

//Muestra la palabra "Pause" y ejecuta la función "animacion()" que muestra una animación y detiene la rotación de las bolitas externas.
void pause(){
  colorR = 255;
  animacion();
  texto = ("Pause");
  fill(255);
  text (texto, (width/2)-60, (height/2)+20);
  noRotacion();
}

//Muestra los db de volúmen que está enviando el track o master dependiendo cuál se esté ejecuntando.
void vol(){
  textSize(25);
  texto = ("Vol");
  text(texto,(width/2)+220, (height/2)+210);
  texto = ("" + Math.floor(vlr * 120 ));
  text(texto,(width/2)+210, (height/2)+250);  
}

//Muestra el texto "1. vol" y ejecuta la función "circuloV()" para cambiar estado del círculo interno y rota las bolitas externas a la izquierda.
void track1(){
  colorR = 255;
  circuloV();
  texto = ("1. Vol");
  fill(255);
  text (texto,(width/2)-65, (height/2)+20);
  vol();
  rotacionR();
}

//Muestra el texto "2. vol" y ejecuta la función "circuloV()" para cambiar estado del círculo interno y rota las bolitas externas a la izquierda.
void track2(){
  colorR = 255;
  circuloV();
  texto = ("2. Vol");
  fill(255);
  text (texto,(width/2)-75, (height/2)+20);
  vol();
  rotacionR();
}

//Muestra el texto "3. vol" y ejecuta la función "circuloV()" para cambiar estado del círculo interno y rota las bolitas externas a la izquierda.
void track3(){
  colorR = 255;
  circuloV();
  texto = ("3. Vol");
  fill(255);
  text (texto,(width/2)-70, (height/2)+20);
  vol();
  rotacionR();
}

//Muestra el texto "M. vol" y ejecuta la función "circuloV()" para cambiar estado del círculo interno y rota las bolitas externas a la izquierda.
void master(){
  colorR = 255;
  circuloV();
  texto = ("M. Vol");
  fill(255);
  text (texto,(width/2)-75, (height/2)+20);
  vol();
  rotacionR();
}

//Barra "L" del vúmetro. Cambia de color cuando supera 85%.
void l(){
  v = vl * -100;
  if (v<=-85){
    color1 = 220;
    color2 = 0;
    color3 = 26;
  }
  else {
    color1 = 180;
    color2= 255;
    color3= 154;
  }
  noStroke();
  fill(color1, color2, color3);
  rect((width/2)-241, (height/2)+270, 10, v);
}

//Barra "R" del vúmetro. Cambia de color cuando supera 85%.
void r(){  
  v = vr * -100;
  if (v<=-85){
    color1 = 220;
    color2 = 0;
    color3 = 26;
  }
  else {
    color1 = 180;
    color2= 255;
    color3= 154;
  }
  noStroke();
  fill(color1, color2, color3);
  rect((width/2)-225, (height/2)+270, 10, v);
}

//Clip, se enciende cuando hay saturación en el master.
void Clilp(){
  Clip = valor * 150;
  if(Clip>= 127){
    c1 = 220;
    c2 = 0;
    c3 = 26;
  }
  else{
    c1 = 0;
    c2 = 0;
    c3 = 0;
  }
  fill(c1, c2, c3);
  circle((width/2)-228, (height/2)+160, 10);
}
//Animación que se ejecuta cuando está pausada la pista.
void animacion(){
  image(images[imageIndex], width/2 - 15, height/2 - 203);
  imageIndex = (imageIndex +1) % images.length;
}
