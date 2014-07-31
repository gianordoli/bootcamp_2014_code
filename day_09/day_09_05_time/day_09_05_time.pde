//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 9, time
// A SUPER simple clock, using typography only
//----------------------------------------------------

PFont myFont;

void setup(){
  size(800, 500);
  myFont = createFont("Helvetica-Bold", 12);
}

void draw(){
  background(0);
  
  fill(25, 240, 255);
  textFont(myFont);
  
  int textX = 20;
  int textY = height/4 - 20;
  textSize(height/4);  
  
  text("Now is", textX, textY);

  textY += height/4;
  text(hour() + " hours", textX, textY);
  
  textY += height/4;
  text(minute() + " minutes", textX, textY);  
  
  textY += height/4;
  text(second() + " seconds", textX, textY);
}
