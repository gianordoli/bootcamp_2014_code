//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, gravity
// Simple physics continued — bouncing
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

//Declaring the properties of our object:
float size;
float posX;
float posY;
float hue;
char c;
float speedX;
float speedY;
Boolean isMoving; //is our object stationary or not?

//"Environment" properties
float gravity;      //That is, acceleration

void setup(){
  size(600, 600);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = 80;
  posX = random(width);
  posY = random(height - 200);  
  hue = random(255);
  //A random uppercase letter from the ASCII table
  //See: http://www.asciitable.com/
  c = (char) int(random(65, 90));  
  speedX = 0; 
  speedY = 0;
  isMoving = false;
  
  gravity = 0.4;
}

void draw(){
  background(255);

  float distance = dist(mouseX, mouseY, posX, posY);
//  println(distance);

  //Checking distance to mouse
  noStroke();
  if(distance < size/2 && !isMoving){
    fill(hue, 150, 255);  
    isMoving = true;
    speedX = mouseX - pmouseX;
  }else{
    fill(hue, 255, 255);
  }
  
  //Drawing the object
  textSize(size);
  textAlign(CENTER, CENTER);
  text(c, posX, posY);
  
  //Physics
  if(isMoving){
    // Add speed to location.
    posY = posY + speedY;
    
    // Add gravity to speed.
    posX = posX + speedX;
    speedY = speedY + gravity;
   
      // If square reaches the bottom
      // Reverse speedY
      if (posY > height - size/2) {
        //Prevent the object from getting stuck outside the scene
        posY = height - size/2;
//        speedY = -speedY;  
        // Multiplying by -0.8 instead of -1 slows the square down each time it bounces (by decreasing speedY).  
        // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
        speedY = speedY * -0.8; 
        
        //Still, it may bounce forever unless we make it stop
        if(abs(speedY) < 3){
          speedY = 0;
        }
//        println(speedY);
      }
  }
}
