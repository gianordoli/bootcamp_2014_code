float x;
float y;
float easing = 0.1; 
float diameter = 12; 

void setup() {
  size(600,500);
  noSmooth();
}

void draw() {
  background(255);
  float targetX = mouseX;
  x+=(targetX-x) * easing;
  
  float targetY = mouseY;
  y+=(targetY-y) * easing;
  ellipse(x,y,24,24);
  
  //ellipse(x,40,24,24);
  println(targetX+" : " + x);
}
