//threads_140421b
boolean alternate = true;
ArrayList<PointPosition> pointPosition = new ArrayList();
int threshold = 135;
int width = 1920/3;
int height = 1080/2;
int[] directions = {
  (width*-1)-1,
  width*-1,
  (width*-1)+1,
  1,
  width+1,
  width,
  width-1,
  -1
};

void setup(){
  size(width,height);
  background(0);
  frameRate(12);
  startScatter();
}

void draw(){
  threshold = setThreshold(threshold,135,235);
  fill(0,2);
  stroke(0,2);
  rect(-2,-2,width+2,height+2);
  stroke(255,threshold);
  for(PointPosition p:pointPosition){
    p.tpos.x = p.tpos.x+tan(threshold)*sin(millis())*sin(p.pos.x);
    p.tpos.y = p.tpos.y+tan(threshold)*cos(millis())*cos(p.pos.y);
    p.update();
    p.render();
  }
}

void startScatter(){
  for (int i = 0; i<width/2; i++){
    PointPosition p = new PointPosition();
      p.pos.x = width/2;
      p.pos.y = height/2;
      p.tpos.x = width/2+cos(i)*width/5;
      p.tpos.y = height/2+sin(i)*height/5;
    pointPosition.add(p);
  }
}

int setThreshold(int threshold, int minThreshold, int maxThreshold) {
  if (threshold <= maxThreshold && threshold >= minThreshold && alternate) {
    threshold++;
  } else if (threshold <= maxThreshold && threshold >= minThreshold) {
    threshold--;
  } else if (alternate) {
    threshold = maxThreshold;
    alternate = !alternate;
  } else {
    threshold = minThreshold;
    alternate = !alternate;
  }
  return threshold;
}

class PointPosition {
  PVector pos = new PVector();
  PVector tpos = new PVector();
  color pointColor;
  void update(){
    pos.lerp(tpos,0.2);
  }
  void render(){
    point(pos.x,pos.y);
  }
}
