//SIMPLE ASTEROIDS
//for MFADT bootcamp 2014
//bryan ma - @whoisbma
//thanks to Lambert Wang for newtonian integration example at:
//http://www.openprocessing.org/sketch/120656#

import ddf.minim.*;

Minim minim;
AudioPlayer snd_shoot;
AudioPlayer snd_explosion;
AudioPlayer snd_gameOver;

Player player;

ArrayList<Shot> shots;
ArrayList<Asteroid> asteroids;

boolean keyUp = false;
boolean keyRight = false;
boolean keyLeft = false;
boolean keyShoot = false; 

boolean win = false;
float winTime = 0;

Letter G;
Letter A;
Letter M;
Letter E;
Letter D;
Letter S;
Letter I;
Letter N;
Letter O;
Letter R;
Letter K;
Letter H;
Letter P;
Letter E1;
Letter D1;
Letter G1;
Letter S1;
Letter O1;


void setup() {
  size(1000, 800); 
  background(10);
  noSmooth();
  frameRate(30);

  minim = new Minim(this); 
  snd_shoot = minim.loadFile("Shoot.wav"); 
  snd_explosion = minim.loadFile("Explosion.wav");
  snd_gameOver = minim.loadFile("GameOver.wav");

  player = new Player(width/2, height/2);
  shots = new ArrayList<Shot>();
  asteroids = new ArrayList<Asteroid>();

  G = new Letter(120, height/2+150, 0, 0, 0, 'G');
  A = new Letter(160, height/2+150, 0, 0, 0, 'A');
  M = new Letter(200, height/2+150, 0, 0, 0, 'M');
  E = new Letter(240, height/2+150, 0, 0, 0, 'E');
  D = new Letter(300, height/2+150, 0, 0, 0, 'D');
  E1 = new Letter(340, height/2+150, 0, 0, 0, 'E');
  S = new Letter(380, height/2+150, 0, 0, 0, 'S');
  I = new Letter(410, height/2+150, 0, 0, 0, 'I');
  G1 = new Letter(440, height/2+150, 0, 0, 0, 'G');
  N = new Letter(480, height/2+150, 0, 0, 0, 'N');
  D1 = new Letter(540, height/2+150, 0, 0, 0, 'D');
  O = new Letter(580, height/2+150, 0, 0, 0, 'O');
  R = new Letter(620, height/2+150, 0, 0, 0, 'R');
  K = new Letter(660, height/2+150, 0, 0, 0, 'K');
  S1 = new Letter(700, height/2+150, 0, 0, 0, 'S');
  H = new Letter(740, height/2+150, 0, 0, 0, 'H');
  O1 = new Letter(780, height/2+150, 0, 0, 0, 'O');
  P = new Letter(820, height/2+150, 0, 0, 0, 'P');


  noCursor();
  restart();
} 

void draw() {
  //background(10);
  fill(10, 80);
  rectMode(CORNER);
  noStroke();
  rect(0, 0, width, height);


  //inputs
  if (keyUp == true) {
    player.accelerate();
  }
  if (keyLeft == true) {
    player.rotation -= 0.1;
  }
  if (keyRight == true) {
    player.rotation += 0.1;
  }

  //shoot
  if (player.shotTimer > 0) {
    player.shotTimer--;
  } else {
    player.shotTimer = 0;
  } 

  if (keyShoot == true) {
    if (player.shotTimer == 0) {
      player.shoot(); 
      player.shotTimer = player.shotRate;
    }
  }

  //update player
  player.update();
  player.display();

  G.update();
  G.display();
  A.update();
  A.display();
  M.update();
  M.display();
  E.update();
  E.display();
  D.update();
  D.display();
  E1.update();
  E1.display();
  S.update();
  S.display();
  I.update();
  I.display();
  G1.update();
  G1.display();
  N.update();
  N.display();
  D1.update();
  D1.display();
  O.update();
  O.display();
  R.update();
  R.display();
  K.update();
  K.display();
  S1.update();
  S1.display();
  H.update();
  H.display();
  O1.update();
  O1.display();
  P.update();
  P.display();

  //update shots
  for (int i = 0; i < shots.size (); i++) {
    Shot shot = shots.get(i); 
    shot.update(); 
    shot.display();
    shot.dissipate(i);
    
    G.shotCollision(shot);
    A.shotCollision(shot);
    M.shotCollision(shot);
    E.shotCollision(shot);
    D.shotCollision(shot);
    E1.shotCollision(shot);
    S.shotCollision(shot);
    I.shotCollision(shot);
    G1.shotCollision(shot);
    N.shotCollision(shot);
    D1.shotCollision(shot);
    O.shotCollision(shot);
    R.shotCollision(shot);
    K.shotCollision(shot);
    S1.shotCollision(shot);
    H.shotCollision(shot);
    O1.shotCollision(shot);
    P.shotCollision(shot);
  } 

  //update asteroids
  for (int i = 0; i < asteroids.size (); i++) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.update();
    asteroid.display();
    for (int j = 0; j < shots.size (); j++) {
      Shot shot = shots.get(j);
      asteroid.shotCollision(shot, asteroid, i, j);
    } 
    if (player.alive == true) {
      asteroid.playerCollision(player, asteroid, i);
    }
  }

  //check for player death
  if (player.alive == false) {
    fill(200, 255, 255, 180);
    textAlign(CENTER, CENTER);
    
    if (frameCount % 3 == 0) {
      noStroke();
      rectMode(CORNER);
      fill(200, 255, 255, 20);
      rect(0, 0, width, height);
      textSize(70);
    } else {
      textSize(64);
    }
    text("OH NOOOO", width/2, height/2);

    if (millis() > player.deathTime + 3000) {
      restart();
      player.alive = true;
    }
  } 

  //check for win
  if (asteroids.size() == 0 && win == false) {
    win = true;
    winTime = millis();
  }

  //win screen
  if (win == true) {
    fill(200, 255, 255, 180);
    textAlign(CENTER, CENTER);
    textSize(78);
    text("HOOORAY", width/2, height/2);
    if (millis() > winTime + 3000) {
      restart();
      player.alive = true; 
      win = false;
    }
  }
} 

void restart() {
  asteroids.clear();
  asteroids.add(new Asteroid(random(50, 400), random(50, 750), random(1, 3), 0, random(radians(359)), 0));
  asteroids.add(new Asteroid(random(50, 400), random(50, 750), random(1, 3), 0, random(radians(359)), 0));
  asteroids.add(new Asteroid(random(50, 400), random(50, 750), random(1, 3), 1, random(radians(359)), 0));
  asteroids.add(new Asteroid(random(600, 950), random(50, 750), random(1, 3), 1, random(radians(359)), 0));
  asteroids.add(new Asteroid(random(600, 950), random(50, 750), random(1, 3), 1, random(radians(359)), 0));
//  asteroids.add(new Asteroid(random(600, 950), random(50, 750), random(1, 3), 2, random(radians(359)), 0));
} 

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      keyUp = true;
    }
    if (keyCode == LEFT) {
      keyLeft = true;
    }
    if (keyCode == RIGHT) {
      keyRight = true;
    }
  }
  if (key == ' ') {
    keyShoot = true;
  }
} 

void keyReleased() { 
  if (key == CODED) {
    if (keyCode == UP) {
      keyUp = false;
    }
    if (keyCode == LEFT) {
      keyLeft = false;
    }
    if (keyCode == RIGHT) {
      keyRight = false;
    }
  }
  if (key == ' ') {
    keyShoot = false;
  }
} 

