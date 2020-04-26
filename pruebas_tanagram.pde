// campo de pruebas

boolean clicked=false;
boolean circle=false;
boolean circle2=false;
float xfig=50;
float yfig=50;
float x2=100;
float y2=100;
float angle=0;
float angle2=0;

//contador de pixeles blancos
int whites=0;
// boleano que me dice si se acabo el juego
boolean over=false;


void setup(){
  size(1000,1000);
  background(255,255,255);
  translate(50,50);
}


void draw(){
  if(!over){
    moveFigura();
    print(whites+"  ");
  }else{
    background(255,255,255);
  }
  
  
  
  

}


void figura(float x, float y){
  
  noStroke();
  //dibujar figura
  push();
  //trasladar origen a los x y
  translate(x,y);
  rectMode(CENTER);
  fill(242,12,24);
  //rotar figura:
  // el truco para que solo se voltee cuando el indicador esta activo esta en el momento en el que se cambia el angle.
  // hay que hacer 2 angles diferentes.
  rotate(radians(angle));
  square(0,0,105);
  //revisar que color del circulo usar dependiendo de si se clickea el mouse
  if(circle){
    fill(255,255,255);
  }else{
    fill(0,0,0);
  }
  //dibujar circulo de control en el centro de la figura
   circle(0,0,20);
  pop();
}

void figura2(float x, float y){  
  noStroke();
  //dibujar figura
  push();
  //trasladar origen a los x y
  translate(x,y);
  fill(27,227,27);
  //rotar figura
  rotate(radians(angle2));
  triangle(-150,55,150,55,0,-95);
  //revisar que color del circulo usar dependiendo de si se clickea el mouse
  if(circle2){
    fill(255,255,255);
  }else{
    fill(0,0,0);
  }
  //dibujar circulo de control en el centro de la figura
   circle(0,0,20);
  pop();
}


// mueve la figura
void moveFigura(){
  //fondo negro
  background(0,0,0);
  //figura nivel 1
  nivel1();
// caso figura1
  //checar que esta en el rango x,y del circulo:
  if(mouseX<=xfig+20 & mouseX>=xfig-20 & mouseY<=yfig+20 & mouseY>=yfig-20){
      // checar que el mouse ha sido presionado.
      if(clicked){
        xfig=mouseX;
        yfig=mouseY;
        circle=true;
      }
//caso figura 2:
  }else if(mouseX<=x2+20 & mouseX>=x2-20 & mouseY<=y2+20 & mouseY>=y2-20){
       if(clicked){
        x2=mouseX;
        y2=mouseY;
        circle2=true;
       }
// nigun caso:
  }else{
    circle=false;
    circle2=false;
  }
  //dibuja la figura en la x y y seleccionadas.
  figura(xfig,yfig);
  figura2(x2,y2);
  checkWin();

}

// cambia el angulo dependiendo de la variable circle de cada figura;
void changeAngle(int n){
  if(circle){
     angle=angle+n;  
   }else if(circle2){
     angle2=angle2+n;
   } 
}

//funcion que dibuja la figura del nivel 1
void nivel1(){
  fill(255,255,255);
  square(width/2,height/2,104);

}

//funcion que revisa si los pixeles de la figura ya fueron tapados(Gana eljuego)
// revisar que todos los pixeles no sean de color blanco
// adquirir los valores de red, green y blue de cada ccolor del pixel y compararlos
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
    //si funciona;  
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
}


void mousePressed(){
  clicked=!clicked;
  
  if(over){
    //volver over falso
    over=!over;
    //reiniciar valores de juego
    clicked=false;
    circle=false;
    circle2=false;
    xfig=50;
    yfig=50;
    x2=100;
    y2=100;
    angle=0;
    angle2=0;
  }

}
