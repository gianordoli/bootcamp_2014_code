//Bootcamp Example 3 - 8

PFont myFont;

void setup() {
  size(1024, 768);
  myFont = loadFont("8BITWONDERNominal-48.vlw");
}

void draw() {
  background(255);
  
  float sinOfTime = sin( millis() * 0.007 );
  float sinMapped = map( sinOfTime, -1.0, 1.0, 100, 140 );
  
  fill(255, 0, 0);
  textFont(myFont, sinMapped);
  textAlign(CENTER);
  text("ON SALE", width/2, height/2);
}

