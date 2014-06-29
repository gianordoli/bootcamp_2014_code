//Bootcamp Example 3 - 4

PImage img;

void setup() {
  size(400, 400);
  img = loadImage("human_heart.png");
}

void draw() {
  background(255);

  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 100, 140 );
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 150, 210 );

  imageMode(CENTER);
  image( img, width/2, height/2, sinMappedX, sinMappedY );
}

