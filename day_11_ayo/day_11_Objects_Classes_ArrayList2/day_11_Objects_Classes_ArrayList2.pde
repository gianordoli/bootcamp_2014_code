// DT Bootcamp 2014, Parsons the New School for Design. 
// OBJECTS & CLASSES - Day 11
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

int numObj = 15; //How many objects we want to create
PFont myFont;
ArrayList letters; //Creat your ArrayList

void setup() {
  size(600, 600);
  colorMode(HSB);  //HSB color mode - remember (Hue value, 255, 255)

  myFont = createFont("HelveticaNeue-Bold", 32); //Font object
  textFont(myFont);

  letters = new ArrayList();  
  for (int i=0;i<numObj;i++) {  
    Alpha myletter = new Alpha();
    letters.add(myletter);    //Place your objects into your array list using a for loop
  }
}

void draw() {
  background(255);

  for (int i=0;i<numObj;i++) {
    Alpha p = (Alpha) letters.get(i);   // get [i] index of your array list, then call your object methods using "." notation
    p.move();    
    p.collide();
    p.display();
  }
}
