
PShape stool, table, person;


// Definimos los objetos, sus posiciones, rotaciones y escalas.
void setUpObjects() {
  stool = loadShape("data/models/B_Daily_R_Vr_N_Chair_0011.obj");
  PImage texture = loadImage( "data/textures/wood.jpg");
  stool.scale(2);
  stool.translate(100,0,150);
  stool.setTexture(texture);
  stool.rotateX(PI);
  
  table = loadShape("data/models/Side_Table.obj");
  texture = loadImage( "data/textures/wood.jpg");
  table.scale(100);
  table.translate(0,0,-220);
  table.setTexture(texture);
  table.rotateX(PI);
  
  person = loadShape("data/models/BaseMesh_Man_Simple.obj");
  person.scale(0.7);
  person.rotateX(PI);
  person.translate(-150,0,180);
  texture = loadImage( "data/textures/brown.png");
  person.setTexture(texture);
}

// Distintos métodos para dibujar cada objeto
void drawChairs() {
  push();
  shape(stool);
  rotateY(PI/4);
  shape(stool);
  rotateY(PI/3);
  shape(stool);
  
  pop();
}

void drawTables() {
  shape(table);
}

void drawPeople() {
  push();
  shape(person);
  rotateY(PI/2);
  shape(person);
  pop();
}

void drawObjects() {
  drawChairs();
  drawTables();
  drawPeople();
}
