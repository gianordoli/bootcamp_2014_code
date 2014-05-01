//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, gravity
// Using mouse position to assign a direction
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
Boolean isMoving; //is our object moving or not?

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
  speedX = 0;  
  speedY = 0;
  isMoving = false;
  
  gravity = 0.1;
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
    posX = posX + speedX;
    posY = posY + speedY;
    
    // Add gravity to speedY.
    speedY = speedY + gravity;    
  }
}
