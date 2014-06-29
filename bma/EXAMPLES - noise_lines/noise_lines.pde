/*
*rn/mu
*/
 
float s=0;
 
void setup() {
  size(displayWidth, displayHeight/2);
  strokeWeight(3);
  colorMode(HSB, 360, 100, 100);
}
 
void draw() {
  background(0);
  for (float y=0;y<width;y+=1) {
    stroke(abs(sin(radians((s)-y)))*100, abs(sin(radians(s)))*50, 50);
    strokeWeight(1);
    line(y, height/2+cos(sin(radians(s-y)))*(sin(radians(y+s/20))*50+10), y, height/2+cos(y+sin(radians(noise(s/50+y)*20+y)))*350);
    stroke(abs(sin(radians(s-y)))*100, sin(radians(-s))*90, 70);
    strokeWeight(3);
    point(y, height/2+cos(y+sin(radians(noise(s/50+y)*20+y)))*350);
    s+=y/1000000;
  }
  s+=2;
}
