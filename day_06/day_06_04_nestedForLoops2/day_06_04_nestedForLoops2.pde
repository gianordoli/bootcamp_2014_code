//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 6 - nested for() loops pt 2
// http://processing.org/reference/for.html
// written by Dylan Shad
//----------------------------------------------------
int fillColor;
int circleX;
int circleY;

void setup() {
  size(500, 500);
}

void draw() {
background(0);

  // here, the first for loop iterates between fifty columns
  for(int i = 0; i < 50; i++) {
    // while the second fills each column with fifty rows.
    for(int j = 0; j < 50; j++) {
      setCircleCoordinates(i, j);
      setFillRelativeToMouse();
      drawOneCircle();
    }
  }
}

void setCircleCoordinates (int x, int y) {
  circleX = 5+(x*10);
  circleY = 5+(y*10);
}

void setFillRelativeToMouse() {
  
  fillColor = int(map(dist(mouseX, mouseY, circleX, circleY), 0, 250, 255, 0));

  if (fillColor <= 0) {fillColor = 0; };
  fill(fillColor);
  noStroke();
}

void drawOneCircle() {
  ellipse(circleX, circleY, 10, 10);
}
