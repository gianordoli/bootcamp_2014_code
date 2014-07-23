
import processing.video.*;
  // Size of each cell in the grid
  int videoScale = 5;
  // Number of columns and rows in our system
  int cols, rows;
  // Variable for capture device
  Capture video;

void setup() {
  size(640,480);
  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
  noSmooth();
  // Construct the Capture object
  video = new Capture(this,cols,rows,25);
  video.start();
}  

void draw() {
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
      int loc = (video.width - i - 1) + j* video.width;
      // Each rect is colored white with a size determined by brightness
      color c = video.pixels[loc];
      float sz = (brightness(c)/255.0)*videoScale;
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(x + videoScale/2,y+videoScale/2,sz,sz);
    }
  }
}


/*
import processing.video.*;
// Two global variables
float x;
float y;
// Variable to hold onto Capture object
Capture video;
void setup() {
  size(320,240);
  smooth();
  // framerate(30);
  background(0);
  // Start x and y in the center
  x = width/2;
y = height/2;
  // Start the capture process
  video = new Capture(this,width,height,15);
  video.start();
}
void draw() {
  // Read image from the camera
  if (video.available()) {
   video.read();
  }
  video.loadPixels();
  // Pick a new x and y
  float newx = constrain(x + random(-20,20),0,width-1); 
  float newy = constrain(y + random(-20,20),0,height-1);
  // Find the midpoint of the line
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  // Pick the color from the video, reversing x
  color c =  video.pixels[(width-1-midx) + midy*video.width];
  // Draw a line from x,y to the newx,newy
  stroke(c);
  strokeWeight(4);
  line(x,y,newx,newy);
  // Save newx, newy in x,y
  x = newx;
  y = newy;
}
*/
