//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 6 - introducing the for() loop
// http://processing.org/reference/for.html
// written by Dylan Shad
//----------------------------------------------------

void setup() {
  size(500, 100);
}

void draw() {
background(0);

// the for loop combines a test with two other methods
// this is why the parameters of for() are separated with
// semicolons, and not commas.

// method 1: declaration and initialization of a test variable
// test: test that test variable!
// method 2: update the test variable.

// note: "i" is only a conventional name for the variable.
// it can be anything that makes sense.
// "i" stands for "iterator"
  for(int i = 0; i < 10; i++) {
    // every run of the loop, a circle is drawn
    // starting with an x of 25
    // and a displacement of 50 for every time the loop has run
    ellipse(25+(i*50), height/2, 50, 50);
    // it is important to note that the update happens only
    // as the LAST thing in the loop, before it starts over again.
  }
}
