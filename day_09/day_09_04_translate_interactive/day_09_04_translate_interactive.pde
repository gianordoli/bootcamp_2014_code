//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 9, matrix transformations
// A simple radial bar chart, using translate and rotate
// Adding mouse interaction
//----------------------------------------------------

int lineX, lineY;
float[] lineLength;
float[] currLineLength;

void setup(){
  size(600, 600);

  //Initializing the arrays
  lineLength = new float[200];
  currLineLength = new float[200];

  //Setting the vars with an initial position
  lineX = 0;
  lineY = 0;
  
  //Filling arrays with 0's
  for(int i = 0; i < lineLength.length; i++){
    lineLength[i] = 0;
  }  
  for(int i = 0; i < currLineLength.length; i++){
    currLineLength[i] = 0;
  }    
}

void mousePressed(){
  lineX = mouseX;
  lineY = mouseY;
  for(int i = 0; i < lineLength.length; i++){
    lineLength[i] = random(width);
  }
  for(int i = 0; i < currLineLength.length; i++){
    currLineLength[i] = 0;
  }
}

void draw(){
  background(0);
      
  //Translate just once!
  translate(lineX, lineY);
  for(int i = 0; i < lineLength.length; i++){
    currLineLength[i] += (lineLength[i] - currLineLength[i]) * 0.05;
    float alpha = map(currLineLength[i],
                      0, lineLength[i],
                      255, 0);
    
    //line
    stroke(25, 240, 255, alpha);
    line(0, 0, currLineLength[i], 0);
    
    //Rotate a little bit for each iteration...
    rotate(TWO_PI / lineLength.length);    
  }
}
