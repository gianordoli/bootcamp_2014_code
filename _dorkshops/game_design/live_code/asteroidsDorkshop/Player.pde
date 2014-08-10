class Player {
  float x; 
  float y; 
  
  float velocity; 
  float angle; 
  float rotation;
  float rotationRate;
  
  float shotTimer;
  float shotRate;
  
  float maxVelocity; 
  
  boolean alive;
  
  Player(float X, float Y) {
    x = X;
    y = Y; 
    
    shotRate = 5;
    shotTimer = 0;
    maxVelocity = 10; 
    alive = true; 
  }
  
  void display() {
   if (alive == true) {
    pushMatrix();
    translate(x,y);
    rotate(rotation);  
    noFill();
    stroke(200,255,255,180);
    triangle(0, 12, 8, -8, -8, -8);
    popMatrix();   
   }
  }
  
  void update() {
   if (alive == true) {
    //check postion against screen size
    if ( x < 0 ) {x = width;} 
    if ( x > width) {x = 0;}
    if ( y < 0) {y = height;}
    if ( y > height) {y = 0;} 
    
    rotation += rotationRate; 
    x += cos(angle) * velocity;
    y += sin(angle) * velocity;

    if (keyUp == true) {
      accelerate();
    } //else {     
      //velocity = velocity - (velocity * 0.01);
    //}
    if (keyLeft == true) {rotation -= 0.1;}
    if (keyRight == true) {rotation += 0.1;}   
    
    if (shotTimer > 0) {
      shotTimer--;
    } else {
      shotTimer = 0; 
    }
    
    if (keyShoot == true) {
      if (shotTimer == 0) {
        shoot();
        shotTimer = shotRate; 
      }
    }
   }
  }
  
  void accelerate() {
   if (alive == true) {
    float xt = cos(angle) * velocity + cos(rotation + PI/2) * 0.25;
    float yt = sin(angle) * velocity + sin(rotation+ PI/2) * 0.25; 
    if (velocity < maxVelocity) {
      velocity = sqrt(sq(yt)+sq(xt));
      angle = atan2(yt, xt);
    } else {
      velocity = maxVelocity - 0.1;
    }
   }
  }
  
  void shoot() {
   if (alive == true) {
    snd_shoot.play();
    snd_shoot.rewind();
    shots.add(new Shot(x, y, rotation + PI/2, 10, rotation + PI/2));
   }
 }
}
