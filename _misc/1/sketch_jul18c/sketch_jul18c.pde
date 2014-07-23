//PImage mPortrait;
int x = 0;
int y = 0;

void setup() {
  background(255);
  size (1024, 768);
  
  
  //mPortrait = loadImage("data/b.png");
  rectMode(CENTER);
  //ellipseMode(CENTER);
  //imageMode(CENTER);
  
  //noStroke();
  //strokeWeight(2);
  //fill(105, 185, 174);
  //color(105, 185, 174);
  //rect(width/2, height/2, 100, 100);
  
  //fill(185, 105, 174);
  //color(185, 105, 174);
  //ellipse(width/2, height/2, 100, 100); 
}
  
void draw() {
  //pushMatrix();
  //rotate(radians(x+10));
  //image(mPortrait, 0, 0, 100, 100);
  //x += 1;
  //rect(width/2, height/2, 100+x, 100+x);
  //popMatrix();
  
  
  if (mousePressed) {
    rect(mouseX, mouseY, 20+x, 20+x);
    x += 1;
    //image(mPortrait, mouseX-x*2, mouseY-x, 0+x, 0+x*2);
    //x += 1;
    //y += 5;
  }
  
  
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
      println("screenshot captured");
    }
  }
}

void mouseReleased() {
  x= 0;
}

//void draw() { 
//  if (mousePressed()) {
//    rect(mouseX, mouseY, 20+x, 20+x);
//    x += 1;
//  }
//}
//  //void mousePressed() { 
//  //  println("YOU DID IT YOU SNARKY BASTARD!");
//  //}
//
//  if (keyPressed) {
//    println(key + " pressed");
//    if (key == s) {
//      saveFrame();
//    }
//  }

