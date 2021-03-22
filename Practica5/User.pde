import queasycam.*; // Libreria: https://github.com/jrc03c/queasycam

float roomLimit = 460f;
QueasyCam cam;

void setupCam(){
  cam = new QueasyCam(this);
}

void drawCam(){
  background(0);
  cam.position.y = -100; // Fijamos la altura del jugador
  
  // Fijamos los limites de movimiento en la habitación
  cam.position.x = min(roomLimit/2, max(cam.position.x, -roomLimit/2));
  cam.position.z = min(roomLimit/2, max(cam.position.z, -roomLimit/2));
}
