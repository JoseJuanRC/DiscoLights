boolean isIntroActive = true;
boolean changeState = false;
PFont f;

PImage backgroundImage;

void setup() {
  size(800, 800,P3D);
  
  noStroke();
  intro("Pulsa enter para continuar\n");
  
  setupCam();
  setUpRoom();
  setUpObjects();    

  // Cargamos la imagen de espera
  backgroundImage = loadImage("data/loading.png");
  
}

void draw() {
  if (isIntroActive) {
    if (changeState) {
      background(backgroundImage);
      changeState = false;
      isIntroActive = false;
    }
    
    
  } else {
    background(120);
    
    // Si no pulsamos el boton añadimos la luz ambiente (si se pulsa se hará con la bola)
    if (!mousePressed) {
      ambientLight(100,100,100);
      directionalLight(60,60,60,1,1,1);
    }     
    
    drawCam();
    drawRoom();
    saveFrame ("gif/fotograma−####.png" ) ;
  }
}

void intro(String text) {
  background(0);
  textAlign(CENTER);
  f = createFont("Arial",62,true); 
  textFont(f);
  text("Bola de luces",width/2,height/8); 
  
  textAlign(CENTER);
  f = createFont("Arial",28,true); 
  textFont(f);
  text("Controles",width/2,height/3.8); 
  textAlign(LEFT);
  f = createFont("Arial",20, true); 
  textFont(f);
  text("A/D:        Muevete a la izquierda o derecha",width/20,height/2.4);  
  text("W/S:        Muevete hacia delante o atras",width/20,height/2.05);  
  text("Ratón:      Mueve la la vista del usuario",width/20,height/1.8);  

  
  textAlign(CENTER);
  f = createFont("Arial",16,true); 
  f = createFont("Arial",20, true); 
  textFont(f);
  text(text,width/2,height/1.25); 

}

void keyPressed() {
  if (keyCode == ENTER)
    if (isIntroActive) {
      changeState = true;
      print(changeState);

    }
  
  
}
