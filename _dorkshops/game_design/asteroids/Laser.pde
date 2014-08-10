class Shot {
  float x;
  float y;
  float velocity;
  float angle;
  float rotation;
  float rotationRate; 
  int lifespan;
  int runtime;

  Shot(float xx, float yy, float ang, float vel, float rot) {
    x = xx;
    y = yy;
    angle = ang; 
    velocity = vel;
    rotation = rot;
    lifespan = 25;
    runtime = 0;
  } 

  void update() {
    //screen wrap
    if (x < 0) {
      x += width;
    }
    if (x > width) {
      x = 0;
    }
    if (y < 0) {
      y = height;
    }
    if (y > height) {
      y = 0;
    }

    //changes position and rotation of ship
    rotation += rotationRate;
    //newtonian integration
    x += cos(angle) * velocity;
    y += sin(angle) * velocity;
  } 

  void display() {
    pushMatrix();
    translate(x, y); 
    rectMode(CENTER);
    fill(200, 255, 255);
    //noStroke();
    rotate(rotation);
    ellipse(0, 0, 1, 1);
    fill(200, 255, 255,180);
    ellipse(0, 0, 2, 2);
    fill(200, 255, 255,100);
    ellipse(0, 0, 3,3);
    fill(200, 255, 255,30);
    ellipse(0, 0, 4, 4);

    //rotate(-rotation);  //???????
    //translate(-x, -y);    //???????
    popMatrix();
  }

  void dissipate(int index) {
    runtime++; 
    if (runtime > lifespan) {
      shots.remove(index);
    }
  }
}  

