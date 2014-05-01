//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, random char
// Let's add gravity to a text
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

//Declaring the properties of our object:
float size;
float posX;
float posY;
char c;

void setup(){
  size(600, 600);
  colorMode(HSB);
  
  //Assigning values to the properties
  size = 60;
  posX = width/2;
  posY = height/2;  
  //A random character — from the 128 ones in the ASCII table
  c = (char) int(random(0, 127));
}

void draw(){
  background(255);  
  
  noStroke();
  fill(0);
  textSize(size);
  text(c, posX, posY);
}
