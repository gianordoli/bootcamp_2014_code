//SIMPLE BREAKOUT
//for MFADT bootcamp 2014
//bryan ma - @whoisbma
//Simplified version of Steph Thirion's GAME MOD version of breakout:
//http://www.trsp.net/teaching/gamemod/

Paddle paddle;
Ball ball;
Brick[] bricks;

void setup() {
  size(700, 800); 
  background(0); 
  paddle = new Paddle();
  ball = new Ball(100, 400); 
  createBricks();
  noStroke();
  noSmooth();
}

void draw() {
  background(10);
  paddle.display();

  for (int i=0; i<bricks.length; i++) {
    bricks[i].display();
    ball.brickCollision(bricks[i]);
  }
  ball.paddleCollision(paddle);
  ball.update();
  ball.display();
  
} 

void createBricks() {
  int bricksNum = 90;
  int bricksPerRow = 10;
  float brickW = width/bricksPerRow;
  float brickH = 30; 
  color brickFill = color(255); 
  int yBricks = 50; 
  float ySpacing = 1.0;
  color[] rowColors = { 
    color(200, 100, 100), 
    color(185, 90, 110), 
    color(170, 80, 120), 
    color(155, 70, 130), 
    color(140, 60, 140), 
    color(125, 50, 150),
    color(110, 40, 160),
    color(95, 30, 170),
    color(80, 20, 180)
  };

  bricks = new Brick[bricksNum];
  for (int i = 0; i < bricksNum; i++) {
    int rowNum = i / bricksPerRow;
    float x = brickW * i;
    x -= rowNum * bricksPerRow * brickW;
    float y = yBricks + i/bricksPerRow * brickH * ySpacing;
    int num = min(rowNum, rowColors.length-1);
    color rowColor = rowColors[num];
    bricks[i] = new Brick(x, y, brickW, brickH, rowColor);
  }
}

