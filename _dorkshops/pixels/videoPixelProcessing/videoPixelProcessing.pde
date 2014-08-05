
import processing.video.*;
import processing.pdf.*;

// Size of each cell in the grid
int videoScale = 10;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;

boolean recordPDF = false;

void setup() {
  size(640, 480);
  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
  //noSmooth();
  // Construct the Capture object
  video = new Capture(this, cols, rows, 25);
  video.start();

  colorMode(HSB);
}  

void draw() {
  
  if (recordPDF == true) {
    beginRecord(PDF, "pdf-####.pdf");
  }
  if (video.available()) {
    video.read();
  }
  background(0);
  video.loadPixels();

  // Begin loop for columns
  for (int i = 0; i < cols; i++) { // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      int x = i * videoScale;
      int y = j * videoScale;
      //int loc = (video.width - i - 1) + j* video.width; //mirror
      int loc = i + j * video.width;  //standard
      color c = video.pixels[loc];
      float sz = (brightness(c)/255.0)*videoScale;

      //size pulse
      //float sz = (brightness(c)/255.0) *  10 * sin(frameCount * 0.1);

      //size mouse-based pulse
      //float s = dist(mouseX, mouseY, x, y);
      //float sz = (brightness(c)/255.0) * map(s, 0, width/2, 1, 20) + sin(frameCount * 0.01) * 10;

      //regular rectangles
      rectMode(CENTER);
      fill(255);
      noStroke();
      //rect(x + videoScale/2, y+videoScale/2, sz, sz);

      //points
      //      stroke(brightness(c));
      //      point(x,y);

      //colors and rotations
      pushMatrix();
      translate(x + videoScale/2, y+videoScale/2);
      float newHue = map(brightness(c), 0, 255, 0, 255);
      fill(newHue, 100, 255);
      rotate(radians(mouseX * 0.1) + brightness(c));

      rectMode(CENTER);
      rect(0, 0, sz, sz);
      popMatrix();
    }
  }
  
  
  if (recordPDF == true) {
    endRecord();
    recordPDF = false;
  }  
}

void mousePressed() {
  recordPDF = true;
}

