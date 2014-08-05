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


  for(int i = 0; i < 10; i++) {
    for(int j = 0; j < 10; j++) {
      ellipse(25+(i*50), 25+(j*50), 50, 50);
    }
  }
}
