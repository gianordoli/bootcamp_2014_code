//Bootcamp Example 3 - 6

PFont font;

void setup() {
  size(800, 600);
  font = loadFont("AppleBraille-Pinpoint6Dot-48.vlw");
}

void draw() {
  textFont(font);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Welcome To Processing", width/2, height/2);
}

