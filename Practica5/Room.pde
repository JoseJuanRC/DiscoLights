// Room
PShape wall, floor, ceiling;
float dis = 500; // Esquinas de la habitación
int roomHeight = 500;

// Ball
PShape bola;
float ballRadius = 50,  ballRotationAngle = 0, ballRotationInc = 0.01f;
float speedChangeLights = 200;

float vy = -roomHeight+ballRadius/2; 
float concentration = 8;
float dirX = 1, dirZ =0;


// Definimos los distintos objetos y sus posiciones
void setUpRoom() {
  floor = createShape(RECT, -dis/2, -dis/2, dis, dis);
  PImage texture = loadImage( "data/textures/floor.jpg");
  floor.setTexture(texture);

  ceiling = createShape(RECT, -dis/2, -dis/2, dis, dis);
  ceiling.translate(0,0,roomHeight);
  texture = loadImage( "data/textures/ceiling.jpg");
  ceiling.setTexture(texture);
  
  wall = createShape(RECT, -dis/2, -roomHeight, dis, roomHeight);
  wall.translate(0,0,dis/2);
  texture = loadImage( "data/textures/wall.jpg");
  wall.setTexture(texture);
  
  bola = createShape(SPHERE,ballRadius);
  texture = loadImage( "data/textures/discoball.jpg");
  bola.setTexture(texture);
  bola.translate(0,-roomHeight+ballRadius*1.1,0);
}

// Distintos métodos para dibujar los elementos del programa
void drawFloor() {
  push();
  rotateX(PI/2);
  shape(floor);
  pop();
}

void drawCeiling() {
  push();
  rotateX(PI/2);
  shape(ceiling);
  pop();
}
 

void drawWalls() {
  push();
  shape(wall);
  rotateY(PI/2);
  shape(wall);
  rotateY(PI/2);
  shape(wall);
  rotateY(PI/2);
  shape(wall);
  pop();
}

void drawDiscoBall() {
  if (mousePressed) roomLightsBall();
  ballRotationAngle = (ballRotationAngle+ballRotationInc)%360;
  push();
  rotateY(-ballRotationAngle);
  shape(bola);
  pop();
  
}


// Se activan las luces que interactuan con la habitación
void roomLights() {
  rotateLights();

  spotLight(255, 0, 0, 
            0, vy, 0, 
            dirX, 1, dirZ, 
            PI/2, concentration); 
 spotLight(92, 207, 255, 
            0, vy, 0, 
            -dirX, 1, dirZ, 
            PI/2, concentration); 
  spotLight(0, 255, 85, 
            0, vy, 0, 
            dirX, 1, -dirZ, 
            PI/2, concentration);  
            
  spotLight(195, 54, 255, 
            
            0, vy, 0, 
            
            -dirX, 1, -dirZ, 
            PI/2, concentration); 
  
}


// Se activan las luces que interactuan con la bola exclusivamente
void roomLightsBall() {

  spotLight(255, 0, 0, 
            dirX*2*ballRadius, vy+3*ballRadius, dirZ*2*ballRadius, 
            -dirX, -1, -dirZ, 
            PI/2, 10); 
  spotLight(0, 255, 85, 
            dirX*2*ballRadius, vy+3*ballRadius, -dirZ*2*ballRadius, 
            -dirX, -1, dirZ,  
            PI/2, 10); 
  spotLight(92, 207, 255, 
            -dirX*2*ballRadius, vy+3*ballRadius, dirZ*2*ballRadius, 
            dirX, -1, -dirZ,  
            PI/2, 10); 
  spotLight(195, 54, 255, 
            -dirX*2*ballRadius, vy+3*ballRadius, -dirZ*2*ballRadius, 
            dirX, -1, dirZ,  
            PI/2, 10); 

  
}

// Rotamos la bola y sus luces
void rotateLights() {

  float angle = speedChangeLights*ballRotationInc;
  
  // Rotamos con respecto a Y
  float[] xAxis = {cos(radians(angle)) ,0, sin(radians(angle))};
  float[] yAxis = {0, 1,0};
  float[] zAxis = {-sin(radians(angle)), 0, cos(radians(angle))};
  
  float pointX = dirX;
  float pointY = 1;
  float pointZ = dirZ;
  
  dirX = pointX * xAxis[0] + pointY * yAxis[0] + pointZ * zAxis[0] + 0;
  dirZ = pointX * xAxis[2] + pointY * yAxis[2] + pointZ * zAxis[2] + 0;
}

void drawRoom() {
  if (mousePressed) roomLights();
  
  drawObjects();
  
  drawFloor();
  drawCeiling();
  drawWalls();
  
  drawDiscoBall();
}
