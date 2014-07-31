/*
// sharpen matrix
PImage img;
int w = 80; 

//it's possible to perform a convolution 
//the image with different matrices

float[][] matrix = { {-1,-1,-1}, 
                     {-1,9,-1},
                     {-1,-1,-1}};
                     
void setup() {
  size(300,231);
  img = loadImage("1.jpg");
}

void draw() {
  //we're only going to process a portion of the image 
  //so let's set the whole image as the background first
  image(img,0,0);
  //where is the small rectangle we will process
  int xstart = constrain(mouseX-w/2,0,img.width);
  int ystart = constrain(mouseY-w/2,0,img.height);
  int xend = constrain(mouseX+w/2,0,img.width);
  int yend = constrain(mouseY+w/2,0,img.height);
  int matrixSize = 3;
  loadPixels();
  //begin our loop for every pixel
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++) {
      color c = convolution(x,y,matrix,matrixSize,img);
      int loc = x + y*img.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
  
  stroke(0);
  noFill();
  rect(xstart,ystart,w,w);
}

color convolution(int x, int y, float [][] matrix, int matrixSize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixSize / 2;
  //loop through convolution matrix
  for (int i = 0; i < matrixSize; i++) {
    for (int j = 0; j < matrixSize; j++) {
      //what pixel are we testing
      int xloc = x + i - offset;
      int yloc = y + j - offset;
      int loc = xloc + img.width * yloc;
      //make sure we haven't walked off the edge of the pixel array
      loc = constrain(loc,0,img.pixels.length-1);
      //calculate the convolution
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  //make sure RGB is within range
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  //return the resulting color
  return color(rtotal,gtotal,btotal);
}
*/

/*
PImage img;
int pointillize = 24;

void setup() {
  size(300,231);
  img = loadImage("1.jpg");
  background(0);
  noSmooth();
}

void draw() {  
  //pick a random point 
  int x = int (random(img.width));
  int y = int (random(img.height));
  int loc = x + y * img.width;
  //look up RGB color in the source 
  
 loadPixels();
 float r = red(img.pixels[loc]);
 float g = green(img.pixels[loc]);
 float b = blue(img.pixels[loc]);
 noStroke();
 
 fill(r,g,b,100);
 ellipse(x,y,pointillize,pointillize);
}
*/


/* pixel by pixel processing
PImage img;
int pixelGotX = 0; 
int pixelGotY = 0;

void setup() {
  size(300,231);
  img = loadImage("1.jpg");
  background(0);
  noSmooth();
}

void draw() {  
  */
  /* animated version
//get pixel from screen based on mouse coordinate
  color myPixelColor = img.get(pixelGotX, pixelGotY);


  //move pixel reading position from left to right and then down again
  pixelGotX += 10;
  if (pixelGotX> width && pixelGotY < height) {
    pixelGotX = 0;
    pixelGotY += 10;
  }  


  //get RGB and other channels from pixel
  float myRedValue = red(myPixelColor);
  float myGreenValue = green(myPixelColor);
  float myBlueValue = blue(myPixelColor);
  float myBrightness = brightness(myPixelColor);
  float mySaturation = saturation(myPixelColor);

  //create new colors
  color myRectColor = color(myRedValue, 0, 0);

  noStroke();
  noSmooth();
  fill(myRedValue,myGreenValue,myBlueValue);
  if (myBrightness < 50) {
    ellipse(pixelGotX, pixelGotY, 5, 5);
  }
  else if (myBrightness > 50 && myBrightness < 100){
    ellipse(pixelGotX, pixelGotY, 10,10);
  }
  else if (myBrightness > 100 && myBrightness < 150){
    ellipse(pixelGotX, pixelGotY, 20,20);
  }
  else if (myBrightness > 150 && myBrightness < 200){
    ellipse(pixelGotX, pixelGotY, 30,30);
  }
  else{
    ellipse(pixelGotX,pixelGotY, 40,40);
  }
  */
  
  /*
   //for loop version
  for (int i = 0; i < width; i+=5) {
    for (int j = 0; j < height; j+=5) {
      color pixelColor = img.get(i, j);
      float redVal = red(pixelColor);
      float greenVal = green(pixelColor);
      float blueVal = blue(pixelColor);
      float brightness = brightness(pixelColor);
      float saturation = saturation(pixelColor);
      
      noStroke();
      noSmooth();
      fill(redVal,greenVal,blueVal);
      if (brightness < 50) {
        ellipse(i, j, 5, 5);
      } else if (brightness > 50 && brightness < 100){
        ellipse(i, j, 4,4);
      } else if (brightness > 100 && brightness < 150){
        ellipse(i, j, 3,3);
      } else if (brightness > 150 && brightness < 200){
        ellipse(i, j, 2,2);
      } else {
        ellipse(i,j, 10,10);
      }
    }
  }
*/  
  
//}


/*


PImage img;


void setup() {
  size(800,400);
  img = loadImage("1.jpg");
  background(0);
  noSmooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {  
  background(0);
  int[] colors;
  colors = new int[360];
  
  for (int i = 0; i < img.width; i+=1) {
    for (int j = 0; j < img.height; j+=1) {
      color pixelColor = img.get(i,j);
      float myHue = hue(pixelColor);
      float myBrightness = brightness(pixelColor);
      int colorIndex = int(myHue);
      colors[colorIndex] = colors[colorIndex] + 1;
    }
  }
  
  int maxVal = max(colors);
  for (int i = 0; i < colors.length; i++) {
    int myValue = colors[i];
    float posX = map(i,0,colors.length,0,width);
    float posY = map(myValue,0,maxVal,0,height);
    stroke(i,100,100);
    fill(i,100,100);
    //rectMode(CORNER);
    //line(posX,height,posX,height-posY);
    noStroke();
    rect(posX,height,mouseX,-posY);
  }

}
*/
/* //3D!
PImage img; 
int cellsize = 2;
int cols, rows;

void setup() {
  size(300,231,P3D);
  img = loadImage("1.jpg");    //load the image
  cols = width/cellsize;      // calculate # of columns
  rows = height/cellsize;     // calculate # of rows
}

void draw() {
  background(0);
  loadPixels();
  //begin loop for columns
  for (int i = 0; i < cols; i++) {
    //begin loop for rows
    for (int j = 0; j < rows; j++) {
      int x = i * cellsize + cellsize/2; //x position
      int y = j * cellsize + cellsize/2; //y position
      int loc = x + y * width;    // pixel array location
      color c = img.pixels[loc];  // grab the color
      //calculate the z position as a function of mouseX and pixel brightness
      float z = (mouseX/(float)width) * brightness(img.pixels[loc]) - 100.0;
      //translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
        translate(x,y,z);
        fill(c);
        noStroke();
        rectMode(CENTER);
        rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  } 
}*/
