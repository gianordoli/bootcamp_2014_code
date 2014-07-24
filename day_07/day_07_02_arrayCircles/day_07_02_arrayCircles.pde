//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays - arrayCircles
//
//  In this example, we want to create an array
//  with specific values for the x position of the center of the circle.
//
// http://processing.org/reference/for.html
//----------------------------------------------------

//Declare the array & tell processing the data type (int)
int[] circleX = { 
  
  //Assign values to each position 
  30, 60, 90, 120, 150, 180 
  
};

void setup() {
  size(250, 100);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i < 6; i++) {
    fill(255, i*50, 255);
    ellipse(circleX[i], 50, 10, 10);
    println(circleX[i]);
  }
}
