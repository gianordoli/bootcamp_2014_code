//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays
//
//in this example, the array is declared and created
//on the same line.  (compare to last example)
//
//Syntax:
//  circleX[0] refers to the first element in the array
//----------------------------------------------------

int[] circleX = new int[4]; //delcare and create the array

void setup(){
  size(250, 400);
  circleX[0] = 50; //assign the first value
  circleX[1] = 100;  //assign the second value
  circleX[2] = 150;  //assign the third value
  circleX[3] = 200;  //assign the fourth value
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
