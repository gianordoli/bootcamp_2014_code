//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 11, translate and rotate
// Using translate and rotate combined with sine function
// Adding mouse interaction
//----------------------------------------------------

float matrixAngle = 0;
float rectAngle = 0;
void setup() {  // this is run once.   
    size(500, 500);
} 
 
void draw() {  // this is run repeatedly.  
    background(0);
    translate(width/2, height/2);
    matrixAngle = map(mouseX, 0, width, 0, radians(360));
    rotate(matrixAngle);
    
    float angle = map(mouseY, 0, height, 0, PI/4);
   for(int i = 0; i < 8; i++){
        
        pushMatrix();
        translate(200, 0);
        rotate(rectAngle);
            fill(0, rectAngle, 255, 100);
            rectMode(CENTER);
            rect(0, 0, 100, 100);
//        rotate(-rectAngle);             
//        translate(-200, 0);           
        popMatrix();
        
      rotate(angle);
    }
//    matrixAngle = mouseX;
    rectAngle = rectAngle + PI/200;
    println(angle);
}
