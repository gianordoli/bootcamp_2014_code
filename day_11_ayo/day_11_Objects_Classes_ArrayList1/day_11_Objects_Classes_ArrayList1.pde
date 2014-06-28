//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// OBJECTS & CLASSES - Day 11
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

int numObj = 30; //How many objects we have
PFont myFont;

Alpha a, b, c, d;


void setup() {
  size(600, 600);
  colorMode(HSB);

  myFont = createFont("HelveticaNeue-Bold", 32);
  textFont(myFont);

  a = new Alpha (200, 20, 400, 200, (char) 65, .5, .1, false, .02);
  b = new Alpha (200, 400, 30, 7, (char) 66, .5, .1, false, .02);
  c = new Alpha (90, 77, 90, 67, (char) 67, .5, .1, false, .02);
  d = new Alpha (88, 56, 300, 150, (char) 68, .5, .1, false, .02);
}

void draw() {
  background(255);

  a.move();
  a.collide();
  a.display();

  b.move();
  b.collide();
  b.display();

  c.move();
  c.collide();
  c.display();

  d.move();
  d.collide();
  d.display();
}


class Alpha {
  float size;
  float posX;
  float posY;
  float hue;
  char c;
  float speedX;
  float speedY;
  Boolean isMoving;
  float gravity; 

  Alpha(float isize, float iposX, float iposY, float ihue, char ic, float ispeedX, float ispeedY, Boolean iisMoving, float igravity) {

    size = isize;
    posX = iposX;
    posY = iposY;  
    hue = ihue;
    c = ic;
    speedX = ispeedX;  
    speedY = ispeedY;
    isMoving = iisMoving;

    gravity = igravity;
  }

  void move() {
    if (isMoving) {
      // Add speed to location.
      posX = posX + speedX;
      posY = posY + speedY;

      // Add gravity to speed.
      speedY = speedY + gravity;

      //If square reaches the walls
      if (posX < 0) {
        posX = 0; 
        //        speedX[i] = - speedX[i];        
        speedX = speedX * -0.8;
      }     
      if (posX > width) {
        posX = width; 
        //Dampening
        speedX = speedX * -0.8;
      }       

      // If square reaches the bottom
      // Reverse speedY
      if (posY > height - size/2) {
        //Prevent the object from getting stuck outside the scene
        posY = height - size/2;          
        //        speedY = -speedY;  
        // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speedY).  
        // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
        speedY = speedY * -0.8;

        //Still, it may bounce forever unless we make it stop
        if (abs(speedY) < 3) {
          speedY = 0;
        }
        //      println(speedY[i]);
      }
    }
  }

  void  collide() {
    //    for (int i = 0; i < numObj; i++) {
    //      for (int j = 0; j < numObj; j++) {
    //        //This is a nested for-loop!
    //        //i: the current object we're drawing
    //        //j: each other object we'l check collision with
    //        if (i != j) {  //Do not check collision with itself!
    //          if (dist(posX, posY, posX[j], posY[j]) < (size + size[j])/2) {
    //            //Change 'i' object 
    //            posX[i] = posX[i] - speedX[i]*2;  //Make it go back, so that it won't
    //            posY[i] = posY[i] - speedY[i]*2;  //get stuck inside of another object
    //            speedX[i] = speedX[i] * -0.8;
    //            speedY[i] = speedY[i] * -0.8;         
    //
    //            //Change 'j' object 
    //            posX[j] = posX[j] - speedX[j]*2;
    //            posY[j] = posY[j] - speedY[j]*2;        
    //            speedX[j] = speedX[j] * -0.8;
    //            speedY[j] = speedY[j] * -0.8;
    //          }
    //        }
    //      }
    //    }
  }

  void display() {

    float distance = dist(mouseX, mouseY, posX, posY);
    //  println(distance);

    //Checking distance to mouse
    noStroke();
    if (distance < size/2 && !isMoving) {
      fill(hue, 150, 255);  
      isMoving = true;
      speedX = mouseX - pmouseX;
    }
    else {
      fill(hue, 255, 225);
    }

    //Drawing the object
    textSize(size);
    textAlign(CENTER, CENTER);
    text(c, posX, posY);
  }
}

