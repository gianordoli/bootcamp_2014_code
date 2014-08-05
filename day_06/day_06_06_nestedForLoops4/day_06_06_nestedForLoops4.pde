//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 6 - nested for() loops pt 4
// http://processing.org/reference/for.html
// written by Dylan Shad
//----------------------------------------------------

int fillColor;
float circleX;
float circleY;
float diameter; // now we need a variable for circle diameter
int circleSpacing = 80; // and I have decided to add one to
              // control how tightly the circles are spaced.

void setup() {
  size(1000, 700); // this one comes in a whole new fun-size!
}

void draw() {
  background(0);
  
  // the test has been adjusted to match the new window size and
  // circleSpacing. This could be turned into an algorithm for
  // true variable control with regard to spacing.
  for(int i = 0; i < 13; i++) {
    for(int j = 0; j < 13; j++) {
      setCircleCoordinates(i, j); // updated (see below)
      setFillRelativeToMouse(); // simplified
      setDiameterRelativeToMouse();
      drawOneCircle();
    }
  }
  
}

void setCircleCoordinates (int x, int y) {
  circleX = (.5*circleSpacing)+(x*circleSpacing);
  circleY = (.5*circleSpacing)+(y*circleSpacing);
}

void setFillRelativeToMouse() {
  // since we no longer really need a variable "flashlight,"
  // we can drop the map() entirely.
  fillColor = 255 - int((dist(mouseX, mouseY, circleX, circleY)));
  if (fillColor <= 0) {fillColor = 0; };
  fill(fillColor);
  noStroke();
}

void setDiameterRelativeToMouse() {

  diameter = dist(mouseX, mouseY, circleX, circleY);
}

void drawOneCircle() {
  ellipse(circleX, circleY, diameter, diameter);
}
