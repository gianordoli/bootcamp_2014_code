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

// by feeding the for loops more complex code, we can easily create some very
// cool interactions. This is based off of one I made last year when I was first toying around
// with nested for loops.

// the screen is filled up by 2,500 small ellipses, which change color
// based upon how close the mouse is to them.

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
  // each ellipse has its x displaced by the iterating test of the first loop ("i")
  // while their y coordinates are displaced by that of the second loop ("j")
  circleX = 5+(x*10);
  circleY = 5+(y*10);
}

void setFillRelativeToMouse() {
  // this looks more complicated than it is. Let's work backwards through it:
  // dist: first we must gather the distance between the mouse and the circle in question.
  // map: we then map this distance to being between 255 and 0.
      // fun trick: the smaller we make the "map from" values, the smaller
      // we make the "flashlight" in the end.
  // int: map returns a float, which we can't use. We need to force it into an int.
  
  fillColor = int(map(dist(mouseX, mouseY, circleX, circleY), 0, 250, 255, 0));
  // funny story: because of how we mapped things, if you remove the if() statement,
  //  you get shades of white and yellow instead of black.
  
  // this if() statement makes sure that we don't get color weirdness from the fill
  // being a negative number.
  if (fillColor <= 0) {fillColor = 0; };
  fill(fillColor);
  noStroke();
}

void drawOneCircle() {
  // remember - we only have to draw one circle. The for loop does the rest.
  ellipse(circleX, circleY, 10, 10);
}
