float x, theta, sz = 80;
int num = 15;
color[] palette = {
  #FF0000, #00FF00, #0000FF
};
 
void setup() {
  size(1024, 768, P2D);
  background(0);
  noStroke();
  blendMode(SCREEN);
}
 
void draw() {
  background(0);
 
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    fill(palette[i%3]);
    pushMatrix();
    rotate(i*(TWO_PI/num));
    x = map(sin(theta), -1, 1, -100, 180);
    ellipse(x, 0, sz, sz);
    popMatrix();
  }
  theta += 0.0523;
 
  //if (frameCount<121) saveFrame("image-###.gif");
 
}


/*float x, theta, sz = 40;
int num = 50;
color[] palette = {
  #FF0000, #00FF00, #0000FF
};
 
void setup() {
  size(1000, 800, P2D);
  background(0);
  noStroke();
  blendMode(SCREEN);
}
 
void draw() {
  background(0);
 
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    float offSet = i*(TWO_PI/num);
    fill(palette[i%3]);
    pushMatrix();
    rotate(offSet);
    x = map(sin(offSet+theta), -1, 1, 0, 200);
    sz = map(sin(theta),-1,1,30,50);
    ellipse(x, 0, sz, sz);
    popMatrix();
  }
  theta += 0.0523;
 
  //if (frameCount<121) saveFrame("image-###.gif");
 
}*/
