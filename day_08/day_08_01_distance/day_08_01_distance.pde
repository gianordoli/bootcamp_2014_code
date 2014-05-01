//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, distance
// Let's start with a simple sketch to measure the
// distance to the mouse
//----------------------------------------------------

//Declaring the properties of our object:
float size;
float posX;
float posY;

void setup(){
  size(600, 600);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = 60;
  posX = width/2;
  posY = height/2;  
}

void draw(){
  background(255);
  
  noStroke();
  fill(240, 240, 255);
  ellipse(posX, posY, size, size);
  
  float distance = dist(mouseX, mouseY, posX, posY);
  println(distance);
}
