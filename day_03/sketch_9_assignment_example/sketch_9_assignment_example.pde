//Bootcamp Example 3 - 9

PFont font;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
int count;
int imageNumber;

void setup() {
  background(0);
  size(550, 415);
  font = loadFont("STLibian-SC-Regular-48.vlw");
  fill(255);
  textFont(font, 54);
  textAlign(CENTER);
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  imageMode(CENTER);
}

void draw() {
  if (count == 0) {
    switch(imageNumber) {
    case 0:
      image(img1, width/2, height/2);
      break;
    case 1:
      image(img2, width/2, height/2);
      break;
    case 2:
      image(img3, width/2, height/2);
      break;
    case 3:
      image(img4, width/2, height/2);
      break;
    case 4:
      image(img5, width/2, height/2);
      text("Will you merry me?", width/2, 9 * height/10);
      break;
    }
    imageNumber = (imageNumber + 1)%5;
  }
  count = (count + 1)%40;
}

