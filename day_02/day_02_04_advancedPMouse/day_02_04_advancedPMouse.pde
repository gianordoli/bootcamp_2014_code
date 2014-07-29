// advanced - making pMouseX and pMouseY to capture previous mouse position and 
// compare current mouse position to it for various effects. 

// most stuff is commented out 

// this was all live coded as an example - start with a simple shape,
// then add variables to parameterize color, etc. 
// then make pMouseX etc. variables and assign it to mouseX each frame, 
// then make some shit with it. 

color circleColor;
int circleColRed;
float pMouseX; 
float pMouseY; 

int counter;

void setup() {
  background(250);
  size(600,600); 
  noSmooth(); 
  circleColRed = 0;
  circleColor = color(circleColRed,100,200); 
  counter = 0; 
  }

void draw() { 
   
   /*
   counter = (counter + 1) % 50;
   println(counter
   float diffX = abs(mouseX-pMouseX); 
   float diffY = abs(mouseY-pMouseY); 
   
   float diff = diffX + diffY;
   */
   
   /*
   circleColor = color(circleColRed,diff,diff);
   fill(circleColor);
   */

   ellipse(300, 300, 200, 200); 
   ellipse(300, 300, 100, 100);
   
   
   //ellipse(mouseX, mouseY, diff, diff); 
   
   //constrain(circleColRed, 0, 255);
   
   //circleColRed = (circleColRed + 1) % 255;
   //circleColRed++;  
   //println(circleColRed);
   
   //stroke(0,50);
  // strokeWeight(diff);
   //line(mouseX, mouseY, pMouseX, pMouseY);
   
   //pMouseX = mouseX;
   //pMouseY = mouseY; 

}
