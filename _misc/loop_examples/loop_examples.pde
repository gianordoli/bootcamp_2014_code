void setup() {
  size(1024, 768);
  background(255);
  stroke(0);
  noFill();
  
  /*
  background(255);
  noStroke();
  for (int x = 0; x < width; x += 10) {
    for (int y = 0; y < height; y += 10) {
      color r = int(random(255));
      color g = int(random(255));
      color b = int(random(255));
      color c = color(r, g, b);
      fill(c); 
      
      //fill(random(0, x), random(0, y), random(0, 255));
      //fill(x, y, mouseX);
      rect(x,y,20,20);
    }
  }
  */
  
  //rewrite this using a while loop
  noStroke();
  float x = 0; 
  while(x < width) {
    float y = 0;
    while(y < height) {
      fill (random(0,105));
      rect(x,y,38,38);
      y = y + 40;
    }
    x = x+ 40;
  }
  
}

void draw() {
  /*for (int i = 0; i < 100; i++) {
   rect(i*20, height/2, 5, 5);
   }*/

  /*int i = 0;
   while (i < 70) {
   ellipse(width/2, height/2, i*20, i*20);
   i++;
   }*/

  /*
  background(255);
   rectMode(CENTER);
   for (float i = 1.0; i < width; i *= 1.1) {
   //stroke(i*.5, i*.2, i*.6);
   //strokeWeight(i);
   //fill(i*.5);
   rect(mouseX, mouseY, i*4, i*2);
   }*/

  /*
  int x = 0;
   for (int c = 255; c > 0; c -= 1) {
   fill(c);
   //noStroke();
   //rectMode(CENTER);
   rect(x,height/2,10,10);
   x = x + 10;
   } */

  /*
  background(0);
   int i = 0;
   while (i < width) {
   noStroke();
   float distance = abs(mouseX - i);
   fill(distance);
   rect(i, 0, 10, height);
   i+=10;
   }  rewrite this using a for loop*/

  
}

