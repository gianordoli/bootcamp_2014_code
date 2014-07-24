//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays
//
//in this example, the array is declared, created, and assigned 
//on the same line.  (compare to last example)
//
//Syntax:
//  circleX[0] refers to the first element in the array
//----------------------------------------------------

int[] circleX = {50, 100, 150, 200}; //delcare, create, & assign the array

void setup(){
  size(250, 400);
}

void draw(){
  
  //draw a circle using the values within the array "circleX" 
  //as the x-position of the center of the circle
  fill(255, 0, 255);
  ellipse(circleX[0], 200, 20, 20); 
  fill(255, 50, 255);
  ellipse(circleX[1], 200, 20, 20); 
  fill(255, 100, 255);
  ellipse(circleX[2], 200, 20, 20); 
  fill(255, 200, 255);
  ellipse(circleX[3], 200, 20, 20); 
}
