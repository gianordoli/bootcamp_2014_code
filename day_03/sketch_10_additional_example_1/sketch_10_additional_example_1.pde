//Bootcamp Example 3 - 10

PImage img;

void setup() {
  size(242, 512);
  img = loadImage("lena.jpg");
}

void draw() {
  background(0);

  loadPixels(); 
  img.loadPixels(); 
  
  for (int y = 0; y < mouseY; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Set the display pixel to the image pixel
      pixels[loc] =  color(r, g, b);
    }
  }
  updatePixels();
}

