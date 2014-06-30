// DT Bootcamp 2014, Parsons the New School for Design. 
// OBJECTS & CLASSES - Day 11
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

int numObj = 30; //How many objects we want to create
PFont myFont;
ArrayList letters; //Creat your ArrayList

void setup() {
  size(600, 600);
  colorMode(HSB);  //HSB color mode - remember (Hue value, 255, 255)

  myFont = createFont("HelveticaNeue-Bold", 32); //Font object
  textFont(myFont);

  letters = new ArrayList();  
  for (int i=0;i<numObj;i++) {  
    Alpha myletter = new Alpha();
    letters.add(myletter);    //Place your objects into your array list using a for loop
  }
}

void draw() {
  background(255);

  for (int i=0;i<numObj;i++) {
    Alpha p = (Alpha) letters.get(i);   // get [i] index of your array list, then call your object methods using "." notation
    p.move();    
    p.collide();
    p.display();
  }
}


class Alpha {    //This is your class named Alpha - remember Capital A for convention
  float size;    //Declare your variable
  float posX;
  float posY;
  float hue;
  char c;
  float speedX;
  float speedY;
  Boolean isMoving;
  float gravity; 

  Alpha() {      // This is your constructor
    size = random(30, 80);  //Initalize your variable for your class
    posX = random(width);
    posY = random(height - 200);  
    hue = random(255);
    //A random uppercase letter from the ASCII table
    //See: http://www.asciitable.com/
    c = (char) int(random(65, 90));
    speedX = 0;  
    speedY = 0;
    isMoving = false;
    
    gravity = 0.2;
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
    //   Loop through the full array to detect collision with any other object
      for (int i = 0; i < numObj; i++) {
        Alpha p = (Alpha) letters.get(i);
       
      for (int j = 0; j < numObj; j++) {
        Alpha q = (Alpha) letters.get(i);
        
        //This is a nested for-loop!
        //i: the current object we're drawing
        //j: each other object we'l check collision with
        if (i != j) {  //Do not check collision with itself!
          if (dist(p.posX, p.posY, q.posX, q.posX) < (p.size + q.size)/2) {
            //Change 'i' object 
            p.posX = p.posX - p.speedX*2;  //Make it go back, so that it won't
            p.posY = p.posY - p.speedY*2;  //get stuck inside of another object
            p.speedX = p.speedX * -0.8;
            p.speedY = p.speedY * -0.8;         
  
            //Change 'j' object 
            q.posX = q.posX - q.speedX*2;
            q.posY = q.posY - q.speedY*2;        
           q.speedX = q.speedX * -0.8;
            q.speedY = q.speedY * -0.8;
          }
        }
  }}
    
    
    //ORIGINAL CODE BELOW
 //    //Loop through the full array to detect collision with any other object
  //    for (int j = 0; j < numObj; j++) {
  //      //This is a nested for-loop!
  //      //i: the current object we're drawing
  //      //j: each other object we'l check collision with
  //      if (i != j) {  //Do not check collision with itself!
  //        if (dist(posX[i], posY[i], posX[j], posY[j]) < (size[i] + size[j])/2) {
  //          //Change 'i' object 
  //          posX[i] = posX[i] - speedX[i]*2;  //Make it go back, so that it won't
  //          posY[i] = posY[i] - speedY[i]*2;  //get stuck inside of another object
  //          speedX[i] = speedX[i] * -0.8;
  //          speedY[i] = speedY[i] * -0.8;         
  //
  //          //Change 'j' object 
  //          posX[j] = posX[j] - speedX[j]*2;
  //          posY[j] = posY[j] - speedY[j]*2;        
  //          speedX[j] = speedX[j] * -0.8;
  //          speedY[j] = speedY[j] * -0.8;
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

