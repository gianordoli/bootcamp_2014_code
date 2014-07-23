//Bootcamp Example 3 - 5

PImage earth;
PImage moon;

int amplitude = 160;

void setup() {
  size(400, 400);

  earth = loadImage("earth.jpeg");
  moon = loadImage("moon.jpeg");
}

void draw() {
  background(255);

  float time = millis() * 0.001;
  float timeEarth = millis() * 0.003;
  
  float posX = cos( time ) * amplitude + width/2;
  float posY = sin( time ) * amplitude + height/2;

  imageMode(CENTER);
  image(moon, posX, posY, 50, 50);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(timeEarth);
  image(earth, 0, 0, 100, 100);
  popMatrix();
}

