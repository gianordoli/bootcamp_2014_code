//Bootcamp Example 3 - 4

PImage img;

void setup() {
  size(400, 400);
  img = loadImage("human_heart.png");
}

void draw() {
  background(255);

  float speed = 5;
  float scale = map(sin(frameCount/speed), -1, 1, 1, 1.2);

  imageMode(CENTER);
  image( img, width/2, height/2, img.width*scale, img.height*scale);
}

