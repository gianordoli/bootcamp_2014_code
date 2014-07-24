//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays - arrayCircles B
//
//This example is the same as "arrayCircles" 
//except that the numbers within the array "circleX" have been replaced
//with variables.
//
//  You can substitute that number with a variable, which is nice because, 
//  if you want to change the number, you just change what the variable 
//  equals--not every instance of the number in the code.
//
// http://processing.org/reference/for.html
//----------------------------------------------------

//Declare 2 variables to use as numbers within the array "circleX"
//Mess around with these numbers by changing the values and see what happens
int var1 = 60;
int var2 = 120;

//Declare the array & tell processing the data type (int)
int[] circleX = { 
  
  //Assign a value OR variable to each position 
  30, var1, 90, var2, 150, 180 
  
};

void setup() {
  size(500, 500);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i < 6; i++) {
    fill(255, i*50, 255);
    ellipse(circleX[i], 50, 10, 10);
    
    //print the array values to the console
    print("circleX[" + i + "]: ");
    println(circleX[i]);
  }
}
