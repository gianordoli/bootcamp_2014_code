class Ball {
  float x;
  float y;
  float w;
  float h; 
  float velX;
  float velY;

  Ball(float X, float Y) {
    x = X;
    y = Y;
    velX = 4;
    velY = 6;
  }

  void display() {
    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(x, y, 10, 10);
  }

  void update() {
    x += velX;
    y += velY;

    if (x <= 0 || x >= width) {
      velX = -velX;
      x = constrain(x, 0, width);
    }
    if (y <= 0 || y >= height) {
      velY = -velY;
      y = constrain(y, 0, height);
    }
  }

  void brickCollision (Brick brick) {
    if (brick.alive) {
      if (brick.doesPointTouchMe(x, y)) {
        int rand = int(random(2));
        x = x - velX;
        y = y - velY;
        if (rand == 0) {
          velX = -velX + random(2);
        } else {
          velX = velX + random(2);
        }
        velY = -velY;
        brick.alive = false;
      }
    }
  }

  void paddleCollision (Paddle paddle) {
    if (paddle.doesPointTouchMe(x, y)) {
      int rand = int(random(2));
      x = x - velX;
      y = y - velY;
      if (rand == 0) {
        velX = -velX + random(2);
      } else {
        velX = velX + random(2);
      }
      velY = -velY;
    }
  }
}

