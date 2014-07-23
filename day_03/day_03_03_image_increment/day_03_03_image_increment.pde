//Bootcamp Example 3 - 3

PImage cop;
PImage car;
int posX = 800;

void setup() {
  cop = loadImage("cop.gif");
  car = loadImage("car.png");
  size(800, cop.height/2);
}

void draw() {
  background(255);
  image(cop, 0, 0, cop.width/2, cop.height/2);
  image(car, posX, cop.height/2 - car.height);
  posX--;
}

