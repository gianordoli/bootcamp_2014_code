/*
Arraylist example
 Jennifer Presto
 Example for BFA class in Creative Computing
 April 9, 2013
 Modified by Ayodamola Okunseinde for Bootcamp 2014 
 Code below adapted from Daniel Shiffman's
 example 23-2: Simple Particle System with ArrayList,
 available here:
 www.learningprocessing.com/examples/chapter-23/example-23-2/
  
 */
Particle p;
 
void setup() {
  size(200, 400);
  smooth();
  p= new Particle();
}
 
void draw() {
 
  background(255);
    p.run();
    p.gravity();
    p.display();
 
    
}
 
void mousePressed(){
p= new Particle();
}
 
 
class Particle {
  float x;
  float y;
  float xspeed;
  float yspeed;
 
  Particle() {
    x = random(0, width);
    y = random(0, height);;
    xspeed = random(-1, 1);
    yspeed = random(-3, 0);
  }
 
  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }
 
  void  gravity() {
    yspeed += 0.05;
  }
 
  void display() {
    stroke(0);
    fill(0, 75);
    ellipse(x, y, 10, 10);
  }
}

