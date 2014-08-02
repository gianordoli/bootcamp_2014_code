PImage img;
float imgScale;
float cols;
float rows;

int pixelGotX = 0;
int pixelGotY = 0;

void setup() { 
  size(450,600); 
  img = loadImage("jump.jpg"); 
  imgScale = 2;
  cols = 7;
  rows = 1;
  noSmooth(); 
} 

void draw() {
  //background(0);
  //image(img,0,0,450,600);
  
  //stepwise way
  color myPixelColor = img.get(pixelGotX,pixelGotY);
  float brightness = brightness(myPixelColor); 
  
  fill(myPixelColor);
  noStroke();
  rectMode(CENTER);
  rect(pixelGotX*2,pixelGotY*2,5,brightness*0.1);
  
  pixelGotX += 5;
  
  if (pixelGotX > img.width && pixelGotY < img.height) {
    pixelGotX = 0;
    pixelGotY += 10;
  }
  
  /*
  //looping way
  for (int x = 0; x < 450; x += rows) {
    for (int y = 0; y < 600; y += cols) {
      color c = img.get(x,y);
      float bright = brightness(c); 
      
      //rectangle size based on brightness, b&w (cols to 5 and 5 maybe)
      //noStroke();
      //fill(bright);
      //fill(c);
      //rectMode(CENTER);
      //rect(x*imgScale,y*imgScale,bright/10 + sin(frameCount * 0.01),bright/10 + cos(frameCount * 0.01));
      
      //points with offset based on brightness (set cols to 1 and 5 or something)
      //stroke(255); 
      //float offset = map(bright, 0, 255, 0, 10);
      //point(x*imgScale,y*imgScale+offset);//+sin(frameCount));
      
      //vertical empty rectangles (cols to 15 and 1)
      //stroke(c);
      //fill(bright);
      //rectMode(CENTER);
      //rect(x*imgScale, y*imgScale, 1, bright/10);
      
      //brightness measurer (cols to 7 and 1)
      //stroke(255);
      //float lineHeight = map(bright, 0, 255, 0, 10);
      //line(x*imgScale, y*imgScale, x*imgScale, y*imgScale-lineHeight+sin(frameCount* 0.1));
    }
  }
  */
} 
