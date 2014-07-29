//note - there are conditionals etc. in here which is out of scope but
//might be good to get people inspired to try using them and rotation, etc. 

int mAngle = 300;
int mSize = 300;
int mTranslateValue1 = 0;
int mTranslateValue2 = 0;
float mMovementX = 0;
int mHue = 50;
String mTextVariable = "Text";

void setup() {
  size(315, 315);
  frameRate(30);
  smooth();
  background(50);
  rectMode(CENTER);
}

void draw() {
  float mySizeX = map(mouseX, 0, width, 10, 20);
  float mySizeY = map(mouseY, 0, height, 10, 20);
  mMovementX += 5;
  mAngle -= 2;
  mSize -=1;
  mHue += 1;
  mTranslateValue1 += 1;
  if (mTranslateValue1 >width){
    mTranslateValue1 = 0;
    mTranslateValue2 +=50;
  }
  if (mHue > 254){
    mHue = 0;
  }
  if (mAngle < 1){
    mAngle = 300;
  }
  if (mSize < 1) {
    mSize = 300;
  }
  if (mMovementX > 254) {
    mMovementX = 0;
  }
  fill(255, 50);
  stroke(mHue,mHue+50,mHue+100);
  translate(mTranslateValue1, mTranslateValue2);
  rotate(radians(mMovementX));
  rect(0, 0, mySizeX, mySizeY);
  

//  rect(mMovementX+50, 50, mSize, mSize);
//  rotate(radians(mAngle+10));
//  rect(mMovementX+100, 100, mSize, mSize);
//  rotate(radians(mAngle+15));
//  rect(mMovementX+150, 150, mSize, mSize);
//  rotate(radians(mAngle+20));
//  rect(mMovementX+200, 200, mSize, mSize);

  if (keyPressed) {
    if (key == 's') {
      saveFrame();
      println("screenshot captured");
    }
  }
}

