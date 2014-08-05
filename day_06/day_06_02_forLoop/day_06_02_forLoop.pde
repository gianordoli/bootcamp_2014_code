//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 6 - introducing the for() loop
// http://processing.org/reference/for.html
// written by Dylan Shad
//----------------------------------------------------

void setup() {
  size(500, 100);
}

void draw() {
background(0);
  for(int i = 0; i < 10; i++) {

    ellipse(25+(i*50), height/2, 50, 50);

  }
}
