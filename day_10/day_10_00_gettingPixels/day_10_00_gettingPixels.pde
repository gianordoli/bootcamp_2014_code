//step 1 - load in image
//step 2 - use get to get the color value at the mouse position
//step 3 - draw a shape at the mouse position using the color data as fill
//step 4 - split up the rgb 
//step 5 - use color data to render additional visualization on bottom of screen   
          //use map function to limit the size of rectangles to the edge of the screen
          //use map function to get the color of that level of rgb to color each rectangle
//step 6 - get brightness instead and use that to change the brightness of the total image or something
//step 7 - make a walker that crawls across image randomly instead of using mouse


PImage doge;

//for walker
/*
int xpos;
int ypos;
float xchange;
float ychange;
*/

void setup() {      
  size(500,500);    
  doge = loadImage("doge.jpg"); 
  
  //for walker
  /*
  xpos = width/2; 
  ypos = height/2; 
  xchange = 0; 
  ychange = 0; 
  */
}

void draw() {       

  //1 draw image
  image(doge,0,0);  //comment out drawing the actual image to illustrate
  // get color  
  color posColor = doge.get(mouseX,mouseY);
  // create shape
  fill(posColor);
  ellipse(mouseX,mouseY,50,50);

  //2 - using brightness to change shape
  //float posBrightness = brightness(posColor);
  //ellipse(mouseX,mouseY,posBrightness,posBrightness); 
  
  //3 - getting split up RGB data
  /*
  float redVal = red(posColor);
  float greenVal = green(posColor);
  float blueVal = blue(posColor);

  fill(redVal,greenVal,blueVal);   //this does the same as above
  noStroke(); 
  ellipse(mouseX,mouseY,50,50);
  */
  
  //4- making color visualization
  /*
  fill(redVal,0,0);
  rect(0,0,redVal,20);
  fill(0,greenVal,0);
  rect(0,20,greenVal,20);
  fill(0,0,blueVal);
  rect(0,40,blueVal,20); 
  */
  
  //5 - making nicer color vis with mapped values to screen width
  /*
  float redRect = map(redVal, 0, 255, 0, width);
  float greenRect = map(greenVal, 0, 255, 0, width);
  float blueRect = map(blueVal, 0, 255, 0, width);
  
  fill(redVal,0,0);
  rect(0,0,redRect,20);
  fill(0,greenVal,0);
  rect(0,20,greenRect,20);
  fill(0,0,blueVal);
  rect(0,40,blueRect,20); 
  */
  
  //6 - walker 
  /*
  xchange = int(random(-5,5));
  ychange = int(random(-5,5));
  xpos += xchange;
  ypos += ychange;
  posColor = doge.get(xpos,ypos);
  fill(posColor);
  ellipse(xpos,ypos,2,2);
  */
}
