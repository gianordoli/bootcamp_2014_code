float circleX = 100;
float circleY = 100;
float circleW = 220;
float circleH = 400;
float circleStroke = 255;
float strokeSize = 1; 
float circleFill = 0;
float backgroundColor = 255;
float change = 1;

float otherChange = 5; 

void setup() {
  size(800,600);
  noSmooth(); 
}

void draw() {
  //Start off with just the shape, then load in the modifications
  // Draw the background and the ellipse
  background(backgroundColor);
  stroke(circleStroke);
  strokeWeight(strokeSize);
  fill(circleFill);
  ellipse(circleX,circleY,circleW,circleH);
  
  // Change the values of all variables - try one at a time, or all at once
  //circleX = circleX + change;
  //circleY = circleY + change;
  //circleW = circleW + change;
  //circleH = circleH - change;
  //circleStroke = circleStroke - change;
  //circleFill = circleFill + change;
  //strokeSize = strokeSize + change * 0.1;
  
  //circleH = circleH - otherChange;
  
  // then add in another shape that uses the same variables differently
  //ellipse(newCircleX,newCircleY,newCircleW,newCircleH);
  
}

//start off with just the shape
