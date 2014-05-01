//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, distance
// Now measuring the distance to the mouse
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

void setup(){
  size(600, 600);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = random(30, 80);
  posX = random(width);
  posY = random(height - 100);  
  hue = random(255);
  //A random uppercase letter from the ASCII table
  //See: http://www.asciitable.com/
  c = (char) int(random(65, 90));
}

void draw(){
  background(255);

  float distance = dist(mouseX, mouseY, posX, posY);
  println(distance);

  noStroke();
  if(distance < size/2){
    fill(hue, 150, 255);  
  }else{
    fill(hue, 255, 225);
  }
  textSize(size);
  textAlign(CENTER, CENTER);
  text(c, posX, posY);
}
