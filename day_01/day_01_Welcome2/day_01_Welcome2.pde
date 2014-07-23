//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// welcome - Day 1
// Borrowing some code from Daniel Shiffman's "Learning Processing"
//----------------------------------------------------

void setup() {
size(600, 400);
background(100,25,50);
smooth();
}


void draw() {
if (mousePressed) {
fill(0);
//fill(random(255),random(255),random(255)); 
} else {
//fill(random(255),random(255),random(255));  
fill(color(204, 102, 0));
}
strokeWeight(8);
ellipse(mouseX, mouseY, 80, 80);
}
