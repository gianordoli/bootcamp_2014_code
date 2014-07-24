//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays - arrayCircles
//
//  In this example, show how to use an array to create 1000 circles
//  with only a few changes to the code
//
// http://processing.org/reference/for.html
//----------------------------------------------------

//Declare the array and create the array
float[] circleX = new float [1000];
float[] circleY = new float [1000];

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  
  //assign the array
  for (int i = 0; i < circleX.length; i++){
     circleX[i] = random(0, 500);
     circleY[i] = random(0, 500);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < circleX.length; i++) {
    fill(255, i/2, 255);
    
    //-----------------changing image--------------
    //ellipse(circleX[i], random(0, 500), 10, 10);
    
    //----------------static image----------------
    ellipse(circleX[i], circleY[i], 10, 10);
    println(circleX[i]);
  }
}
