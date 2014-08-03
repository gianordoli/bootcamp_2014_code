PImage yurt;

void setup() {
  size(800, 600);
  background(255);
  yurt = loadImage("yurt.jpg");
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  image(yurt,0,0);
  
  int[] colorNumbers;
  colorNumbers = new int[360];
  
  for (int x = 0; x < yurt.width; x++) {
    for (int y = 0; y < yurt.height; y++) {
      color c = yurt.get(x,y);
      float h = hue(c); 
      int colorIndex = (int)h;
      colorNumbers[colorIndex] = colorNumbers[colorIndex] + 1;
    }
  }
  
  int maxValue = max(colorNumbers);
  for (int i = 0; i < colorNumbers.length; i++) {
    int value = colorNumbers[i];
    float posX = map(i,0,colorNumbers.length,0,width);
    float valueHeight = map(value,0,maxValue,0,height);
    stroke(i,100,100);
    line(posX,height,posX,height-valueHeight);
  }

  
}
