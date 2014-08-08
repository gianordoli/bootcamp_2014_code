//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 11, translate and rotate
// Using translate and rotate combined with sine function
//----------------------------------------------------

float i = 0;
 
void setup() {
    size(500, 500); 
} 
 
void draw() {
    background(0);
    
    //This is the red one
    fill(255, 0, 0);
    ellipse(width/2, height/2, sin(i)*100, cos(i)*100);
    
    //This is the green one
    translate(width/2, height/2);    
//    fill(0, 255, 0);
//    ellipse(sin(i)*100, cos(i)*100, 80, 80);
    
    rotate(sin(i));
    fill(0, 150, 255);
    rectMode(CENTER);
    rect(0, 200, 50, 50);
//    rect(sin(i)*100, cos(i)*100, 50, 50);
      
    i = i + 0.1;
    println("i: " + i + " | " + sin(i));
}
