//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, gravity
// Starting to apply gravity
//----------------------------------------------------

//Declaring the properties of our object:
float size;
float posX;
float posY;
float speed;
float gravity;
Boolean hasGravity;

void setup(){
  size(600, 600);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = 60;
  posX = width/2;
  posY = height/2; 
  speed = 0;
  gravity = 0.1;
  hasGravity = false;
}

void draw(){
  background(255);
  
  float distance = dist(mouseX, mouseY, posX, posY);
//  println(distance);  
  
  noStroke();
  if(distance < size/2){
    fill(240, 240, 255);
  }else{
    fill(240, 240, 200);
  }
  ellipse(posX, posY, size, size);
  
}
