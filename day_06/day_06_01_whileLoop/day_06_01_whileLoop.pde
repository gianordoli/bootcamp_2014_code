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
    
    // by using the test as a modifier, we can set up
    // multiple objects - here we use it to create a set
    // of ellipses, offset by the test multiplied by their diameter.
    ellipse(i * 50, 25, 50, 50);
    
    // something WITHIN the while loop must cause
    // the test to change, and enable the program
    // to eventually exit the loop. Most things,
    // even system variables, do not update during
    // the loop - so it is imperative that we do this
    // manually, or crash the program.
    i++; 
  }
  
// for comparison's sake, let's see what happens if we do this same exact
// thing, but 50 pixels lower and using "if()" instead of "while()"
// reminder: syntax is
// for(test) { doStuff; }
// identical to while()
  if(i < 10) {
    ellipse( i * 50, 75, 50, 50);
    i++;
  }
  
// by the time we get done with the while() loop, "i" is at 8
// so the test has to be expanded for if() to activate.
// it also doesn't change, because if() does not loop
// and "i" resets at the beginning of the draw loop.
  
}
