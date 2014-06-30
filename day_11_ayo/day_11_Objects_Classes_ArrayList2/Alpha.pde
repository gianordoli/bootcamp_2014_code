class Alpha {    //This is your class named Alpha - remember Capital A for convention
  float size;    //Declare your variable
  float posX;
  float posY;
  float hue;
  char c;
  float speedX;
  float speedY;
  Boolean isMoving;
  float gravity; 

  Alpha() {      // This is your constructor
    size = random(30, 80);  //Initalize your variable for your class
    posX = random(width);
    posY = random(height - 200);  
    hue = random(255);
    //A random uppercase letter from the ASCII table
    //See: http://www.asciitable.com/
    c = (char) int(random(65, 90));
    speedX = 0;  
    speedY = 0;
    isMoving = false;
    
    gravity = 0.2;
  }

  void move() {

    if (isMoving) {
      // Add speed to location.
      posX = posX + speedX;
      posY = posY + speedY;

      // Add gravity to speed.
      speedY = speedY + gravity;

      //If square reaches the walls
      if (posX < 0) {
        posX = 0; 
        //        speedX[i] = - speedX[i];        
        speedX = speedX * -0.8;
      }     
      if (posX > width) {
        posX = width; 
        //Dampening
        speedX = speedX * -0.8;
      }       

      // If square reaches the bottom
      // Reverse speedY
      if (posY > height - size/2) {
        //Prevent the object from getting stuck outside the scene
        posY = height - size/2;          
        //        speedY = -speedY;  
        // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speedY).  
        // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
        speedY = speedY * -0.8;

        //Still, it may bounce forever unless we make it stop
        if (abs(speedY) < 3) {
          speedY = 0;
        }
        //      println(speedY[i]);
      }
    }
  }

  void  collide() {
    //   Loop through the full array to detect collision with any other object
    // We don't need a nested loop here because... This is already a nested loop!
    // This function is being called through the loop into the draw function...
    // Therefore, any loop we put here will be a loop inside of that one
      for (int i = 0; i < letters.size(); i++) {

      //We want to detect collision with all OTHER objects.
      //Let's call eachone of them, OTHER
      Alpha other = (Alpha) letters.get(i);

      //Calculate the distance from our object to the other
      float distance = dist(posX, posY, other.posX, other.posY);
       
      //Do not check collision with itself!
      if (this != other) {
 
        if (distance < (size + other.size)/2) {
          //Change our object 
          posX = posX - speedX*2;  //Make it go back, so that it won't
          posY = posY - speedY*2;  //get stuck inside of another object
          speedX = speedX * -0.8;
          speedY = speedY * -0.8;         

          //Change other object 
          other.posX = other.posX - other.speedX*2;
          other.posY = other.posY - other.speedY*2;        
          other.speedX = other.speedX * -0.8;
          other.speedY = other.speedY * -0.8;
        }
      }
    }
  }

  void display() {

    float distance = dist(mouseX, mouseY, posX, posY);
    //  println(distance);
    //Checking distance to mouse
    noStroke();
    if (distance < size/2 && !isMoving) {
      fill(hue, 150, 255);  
      isMoving = true;
      speedX = mouseX - pmouseX;
    }
    else {
      fill(hue, 255, 225);
    }

    //Drawing the object
    textSize(size);
    textAlign(CENTER, CENTER);
    text(c, posX, posY);
  }
}

