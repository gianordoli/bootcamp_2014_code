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

  float deathTime;

  Player(float xx, float yy) { 
    x = xx;
    y = yy;

    shotTimer = 5;
    shotRate = 5; 
    maxVelocity = 10;

    alive = true;
  }

  void update() {
    if (alive == true) {
      //screen wrap
      if (x < 0) {
        x = width;
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
    } else {
      x = width/2;
      y = height/2;
      velocity = 0;
    }
  } 

  void display() {
    if (alive == true) {
      pushMatrix();
      translate(x, y); 
      noFill();
      stroke(200, 255, 255, 180);
      strokeWeight(1);
      rotate(rotation);
      triangle(0, 12, 8, -8, -8, -8);
      stroke(200, 255, 255, 100);
      strokeWeight(2);
      triangle(0, 12, 8, -8, -8, -8);
      //rotate(-rotation);  //???????
      //translate(-x, -y);    //???????
      popMatrix();
    }
  }

  void accelerate() {
    if (alive == true) {
      float xt = cos(angle)*velocity+cos(rotation+PI/2)*.25;
      float yt = sin(angle)*velocity+sin(rotation+PI/2)*.25;
      if (velocity < maxVelocity) {
        velocity=sqrt(sq(yt)+sq(xt));
        angle=atan2(yt, xt);
      } else {
        velocity = maxVelocity - 0.1;
      }
    }
  }

  void shoot() {
    if (alive == true) {
      noStroke();
      rectMode(CORNER);
      fill(200, 255, 255, 10);
      rect(0, 0, width, height);
      snd_shoot.play(); 
      snd_shoot.rewind();
      shots.add(new Shot(x, y, rotation + PI/2 /*+ random(-PI/64, PI/64)*/, 17 /*+ velocity*/, rotation + random(-PI/64, PI/64)));
    }
  }
} 

