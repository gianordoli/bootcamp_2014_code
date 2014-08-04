//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 6 - nested for() loops pt 1
// http://processing.org/reference/for.html
// written by Dylan Shad
//----------------------------------------------------

void setup() {
  size(500, 500);
}

void draw() {
background(0);

// the for loop can be nested inside itself, to create even more intricate processes.
// This is how 2 dimensional patterns are commonly made.

  // here, the first for loop iterates between ten columns
  for(int i = 0; i < 10; i++) {
    // while the second fills each column with ten circles, spaced into rows.
    for(int j = 0; j < 10; j++) {
      // so, each ellipse has its x displaced by the iterating test of the first loop ("i")
      // while their y coordinates are displaced by that of the second loop ("j")
      ellipse(25+(i*50), 25+(j*50), 50, 50);
    }
  }
}
