//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, repel
// Using collision detection to repel objects
// This example uses some advanced concepts, like
// classes and PVector, but the main detection code
// is the same as the one students will see on Day 8
//----------------------------------------------------

ArrayList<Circle> myBalls;

void setup(){
  size(600, 600);
  myBalls = new ArrayList<Circle>();
}

void draw(){
  background(0);
  for(Circle c : myBalls){
    c.update();
    c.display();
  }
}

void mousePressed(){
  myBalls.add(new Circle(mouseX, mouseY));
}
