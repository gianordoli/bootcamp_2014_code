//QUICK SLITSCAN by BMA
//http://www.bryan-ma.com/
//For Pixel Madness MFADT Dorkshop

import processing.video.*;
int xx = 0;
Capture video;

void setup() {
  size(1000, 480); 
  frameRate(30); 
  video = new Capture(this, 640, height); 
  video.start();
}

void draw() {
  if (video.available()) {
    video.read(); 
    //image(video, 0, 0);
    filter(POSTERIZE,4);
    video.loadPixels(); 
    for (int x = 0; x < width; x++ ) {
      for (int y = 0; y < height; y++ ) { 
        if (x == 320){//xx) {     
          color c = video.get(x, y);
          int loc = x + y * width; 
          stroke(c);
          point(xx,y);
        }
      }
    }
    xx += 1;
    video.updatePixels();
  }
}

