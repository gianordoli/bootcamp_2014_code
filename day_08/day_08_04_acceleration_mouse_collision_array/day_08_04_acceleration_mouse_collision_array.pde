//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, speed, acceleration, and mouse collision
// Same as previous example, but using arrays
//----------------------------------------------------

//How many objects do we have?
int numObj = 100;

//Declaring (the arrays of) the properties of our object(s)
float[] size = new float[numObj];
float[] posX = new float[numObj];
float[] posY = new float[numObj];
float[] speedX = new float[numObj];
float[] speedY = new float[numObj];
float[] hue = new float[numObj];

//The acceleration will be an "environment" property
float accel;

void setup(){
  size(1033, 768);
  colorMode(HSB);
  smooth();
  
  //Assigning values to the properties
  //Since all our arrays have the same length (the number of objects we have),
  //we can loop trough all of them at once
  for(int i = 0; i < numObj; i++){
    //Let's make our objects slightly differently by assigning random values
    size[i] = random(30, 80);
    posX[i] = random(0, width);
    posY[i] = random(0, height);
    speedX[i] = 0;
    speedY[i] = 0;
    hue[i] = random(255);
  }
  
  accel = 0.95;
}

void draw(){
  background(255);

  //Check mouse over
  for(int i = 0; i < numObj; i++){
    if(posX[i] - size[i]/2 < mouseX && mouseX < posX[i] + size[i]/2 &&
       posY[i] - size[i]/2 < mouseY && mouseY < posY[i] + size[i]/2){
      fill(hue[i], 255, 255);
      speedX[i] = mouseX - pmouseX;
      speedY[i] = mouseY - pmouseY;
    }else{
      fill(hue[i], 255, 240, 200);
    }
    noStroke();
    rectMode(CENTER);
    rect(posX[i], posY[i], size[i], size[i], 15);
  
    //Add speed to the position
    posX[i] = posX[i] + speedX[i];
    posY[i] = posY[i] + speedY[i];
    
    //Change speed based on acceleration
    //In this case, the acceleration will slowdown the object
    //Think of it as a simulation of friction 
    speedX[i] = speedX[i] * accel;
    speedY[i] = speedY[i] * accel;
  }
}
