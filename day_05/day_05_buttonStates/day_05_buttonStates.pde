float circleX;
float circleY;
float diam = 100;
float circle2X;
float circle2Y;
boolean state1; //false
boolean state2; //false

void setup(){
  size(700, 700);  
  circleX=width/4;
  circleY=height/2;
   circle2X=width*3/4;
  circle2Y=height/2;
}

void draw(){
  background(0);
  
  
  //if i am inside the circle, 
  //change the color to red
  println("state1:" + state1);
  //state1
  if(state1==true){
    fill(255,0,0);
    ellipse(circleX, circleY, diam, diam);
  } else {
    fill(255);
    ellipse(circleX, circleY, diam, diam);
  }
  
  if (state2==true){
   fill(255,0,0);
   ellipse(circle2X, circle2Y, diam, diam);
  } else {
    fill(255);
    ellipse(circle2X, circle2Y, diam, diam);
  }
  
}

void mousePressed(){
  
  //state1 is inside the left button
  if(dist(mouseX,mouseY,circleX, circleY)<diam/2){
    state1=!state1;
  }
  
  if(dist(mouseX,mouseY,circle2X,circle2Y)<diam/2){
   state2=!state2; 
  }
  
}
