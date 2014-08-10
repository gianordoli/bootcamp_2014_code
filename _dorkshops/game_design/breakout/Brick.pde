class Brick {
  float x;
  float y;
  float w;
  float h;
  color c; 

  boolean alive;

  Brick(float X, float Y, float W, float H, color C) {
    x = X;
    y = Y;
    w = W;
    h = H;
    c = C;

    alive = true;
  }

  void display() {
    if (alive) {
      rectMode(CORNER);
      fill(c);
      rect(x, y, w, h);
    }
  }

  boolean doesPointTouchMe (float PX, float PY) {
    boolean result = false;
    if (PX >= x && PX < x+w) {
      if (PY >= y && PY <= y+h) {
        result = true;
      }
    }
    return result;
  }
}

