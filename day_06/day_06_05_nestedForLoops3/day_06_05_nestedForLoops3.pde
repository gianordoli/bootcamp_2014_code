//----------------------------------------------------
// From the Examples page of processing.org
// Original author: unknown
// http://processing.org/examples/embeddediteration.html
// Commented on by Dylan Shad, for use in
// DT Bootcamp 2014, Parsons the New School for Design. 
//----------------------------------------------------

int gridSize = 20;

void setup() {
  size(640, 360);
}

void draw() {
  background(0); 
  noStroke(); 
  
  // the two nested for() loops here are selecting points on a grid
  // the first deciding the x of each, and thereby defining each column
  // the second finding a set of y coordinates, thus creating rows.
  
  // compared to the other nested for() loop examples in this folder,
  // here the test is not iterating on a simple 1:1 scale and later being
  // multiplied into the coordinate. Rather, all of that math occurs
  // directly in the for loops themselves.
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      noStroke();
      fill(255);
      // the rectangle, being 3 pixels wide and high, must be displaced by 1
      // to thus be centered on the point.
      // we could also simply change rectMode to CENTER - but that would be
      // an extra line of code.
      rect(x-1, y-1, 3, 3);
      stroke(255, 50);
      // each line simply starts from the currently selected point, and
      // ends at the center.
      line(x, y, width/2, height/2);
    }
  }
}
