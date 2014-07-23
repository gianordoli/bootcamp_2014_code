//Bootcamp Example 3 - 7

PFont myFont;

void setup() {
  size(800, 600);
  myFont = loadFont("8BITWONDERNominal-48.vlw");
}

void draw() {
  background(0);
  fill(255);
  textFont(myFont);
  textAlign(CENTER);
  text("I'm shaking", random(380, 420), height/2);
}

