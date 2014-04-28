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

void setup(){
  size(1033, 768);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = 60;
  posX = width/2;
  posY = height/2;
  speedX = 0;
  speedY = 0;  
}

void draw(){
  background(50);
  
  rectMode(CENTER);
  fill(120, 255, 255);
  rect(posX, posY, size, size, 20);

  //Add speed to the position
  posX = posX + speedX;
  posY = posY + speedY;
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      speedY = -2;
    }else if(keyCode == DOWN){
      speedY = 2;
    }else if(keyCode == LEFT){
      speedX = -2;
    }else if(keyCode == RIGHT){
      speedX = 2;
    }   
  }
}
