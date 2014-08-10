class Paddle {
  float x;
  float y;
  float w;
  float h;
  
  Paddle() {
    x = width/2;
    y = height-100;
    w = 120;
    h = 15;
  }
  
  void display() {
    rectMode(CENTER);
    float cx = constrain(x,60,width-60);
    fill(255);
    rect(cx,y,w,h);
    x = mouseX;
  }
  
  boolean doesPointTouchMe (float PX, float PY) {
    boolean result = false;
    if (PX >= x-w/2 && PX < x+w/2) {
      if (PY >= y-h/2 && PY <= y+h/2) {
        result = true;
      }
    }
    return result;
  }
  
}
