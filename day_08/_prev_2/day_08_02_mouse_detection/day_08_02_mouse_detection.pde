//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, distance
// Now checking if the mouse is over the ball
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
