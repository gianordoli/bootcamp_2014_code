import ddf.minim.*;

Minim minim;
AudioPlayer snd_shoot;

Player ship;
ArrayList<Shot> shots;
ArrayList<Asteroid> asteroids;

boolean keyUp = false; 
boolean keyLeft = false;
boolean keyRight = false;
boolean keyShoot = false;

void setup() {
  size(1000,800);
  frameRate(30); 
  background(10);
  ship = new Player(width/2, height/2);
  shots = new ArrayList<Shot>();
  asteroids = new ArrayList<Asteroid>();
  minim = new Minim(this);
  snd_shoot = minim.loadFile("shoot.wav");
  noCursor(); 
  restart();
}

void draw() {
  rectMode(CORNER);
  fill(10, 80);
  noStroke(); 
  rect(0,0,width,height); 
  ship.display(); 
  ship.update(); 
  
  for (int i = 0; i < shots.size(); i++ ) {
    Shot tempShot = shots.get(i);
    tempShot.update();
    tempShot.display(); 
    tempShot.dissipate(i);
  }
  
  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid tempAst = asteroids.get(i);
    tempAst.update();
    tempAst.display();
    for (int j = 0; j < shots.size(); j++) {
      Shot tempShot = shots.get(j);
      tempAst.shotCollision(tempShot, tempAst, i, j);
    } 
    if (ship.alive == true) {
      tempAst.playerCollision(ship, tempAst);
    }
  }
  
  if (ship.alive == false) {
    restart();
  } 
  
} 

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {keyUp = true;} 
    if (keyCode == LEFT) {keyLeft = true;} 
    if (keyCode == RIGHT) {keyRight = true;}
  }
  if (key == ' ') {keyShoot = true;}
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {keyUp = false;} 
    if (keyCode == LEFT) {keyLeft = false;} 
    if (keyCode == RIGHT) {keyRight = false;}
  } 
    if (key == ' ') {keyShoot = false;}
}

void restart() {
  asteroids.clear(); 
  asteroids.add(new Asteroid(random(50,400), random(50,750), random(1,3), 0, random(radians(359)),0));
  asteroids.add(new Asteroid(random(50,400), random(50,750), random(1,3), 0, random(radians(359)),0));
  asteroids.add(new Asteroid(random(50,400), random(50,750), random(1,3), 0, random(radians(359)),0));
  asteroids.add(new Asteroid(random(50,400), random(50,750), random(1,3), 0, random(radians(359)),0));
  ship.x = width/2;
  ship.y = height/2; 
  ship.velocity = 0; 
  ship.alive = true; 
} 
