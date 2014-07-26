// DT Bootcamp 2014, Parsons the New School for Design. 
// OBJECTS & CLASSES - Day 11
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

int numObj = 5; //How many objects we want to create
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
  

  for (int i=0;i<letters.size();i++) {
    Alpha p = (Alpha) letters.get(i);   // get [i] index of your array list, then call your object methods using "." notation
    p.move();    
    p.collide();
    p.display();
  }
}

void keyPressed() {
 
  if (key == 'A' || key =='a') { /// use key A to add objects to arraylist
    Alpha myletter = new Alpha(); 
   letters.add(myletter); }
   if (key == 'D' || key =='d') {/// use key D to delete objects from arraylist
    
    if (letters.size()>0){
   letters.remove(0); }
 }
  
}
