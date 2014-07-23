//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 9, matrix transformations
// A simple radial bar chart, using translate and rotate
// Adding mouse interaction
//----------------------------------------------------

int[] myData = {150, 150, 120, 135, 70, 100, 120, 100, 80, 90, 70, 140, 160, 120, 120, 80, 110, 100, 170};

void setup(){
  size(600, 600);
}

void draw(){
  background(0);
    
  int rectHeight = 12;    //The height of our rect
  int circleRadius = 100; //Our bars will start at 100 px from the center
  float myArc = map(mouseX, 0, width, 0, TWO_PI); 
  
  //Translate just once!
  translate(width/2, height/2);
  for(int i = 0; i < myData.length; i++){
    
    //Bar
    fill(25, 255, 150);
    rect(circleRadius, -rectHeight/2, myData[i], rectHeight);
    
    //Text
    fill(255);
    textAlign(LEFT, CENTER);
    text(myData[i], circleRadius + myData[i], 0);
    
    //Rotate a little bit for each iteration...
    rotate(myArc / myData.length);    
  }
}
