class Asteroid {
  float x;
  float y;
  float velocity;
  float angle;
  float rotation;
  float rotationRate;
  float w;
  int type;
  
  Asteroid(float X, float Y, float V, int T, float A, float R) {
    x = X;
    y = Y; 
    velocity = V;
    angle = A;
    type = T;
    rotation = R;
    
    //determine size based on 'type'
    if (type == 0) {
      w = random(80,100);
    } else if (type == 1) {
      w = random(60,80);
    } else if (type == 2) {
      w = random(30,60);
    } else if (type == 3) {
      w = random(15,25);
    } 
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
  
  void display() {
    pushMatrix();
    translate(x,y); 
    noFill();
    stroke(200,255,255,180);
    rotate(rotation);
    ellipse(0,0,w,w);
    popMatrix(); 
  }
  
  void shotCollision(Shot shot, Asteroid asteroid, int asteroidIndex, int shotIndex) {
    if ( dist(x,y, shot.x,shot.y) < w/2 + 2) {
      shots.remove(shotIndex);
      if (asteroid.type == 0) {
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 1, random(radians(359)),0));
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 1, random(radians(359)),0));
      }
      else if (asteroid.type == 1) {
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 2, random(radians(359)),0));
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 2, random(radians(359)),0));
      }
      else if (asteroid.type == 2) {
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 3, random(radians(359)),0));
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 3, random(radians(359)),0));
      }
      asteroids.remove(asteroidIndex); 
    }
  }
  
  void playerCollision(Player player, Asteroid asteroid) {
    if ( dist(x, y, player.x, player.y) < w/2 + 5) {
      fill(200,255,255,180);
      ellipse(player.x,player.y,100,100);
      player.alive = false;
    }
  }
}
