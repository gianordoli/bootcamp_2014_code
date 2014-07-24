//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays
// This is not an array... not efficient at all
// http://processing.org/reference/for.html
//----------------------------------------------------

//------------x position of circles--------------
int x1 = 30; 
int x2 = 60;
int x3 = 90; 
int x4 = 120;


void setup() {
  size(250, 100);
  smooth();
  noStroke();
}

void draw() {
  background(0);

  fill(255, 0, 255);
  ellipse(x1, 50, 10, 10);
  
  fill(255, 50, 255);
  ellipse(x2, 50, 10, 10);
  
  fill(255, 100, 255);
  ellipse(x3, 50, 10, 10);
  
  fill(255, 150, 255);
  ellipse(x4, 50, 10, 10);
  
  //This code is fine if we only have a small number of circles.
  //But what if we wanted to have a lot more circles?
}
