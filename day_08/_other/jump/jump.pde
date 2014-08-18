float speedY;
float posY;
float gravity;
void setup(){
  size(500, 500);
  speedY = 0;
  posY = 0;
  gravity = 0.5;
}

void draw(){
  background(0);
  posY += speedY;
  speedY += gravity;
  if(posY > height){
    posY = height;
  }
  ellipse(width/2, posY, 50, 50);
}

void mousePressed(){
  speedY = -15;
}
