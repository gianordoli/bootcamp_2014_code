
int xPos, yPos; //this is the x and y position for the horizontal moving ellipses
//int xPos2, yPos2; //this is for the optional vertical moving ellipses
float diameter2; //y axis ellipse diameter
float diameter; //x axis ellipse diameter
int speed; //movement speed
float sizeShift; //size multiplier

void setup() {
  size(600, 600);
  xPos = width/2;
  yPos = height/2; 
  //xPos2 = xPos; // note one variable = another
  //yPos2 = yPos;

  speed = 3;
  sizeShift = 1.01; //this is the rate at which the ellipses will change size
  diameter = 50;
  //diameter2 = 50;
  noStroke();
}

void draw() {
  background(0);

  fill(255);

  ellipse(xPos, yPos, diameter, diameter); //this is the ellipse that starts on the left
  ellipse(-xPos + width, yPos, -diameter, -diameter); //this is the mirrored ellipse -- note the use of negatives


  //if ((xPos > 0 - diameter) && (xPos < width + diameter)) { //set boundaries -- adding the diameter so it appears to go offscreen

    if (mouseX < width/3) { //if mouseX is less than the first third of the screen, go left and increase diameter
      xPos -= speed; 
      diameter *= sizeShift;
      //}
    }

    if (mouseX > (width/3 * 2)) { //if mouseX is greater than 2/3 of the screen, go right and decrease diameter

      xPos += speed;
      diameter /= sizeShift;
    }
  
  /*
  } else {
    xPos = width/2;
  }
  */


/*
 ellipse(xPos2, yPos2, diameter2, diameter2);
 ellipse(xPos2, -yPos2 + height, -diameter2, -diameter2);
 
 if (mouseY < height/3){
 yPos2 -= speed;
 diameter2 *= sizeShift;
 }
 
 if (mouseY > (height/3 * 2)){
 yPos2 += speed;
 diameter2 /= sizeShift;
 }
 */



}
