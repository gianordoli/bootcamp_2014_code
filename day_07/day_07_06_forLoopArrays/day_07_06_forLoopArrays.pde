//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays
//
//For loops make it easier to work with large arrays and keep the code
//clean and concise.
//
//Syntax:
//  int[] circleX = new int[4]; //declare & create the array
//  println(circleX.length); //prints the length of the array (circleX) to the console which is 4
//----------------------------------------------------

float[] circleX;//delcare the array
float[] circleY;//delcare the array

void setup(){
  size(400, 400);
  circleX = new float[width]; //create the array 
  circleY = new float[height]; //create the array 
  
  //the length field associated with an array stores the number of 
  //elements within the array.  To obtain the length field, use the name of 
  //the array with the dot operator (a period) to access this value (eg circleX.length).
  for (int i = 0; i < circleX.length; i++){ //for loop used to fill up the array circleX
     circleX[i] = random(0, width); 
     circleY[i] = random(0, height); 
  }
}

void draw(){
  
  //draw a circle using the values within the array "circleX" 
  //as the x-position of the center of the circle

  for(int i = 0; i < circleX.length; i++){
   fill(255, random(0, 255), 255);
   ellipse(circleX[i], circleY[i], 20, 20); 
  } 
}
