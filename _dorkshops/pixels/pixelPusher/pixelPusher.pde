//QUICK PIXELPUSHER by BMA
//http://www.bryan-ma.com/
//For Pixel Madness MFADT Dorkshop
//based on http://pixlpa.com/qa/pusher.html by Andrew Benson

PImage img;
int w = 80; 

color[][] colors = new color[w][w]; 

boolean imageDrawn = false; 

int xStart;
int yStart;
int xEnd;
int yEnd;

void setup() {
  size(600, 600);
  img = loadImage("spag.jpg");
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < w; j++) {
      colors[i][j] = color(random(255), random(255), random(255));
    }
  }
}


void draw() {
  drawInitialImage();

  xStart = constrain(mouseX-w/2, 0, img.width);
  yStart = constrain(mouseY-w/2, 0, img.height);
  xEnd = constrain(mouseX+w/2, 0, img.width);
  yEnd = constrain(mouseY+w/2, 0, img.height);
   
  if (mousePressed) {
    //try drawing the array of stored pixels at the mouse position
    for (int x = xStart; x < xEnd; x++ ) {
      for (int y = yStart; y < yEnd; y++ ) {
        color c = colors[x-xStart][y-yStart];
        stroke(c);
        point(x, y);
      }
    }
  }
  
loadPixels(); 
  //try getting the mouse pos to fill the array
  for (int x = xStart; x < xEnd; x++) {
    for (int y = yStart; y < yEnd; y++) {
      
      int loc = x + y * width;  
      color c = img.pixels[loc];
      //color c = img.get(x,y);
//      float cr = red(c);
//      float cg = green(c); 
//      float cb = blue(c);
//      float adjustment = random(-50,50); 
//      color newC = color(cr+adjustment, cg+adjustment, cb+adjustment);
      colors[x-xStart][y-yStart] = c;
    }
  }
  updatePixels();
  
}

void drawInitialImage() {
  if (imageDrawn == false) {
    image(img, 0, 0);
    imageDrawn = true;
  } else {
  }
}
