//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 6 - introducing the while() loop
// http://processing.org/reference/while.html
// written by Dylan Shad
//----------------------------------------------------

int i; // the variable for while() to test

void setup() {
  size(500, 100);
}

void draw() {
background(0);
i = 0;

// reminder: syntax is
// while(test) { doStuff; }
  while(i < 8) {
    
    //offset by the test multiplied by their diameter.
    ellipse(i * 50, 25, 50, 50);
 
    i++; 
  }
  
  if(i < 10) {
    ellipse( i * 50, 75, 50, 50);
    i++;
  }
  
}
