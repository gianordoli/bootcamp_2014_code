class Asteroid {
  float x;
  float y; 
  float velocity;
  float angle; 
  float rotation;
  float rotationRate;
  float siz;
  int type;


  Asteroid(float xx, float yy, float vel, int typ, float ang, float rot) {
    x = xx;
    y = yy; 
    velocity = vel;
    angle = ang;
    rotation = rot;
    type = typ;

    // determine size based on type
    if (type == 0) {
      siz = random(80, 100);
    } else if (type == 1) {
      siz = random(60, 80);
    } else if (type == 2) {
      siz = random(30, 70);
    } else if (type == 3) {
      siz = random(18, 25);
    }
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
  } 

  void display() {
    pushMatrix();
    translate(x, y); 
    noFill();
    stroke(200, 255, 255, 180);
    strokeWeight(1);
    rotate(rotation);
    //fill(200, 255, 255, 200);
    ellipse(0, 0, siz, siz);
    strokeWeight(2);
    stroke(200, 255, 255, 100);
    ellipse(0, 0, siz, siz);
    //rotate(-rotation);  //???????
    //translate(-x, -y);    //???????
    popMatrix();
  }

  void shotCollision(Shot shot, Asteroid asteroid, int asteroidIndex, int shotIndex) {
    if ( dist(x, y, shot.x, shot.y) < siz/2 + 3) {
      fill(200, 255, 255, 180);
      ellipse(shot.x, shot.y, 25, 25);
      shots.remove(shotIndex);   
      snd_explosion.play();
      snd_explosion.rewind();
      if (asteroid.type == 0) {
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(1), 1, random(radians(359)), 0));
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(1), 1, random(radians(359)), 0));
      } else if (asteroid.type == 1) {
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(1), 2, random(radians(359)), 0));
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(1), 2, random(radians(359)), 0));
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(1), 2, random(radians(359)), 0));
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(1), 2, random(radians(359)), 0));
      } else if (asteroid.type == 2) {
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(2), 3, random(radians(359)), 0));
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(2), 3, random(radians(359)), 0));
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(2), 3, random(radians(359)), 0));
        asteroids.add(new Asteroid(x+random(-5, 5), y+random(-5, 5), asteroid.velocity+random(2), 3, random(radians(359)), 0));
      }
      fill(200, 255, 255, 10);
      noStroke();
      rectMode(CORNER);
      rect(0, 0, width, height);
      asteroids.remove(asteroidIndex);
    }
  }

  void playerCollision(Player player, Asteroid asteroid, int asteroidIndex) {
    if ( dist(x, y, player.x, player.y) < siz/2 + 5) {
      //asteroids.remove(asteroidIndex);
      snd_gameOver.play();
      snd_gameOver.rewind();
      fill(200, 255, 255, 180);
      ellipse(player.x, player.y, 100, 100);
      ellipse(player.x, player.y, 70, 70);
      ellipse(player.x, player.y, 40, 40);
      ellipse(player.x, player.y, 20, 20);
      player.alive = false;
      player.deathTime = millis(); 
      noStroke();
      rectMode(CORNER);
      fill(200, 255, 255, 20);
      rect(0, 0, width, height);
    }
  }
} 

