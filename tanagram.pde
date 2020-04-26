// Tanagram

// variables de posición de los centros de las siete figuras

//triangulo verde: (1)
float xgreen=150;
float ygreen=210;
boolean circle1=false;
float angle1=90;
//triangulo naranja (2)
float xorange=345;
float yorange=110;
boolean circle2=false;
float angle2=0;
//cuadrado (3)
float xsquare=319; 
float ysquare=209;
boolean circle3=false;
float angle3=45;
// triangulo morado (4)
float xpurpple=248;
float ypurpple=163;
boolean circle4= false;
float angle4=45;
//triangulo rojo (5)
float xred=245;
float yred=300;
boolean circle5= false;
float angle5=270;
// triangulo amarillo (6)
float xyellow=364;
float yyellow=283;
boolean circle6= false;
float angle6=0;
// paralelogramo (7)
float xblue=205;
float yblue=100;
boolean circle7= false;
float angle7=0;

// lista que guarda las variables correspondientes a cada figura
int [] figuras= {1,2,3,4,5,6,7};

// variable que me dice si el mouse ha sido clickeado.
boolean clicked=false;
// contador que me dice cuantos pixeles blancos hay en pantalla:
int whites=0;
//booleano que me dice si el juego se acabo
boolean over=false;


void setup(){
  // tamaño y color de la pantalla
  size(1000,1000);
  //trasladar todo a 50,50 para que no quede en la esquina superior izq.
  translate(50,50);
}

void draw(){
 //jugar si over es false y no jugar si es verdadero.
 if(!over){
   inicio();
   print(whites+"  ");
 }else{
   gameOver();
 }

}


// dibuja el triangulo rojo grande
void drawRedTriangle(float x,float y){
  noStroke();
  push();
  // trasladar origen al punto de control
  translate(x,y);
  // primero dibujar triangulo
  fill(242,12,24);
  //rotar figura:
  rotate(radians(angle5));
  triangle(-60,-150,-60,150,90,0);
  // dibujar circulo central de control
  if(circle5){
    fill(255,255,255);
  }else{fill(0,0,0);}
  circle(0,0,20);
  pop();
}

//dibuja el triangulo verde grande.
void drawGreenTriangle(float x,float y){
  noStroke();
  push();
  translate(x,y);
  //dibujar triangulo 
  fill(27,227,27);
  rotate(radians(angle1));
  triangle(-150,55,150,55,0,-95);
  // dibujar circulo de control
  if(circle1){
    fill(255,255,255);
  }else{fill(0,0,0);}
  circle(0,0,20);
  pop();
}

// dibuja el triangulo pequeño amarillo.
void drawYellowTriangle(float x, float y){
  noStroke();
  push();
  translate(x,y);
  // dibujar triangulo
  fill(252,252,58);
  rotate(radians(angle6));
  triangle(30,75,30,-75,-45,0);
  // dibbujar circulo de control
  if(circle6){
    fill(255,255,255);
  }else{fill(0,0,0);}
  circle(0,0,20);
  pop();
}

// dibuja el cuadrado/ zaul claro
void drawSquare(float x, float y){
  noStroke();
  rectMode(CENTER); // modo para todos los cuadros dibujados desde el centro
  push();
  // mover el origen al punto de pivote
  translate(x,y);
  // rotar el plano
  rotate(radians(angle3));
  // dibujar el cuadrado en el nuevo origen ya rotado /azul claro
  fill(73,235,235);
  square(0,0,105);
  // dibujar circulo de control;
  if(circle3){
    fill(255,255,255);
  }else{fill(0,0,0);}
  circle(0,0,20);
  pop();
}

//dibuja el triangulo pequeño morado:
void drawPurppleTriangle(float x, float y){
  noStroke();
  push();
  // mover el origen al punto de pivote
  translate(x,y); //x+225, y+75
  // dibujar el triangulo ya rotado
  fill(232,16,228);
  //rotar el plano
  rotate(radians(angle4));
  triangle(30,-70,30,35,-75,35);
  //dibujar circulo de control
  if(circle4){
    fill(255,255,255);
  }else{fill(0,0,0);}
  circle(0,0,20);
  pop();
}
  
// dibuja el paralelogramo / azul oscuro
void drawParalelogram(float x, float y){
  noStroke();
  push();
  translate(x,y); // trasladar el origen al x, y del input.
  // dibujar paralelogramo alrededor
  fill(17,55,242);
  rotate(radians(angle7));
  beginShape();
  vertex(0-110,0-40);// original 0,0
  vertex(150-110,0-40); // original 150,0
  vertex(225-110,75-40);// original 225,75
  vertex(75-110,75-40);// original 75,75
  endShape(CLOSE);
  //dibujar circulo de control despues para que no lo tape el paralelogramo
  // blanco si se presiono el mouse, negro si se vuelve a apresionar (indicador)
  if(circle7){
    fill(255,255,255);
  }else{fill(0,0,0);}
  circle(0,0,20);
  pop();
}

// dibuja el triangulo mediano narajo
void drawOrangeTriangle(float x, float y){
  noStroke();
  push();
  // trasladar origen a x,y
  translate(x,y);
  //dibujar triangulo
  fill(252,157,73);
  rotate(radians(angle2));
  triangle(50,-50,50,100,-100,-50);
  //dibujar circulo de control negro
  if(circle2){
    fill(255,255,255);
  }else{fill(0,0,0);}
  circle(0,0,20);
  pop();
}

// funcion que dibuja el tanagram en posicion inicial (puede ser un reinicio)
void inicio(){ 
  // poner fondo negro
  background(0,0,0);
  //dibujar figura del nivel 1
  nivel1();
  //revisar si las condiciones para manipular una figura son cumplidas
  checkPoint();
  
  // dibujar primer triangulo /rojo
  drawRedTriangle(xred,yred);
  // dibujar el otro triangulo grande de igual tamaño /verde
  drawGreenTriangle(xgreen,ygreen);
  //dibujar el triangulo más pequeño amarillo
  drawYellowTriangle(xyellow,yyellow);
  // dibujar cuadrado / azul claro
  drawSquare(xsquare,ysquare);
  // dibujar el otro triangulo pequeño ya rotado:  / morado
  drawPurppleTriangle(xpurpple,ypurpple);
  //dibujar paralelogramo:  /azul oscuro
  drawParalelogram(xblue,yblue);
  //dibujar único triangulo mediano /naranja
  drawOrangeTriangle(xorange,yorange);
  //revisar si ya se gano
  checkWin();

}

//figuras de los niveles a hacer
void nivel1(){
  beginShape();
  //recortarle dos pixeles a los bordes para evitar errores al momento de evaluar los pixeles blancos
  fill(255,255,255);
  //empieza desde la ezquina inferior izquierda
  vertex(385,853);
  vertex(385,645);//210y punta inf derecha triangulo mediano
  vertex(490,541);//32 o 22 punta sup triangulo mediano
  vertex(517,574);//74 punta izq cuadrado //los valores podrian estar invertidos
  vertex(596,500);//74 punta sup cuadrado
  vertex(669,573);//punta previa a inf cuello
  vertex(680,560);//150y punta inf cuello
  vertex(681,434);//150x punta sup cuello
  vertex(826,433);//75 punta sup derecha
  vertex(754,504);//0,150 punta sup paralelogramo
  vertex(754,654);//75,75 paralelogramo medio
  vertex(680,728);//0,150 paralelogramo inferior
  vertex(680,860);//150 esquina inferior derecha
  vertex(530,708);//150 punta hueco
  vertex(385,853);
  
  endShape();

}

// funcion que guarda el punto donde se quedo la figura una vez clicked se vuelva false;
//tambien debe mantenerse dibujando esa figura en esa posición
void checkPoint(){
  //chekar si el mouse esta en la posición del centro del circulo de dicha figura:
  // el error es que primero toca confirmar la posicion y luego si esta clickeado
  
    //caso triangulo verde
     if(mouseX<= (xgreen+20) & mouseX>=(xgreen-20) & mouseY<= (ygreen+20) & mouseY>=(ygreen-20)){
         if(clicked){
           xgreen=mouseX;
           ygreen=mouseY;
           circle1=true;
         }
       //caso triangulo rojo
     }else if(mouseX<=(xred+20) & mouseX>=(xred-20) & mouseY<= (yred+20) & mouseY>=(yred-20)){
         if(clicked){
           xred=mouseX;
           yred=mouseY;
           circle5=true;
         }
       
     // caso triangulo amarillo
     }else if(mouseX<= (xyellow+20) & mouseX>=(xyellow-20) & mouseY<= (yyellow+20)& mouseY>=(yyellow-20) ){
         if(clicked){
           xyellow=mouseX;
           yyellow=mouseY;
           circle6=true;
         }      
     
       // caso triangulo morado
     }else if(mouseX<= (xpurpple+20)& mouseX >= (xpurpple-20) & mouseY<= (ypurpple+20) & mouseY>=(ypurpple-20)){
         if(clicked){
           xpurpple=mouseX;
           ypurpple=mouseY;
           circle4=true;
         }
       
       //caso triangulo naranja
     }else if(mouseX<= (xorange+20) & mouseX>=(xorange-20) & mouseY<= (yorange+20) & mouseY>=(yorange-20) ){
        if(clicked){
           xorange= mouseX;
           yorange= mouseY;
           circle2=true;
         }  
       
       // caso cuadrado
     }else if (mouseX<= (xsquare+20) & mouseX>=(xsquare-20) & mouseY<= (ysquare+20) & mouseY>=(ysquare-20) ){
         if(clicked){ 
           xsquare=mouseX;
           ysquare=mouseY;
           circle3=true;
         } 
       
       //caso paralelogramo
     }else if(mouseX<= (xblue+20 )& mouseX>=(xblue-20) & mouseY<= (yblue+20) & mouseY>=(yblue-20) ){
         if(clicked){
           xblue=mouseX;
           yblue=mouseY;
           circle7=true;
         }
     }else{
       circle1=false;
       circle2=false;
       circle3=false;
       circle4=false;
       circle5=false;
       circle6=false;
       circle7=false;
     }
}

// cambia el angulo dependiendo de la variable circle de cada figura;
void changeAngle(int n){
  if(circle1){
     angle1+=n;  
   }else if(circle2){
     angle2+=n;
   }else if(circle3){
     angle3+=n;
   }else if(circle4){
     angle4+=n;
   }else if(circle5){
     angle5+=n;
   }else if(circle6){
     angle6+=n;
   }else if(circle7){
     angle7+=n;
   }
}

//funcion que revisa si los pixeles de la figura ya fueron tapados(Gana eljuego)
// revisar que todos los pixeles no sean de color blanco
// adquirir los valores de red, green y blue de cada ccolor del pixel y comparlos
//con los del blanco
void checkWin(){
  //recibir los pixeles del canvas
  loadPixels();
  // reiniciar contador de blancos
  whites=0;
  // for que revise cada pixel del canvas
  for(int i=0;i<width*height;i++){
    //extraer los rgb de cada pixel
    float r= red(pixels[i]) ;
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    // comparar cada valor con los de blanco, y si es blanco el contador aumenta.
    if(r==255 & g==255 & b==255){
      whites++;
    }
    
  }
  // revisar si el contador whites es 0, para ver si se termina el juego 
  if(whites==0){
    over=true;
  }
  
}

//funcion invocada cuando se acaba el juego
void gameOver(){
  //poner fondo amarillo
  background(240,236,12);
  // escribirr felicidades ganaste
  textAlign(CENTER);
  textSize(56);
  fill(250,20,28);
  //recordar que rectMode esta en center
  text("Felicidades Ganaste!",width/2,height/3);
  
  // escribir presiona Enter para volver a jugar debajo de Felicidades
  textSize(40);
  fill(51,212,42);
  text("Presiona Enter para volver a jugar",width/2,(height/4)*3);
  
  //reiniciar valores de juego
  //triangulo verde: (1)
  xgreen=150;
  ygreen=210;
  circle1=false;
   angle1=90;
  //triangulo naranja (2)
  xorange=345;
  yorange=110;
  circle2=false;
  angle2=0;
  //cuadrado (3)
  xsquare=319; 
  ysquare=209;
  circle3=false;
  angle3=45;
  // triangulo morado (4)
  xpurpple=248;
  ypurpple=163;
  circle4= false;
  angle4=45;
  //triangulo rojo (5)
  xred=245;
  yred=300;
  circle5= false;
  angle5=270;
  // triangulo amarillo (6)
  xyellow=364;
  yyellow=283;
  circle6= false;
  angle6=0;
  // paralelogramo (7)
  xblue=205;
  yblue=100;
  circle7= false;
  angle7=0;
  //bolleana clicked
  clicked=false;
  
}

//funcion que se dispara cuando se presiona alguna tecla
void keyPressed(){
  if(key==CODED){
    if(keyCode == UP ){
      changeAngle(5);
    }else if(keyCode== DOWN){
      changeAngle(-5);
    }else if(keyCode== LEFT){
      changeAngle(-5);
    }else if(keyCode== RIGHT){
      changeAngle(5);
    }
  }
  
 if(keyCode== ENTER){
   //cambiar el valor de over si el juego ya se acabo
   if(over){
     over=!over;
   }
 }
 
}

// Funcion que se activa despues de que se clickea el mouse.
void mouseClicked(){
  clicked = !clicked;

}
