//Bootcamp Example 3 - 2

PImage img;  

void setup() {
  size(512, 512);
  img = loadImage("lena.jpg");
}

void draw() {
  //Comment and uncomment the following line to see difference
  //background(0);
  int property = (mouseX + mouseY)%255;
  tint(property);
  image(img, mouseX, mouseY, property, property);
}
