class Shot {
  float x;
  float y; 
  float velocity; 
  float angle;
  float rotation;
  float rotationRate;
  
  int lifespan; 
  int runtime; 

  Shot(float X, float Y, float A, float V, float R) {
    x = X; 
    y = Y; 
    angle = A;
    velocity = V;
    rotation = R;
    
    lifespan = 35; 
    runtime = 0; 
  }  

  void update() { 
    //check postion against screen size
    if ( x < 0 ) {x = width;} 
    if ( x > width) {x = 0;}
    if ( y < 0) {y = height;}
    if ( y > height) {y = 0;} 
    
    rotation += rotationRate; 
    x += cos(angle) * velocity;
    y += sin(angle) * velocity; 
  }
  
  void dissipate(int index) {
    runtime++;
    if (runtime > lifespan) {
      shots.remove(index);
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(200, 255, 255);
    ellipse(0, 0, 3, 3);
    popMatrix();
  }
}

