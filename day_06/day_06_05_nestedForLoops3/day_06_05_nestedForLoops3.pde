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

  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      noStroke();
      fill(255);
    
      rect(x-1, y-1, 3, 3);
      stroke(255, 50);
      line(x, y, width/2, height/2);
    }
  }
}
