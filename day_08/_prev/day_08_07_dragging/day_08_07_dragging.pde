//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, speed, acceleration, and mouse collision
// Detecting collision between objects
// Added mousePressed to make the objects draggable
//----------------------------------------------------

//How many objects do we have?
int numObj = 20;

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
    posX[i] = random(size[i]/2, width - size[i]/2);
    posY[i] = random(size[i]/2, height - size[i]/2);
    speedX[i] = 0;
    speedY[i] = 0;
    hue[i] = random(255);
  }
  
  accel = 0.95;
}

void draw(){
  background(255);

  for(int i = 0; i < numObj; i++){
    checkMouse(i);      //Check mouse over
    checkBoundaries(i); //Check boundaries
    checkCollision(i); //Check collision with other rects
    
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

void checkMouse(int i){
  if(mousePressed){
    if(posX[i] - size[i]/2 < mouseX && mouseX < posX[i] + size[i]/2 &&
       posY[i] - size[i]/2 < mouseY && mouseY < posY[i] + size[i]/2){
      fill(hue[i], 255, 255, 200);
      speedX[i] = mouseX - pmouseX;
      speedY[i] = mouseY - pmouseY;
    }else{
      fill(hue[i], 255, 240, 200);
    }
  }else{
    fill(hue[i], 255, 240, 200);
  }
}

void checkBoundaries(int i){
  if(posX[i] - size[i]/2 < 0 || posX[i] + size[i]/2 > width){
    speedX[i] = -speedX[i];
  }
  if(posY[i] - size[i]/2 < 0 || posY[i] + size[i]/2 > height){
    speedY[i] = -speedY[i];
  }
}

void checkCollision(int i){
  //Loop through the full array to detect collision with any other object
  for(int j = 0; j < numObj; j++){
    
    //Do not check collision with itself!
    if(i != j){
      //Is it colliding on the x axis?
      if(posX[i] - size[i]/2 < posX[j] + size[j]/2 && posX[j] - size[j]/2 < posX[i] + size[i]/2 &&
         posY[i] - size[i]/2 < posY[j] + size[j]/2 && posY[j] - size[j]/2 < posY[i] + size[i]/2){
       
       //Change 'i' object 
       posX[i] = posX[i] - speedX[i]*2;  //Make it go back, so that
       posY[i] = posY[i] - speedY[i]*2;  //it won't get stuck inside of another object
       speedX[i] = - speedX[i];
       speedY[i] = - speedY[i];
       
       //Change 'j' object
       posX[j] = posX[j] - speedX[j]*2;
       posY[j] = posY[j] - speedY[j]*2;
       speedX[j] = - speedX[j];
       speedY[j] = - speedY[j];       
       
      }    
    }
  }
}
