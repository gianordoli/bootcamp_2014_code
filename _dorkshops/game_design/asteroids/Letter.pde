class Letter {
  float x;
  float y; 
  float velocity;
  float angle; 
  float rotation;
  float rotationRate;
  char character;

  Letter(float xx, float yy, float vel, float ang, float rot, char chara) {
    x = xx;
    y = yy; 
    velocity = vel;
    angle = ang;
    rotation = rot;
    character = chara;
  }

  void update() {
    //screen wrap
    if (x < -10) {
      x = width-10;
    }
    if (x > width+10) {
      x = 10;
    }
    if (y < -10) {
      y = height-10;
    }
    if (y > height+10) {
      y = 10;
    }

    //changes position and rotation
    rotation += rotationRate;
    //newtonian integration
    x += cos(angle) * velocity;
    y += sin(angle) * velocity;
    
    velocity *= 0.95;
    rotationRate *= 0.95;
  } 

  void display() {
    pushMatrix();
    translate(x, y); 
    rotate(rotation);
    fill(200, 255, 255, 30);
    textSize(38);
    textAlign(CENTER, CENTER);
    text(character, 0, 0);
    noFill();
    //rectMode(CORNER);
    //rect(0,-10,20,28);
    //rotate(-rotation);  //???????
    //translate(-x, -y);    //???????
    popMatrix();
  }

  void shotCollision(Shot shot) {
    if ( dist(x, y, shot.x, shot.y) < 20) {
      velocity += random(1);
      fill(200, 255, 255, 180);
      ellipse(shot.x,shot.y,25,25);
      if (shot.x > x) {        
        angle += radians(int(random(315, 405)));
      } else if (shot.x < x) {
        angle += radians(int(random(135, 225)));
        
      }
      if (shot.y > y) {
        angle += radians(int(random(45, 135)));
      } else if (shot.y < y) {
        angle += radians(int(random(215, 305)));
      }
      rotationRate = radians(int(random(-20, 20)));
    }
  }
}

