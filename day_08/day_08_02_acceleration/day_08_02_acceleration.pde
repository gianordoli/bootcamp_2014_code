//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, speed
//----------------------------------------------------

//Declaring the properties of our object:
float size;
float posX;
float posY;
float speedX;
float speedY;

//The acceleration will be an "environment" property
float accel;

void setup(){
  size(1033, 768);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = 60;
  posX = width/2;
  posY = height/2;
  speedX = 0;
  speedY = 0;  
  
  //
  accel = 0.95;
}

void draw(){
  background(50);
  
  rectMode(CENTER);
  fill(120, 255, 255);
  rect(posX, posY, size, size, 15);

  //Add speed to the position
  posX = posX + speedX;
  posY = posY + speedY;
  
  //Change speed based on acceleration
  //In this case, the acceleration will slowdown the object
  //Think of it as a simulation of friction 
  speedX = speedX * accel;
  speedY = speedY * accel;
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      speedY = -5;
    }else if(keyCode == DOWN){
      speedY = 5;
    }else if(keyCode == LEFT){
      speedX = -5;
    }else if(keyCode == RIGHT){
      speedX = 5;
    }   
  }
}
