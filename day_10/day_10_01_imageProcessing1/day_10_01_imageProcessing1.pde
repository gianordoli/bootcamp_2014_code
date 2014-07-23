PImage head; // A variable for the image file 
float x,y; // Variables for image location 
float rot; // A variable for image rotation
void setup() {
  size(500,300);
  // load image, initialize variables
  head = loadImage("1.jpg");
  x = 0.0f;
  y = width/2.0f;
  rot = 0.0f;
}
void draw() {
  background(255);
  // Translate and rotate
  translate(x,y);
  rotate(rot);
  tint(255,0,0);
  image(head,0,0); // Draw image
  
  // Adjust variables to create animation
  x += 1.0;
  rot += 0.01;
  if (x > width) {
x = 0; }
}




/*
PImage img;
void setup() {
  size(300,231);
  img = loadImage("1.jpg");
}
void draw() {
  loadPixels();
  // Since we are going to access the image's pixels too
  img.loadPixels();*/
  //reading image data to draw all pixels directly instead of using the image draw function
  /*for (int y = 0; y < img.height; y++) {
   for (int x = 0; x < img.width; x++) {  //or just height/width?
     int loc = x + y * width;
      // Image Processing Algorithm would go here 
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      // Image Processing would go here
     // Set the display pixel to the image pixel
     pixels[loc] = color(r,g,b); //try changing the order
   }
  }
  */
  
  /*
  //adjusting brightness based on mouse position
  for ( int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      //calculate the 1D pixel location
      int loc = x + y*img.width;
      //get the RGB values from the image
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      //change brightness according to the mouse
      float adjustBrightness = ((float)mouseX/width) * 8.0;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      //constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      //make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  */
  /*
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      //calculate 1D pixel location
      int loc = x + y * img.width;
      //get RGB
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      //calculate an amount to change brightness based on proximity to the mouse
      float distance = dist(x,y,mouseX,mouseY);
      float adjustBrightness = (50 - distance)/50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      //constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      //make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }*/
      
  /* 
  //differencing algorithm (simple value comparison with adjacent x value pixel) 
  for (int x = 1; x < width; x++) {
    for (int y = 0; y < height; y++) {
      //pixel location and color 
      int loc = x + y * img.width;
      color pix = img.pixels[loc];
      
      //pixel to the left location and color
      int leftLoc = (x-1) + y * img.width;
      color leftPix = img.pixels[leftLoc];
      
      //new color is difference between pixel and left neighbor
      float diff = abs(brightness(pix) - brightness(leftPix));
      pixels[loc] = color(diff);
    }
  }
  
  
  */


/*  
  updatePixels();
}
*/
