void setup() {
  size(400,400);
  // Before we deal with pixels
  loadPixels();
  // Loop through every pixel
  for (int i = 0; i < pixels.length; i++) {
    // Pick a random number, 0 to 255
    float rand = random(255);
    // Create a grayscale color based on random number
    color c = color(rand);
    // Set pixel at that location to random color
    pixels[i] = c;
  }
// When we are finished dealing with pixels
updatePixels(); 
}
/*
void draw() {
  loadPixels();
  // Loop through every pixel
  for (int i = 0; i < pixels.length; i++) {
    // Pick a random number, 0 to 255
    float rand = random(255);
    // Create a grayscale color based on random number
    color c = color(rand);
    // Set pixel at that location to random color
    pixels[i] = c;
  }
// When we are finished dealing with pixels
updatePixels(); 
  
}*/
/*
//SETTING PIXELS ACCORDING TO THEIR 2D LOCATION
void setup() {
//2D array
  size(800,200);
  loadPixels();
  // Loop through every pixel column
  for (int x = 0; x < width; x++) {
    // Loop through every pixel row
    for (int y = 0; y < height; y++){
       // Use the formula to find the 1D location
      int loc = x + y * width;
      if (x % 2 == 0){ // If we are an even column 
        pixels[loc] = color(255);
      } else { // If we are an odd column 
        pixels[loc] = color(0);
      } 
    }
  }
  updatePixels();
}
*/

/*void setup() {
//2D array
  size(255,255);
  loadPixels();
  // Loop through every pixel column
  for (int x = 0; x < width; x++) {
    // Loop through every pixel row
    for (int y = 0; y < height; y++){
       // Use the formula to find the 1D location
      int loc = x + y * width;
      float distance = dist(x,y,width/2,height/2);
      pixels[loc] = color(distance);
    }
  }
  updatePixels();
}*/
/*
void setup() {
  size(255,255);
  loadPixels();
  float distance;
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      int loc = x + y * width;
      if ( x < width/2 ) {
         distance = dist(x,y,width/2,0);
      } else {
         distance = dist(x,y,width/2,height);
      }
      pixels[loc] = color(distance);
    }
  }
  updatePixels();
}
*/
