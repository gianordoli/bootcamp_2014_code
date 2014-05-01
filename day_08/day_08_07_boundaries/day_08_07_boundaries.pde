//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, gravity
// Checking collision with the walls
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

int numObj = 50; //How many objects we have
PFont myFont;

//Declaring the properties of our object:
float[] size = new float[numObj];
float[] posX = new float[numObj];
float[] posY = new float[numObj];
float[] hue = new float[numObj];
char[] c = new char[numObj];
float[] speedX = new float[numObj];
float[] speedY = new float[numObj];
Boolean[] isMoving = new Boolean[numObj]; //is our object stationary or not?

//"Environment" properties
float gravity;      //That is, acceleration

void setup(){
  size(600, 600);
  colorMode(HSB);
  
  myFont = createFont("HelveticaNeue-Bold", 32);
  textFont(myFont);
  
  //Assigning values to the properties
  for(int i = 0; i < numObj; i++){
    size[i] = random(30, 80);
    posX[i] = random(width);
    posY[i] = random(height - 200);  
    hue[i] = random(255);
    //A random uppercase letter from the ASCII table
    //See: http://www.asciitable.com/
    c[i] = (char) int(random(65, 90));
    speedX[i] = 0;  
    speedY[i] = 0;
    isMoving[i] = false;
  }
  
  gravity = 0.4;
}

void draw(){
  background(255);

  for(int i = 0; i < numObj; i++){
    float distance = dist(mouseX, mouseY, posX[i], posY[i]);
  //  println(distance);
  
    //Checking distance to mouse
    noStroke();
    if(distance < size[i]/2 && !isMoving[i]){
      fill(hue[i], 150, 255);  
      isMoving[i] = true;
      speedX[i] = mouseX - pmouseX;
    }else{
      fill(hue[i], 255, 225);
    }
    
    //Drawing the object
    textSize(size[i]);
    textAlign(CENTER, CENTER);
    text(c[i], posX[i], posY[i]);
    
    //Physics
    if(isMoving[i]){
      // Add speed to location.
      posX[i] = posX[i] + speedX[i];
      posY[i] = posY[i] + speedY[i];
      
      // Add gravity to speed.
      speedY[i] = speedY[i] + gravity;
      
      //If square reaches the walls
      if (posX[i] < 0) {
        posX[i] = 0; 
//        speedX[i] = - speedX[i];        
        speedX[i] = speedX[i] * -0.8;
      }     
      if (posX[i] > width) {
        posX[i] = width; 
        //Dampening
        speedX[i] = speedX[i] * -0.8;
      }       
     
      // If square reaches the bottom
      // Reverse speedY
      if (posY[i] > height - size[i]/2) {
        //Prevent the object from getting stuck outside the scene
        posY[i] = height - size[i]/2;          
//        speedY = -speedY;  
        // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speedY).  
        // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
        speedY[i] = speedY[i] * -0.8;
       
        //Still, it may bounce forever unless we make it stop
        if(abs(speedY[i]) < 3){
          speedY[i] = 0;
        }
//      println(speedY[i]);
      }
    }
  }
}
