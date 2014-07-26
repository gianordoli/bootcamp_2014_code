//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, Arrays
//
// remeber the last positions
// and shift the array 
//----------------------------------------------------


//declare two arrays with numPos elements
int numPos = 50;
int[] xPos = new int[numPos];
int[] yPos = new int[numPos];

void setup() {
 size(500, 500);
 smooth();

  //initialize all elements of each array to zero
  for (int i = 0; i < numPos; i++) {
   xPos[i] = 0; 
   yPos[i] = 0;
  } 
  
}

void draw() {
 background(255);

 //shift array values
 for (int i = 0; i < numPos-1; i++) { //stop at the second to last element
  xPos[i] = xPos[i+1]; //shift all elements down one spot
  yPos[i] = yPos[i+1];
 } 
 
 //new location
 xPos[numPos-1] = mouseX;  //update the last spot in the array with the new mouse location 
 yPos[numPos-1] = mouseY;  
 
 //draw circles
 for (int i = 0; i < numPos; i++) {
  fill(0, random(255), random(255));
  
  //draw an ellipse for each element in the array
  ellipse(xPos[i], yPos[i], 10, 10);
 }
}
