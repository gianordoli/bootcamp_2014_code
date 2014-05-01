//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, gravity
// Adding simple physics — gravity; no bouncing yet
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
float speedY;
Boolean hasGravity; //is our object stationary or not?

//"Environment" properties
float gravity;      //That is, acceleration

void setup(){
  size(600, 600);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = 80;
  posX = random(width);
  posY = random(height - 100);  
  hue = random(255);
  //A random uppercase letter from the ASCII table
  //See: http://www.asciitable.com/
  c = (char) int(random(65, 90));  
  speedY = 0;
  hasGravity = false;
  
  gravity = 0.1;
}

void draw(){
  background(255);

  float distance = dist(mouseX, mouseY, posX, posY);
//  println(distance);

  //Checking distance to mouse
  noStroke();
  if(distance < size/2){
    fill(hue, 150, 255);  
    hasGravity = true;
  }else{
    fill(hue, 255, 255);
  }
  
  //Drawing the object
  textSize(size);
  textAlign(CENTER, CENTER);
  text(c, posX, posY);
  
  //Physics
  if(hasGravity){
    // Add speedY to location.
    posY = posY + speedY;
    
    // Add gravity to speedY.
    speedY = speedY + gravity;    
  }
}
