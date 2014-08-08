//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 6 - nested for() loops
// http://processing.org/reference/for.html
//----------------------------------------------------

void setup() {
    size(500, 500); 
    colorMode(HSB);
} 
 
void draw() {
    background(0);
    ellipseMode(CORNER);
    int circleSize = 20;
 
    for(int y = 0; y < mouseY; y = y + circleSize){    
//    for(int y = 0; y < height; y = y + circleSize){
//    for(int y = 0; y < height; y = y + 10){        
 
        for(int x = 0; x < mouseX; x = x + circleSize){
//        for(int x = 0; x < width; x = x + circleSize){
//        for(int x = 0; x < width; x = x + 10){            
            fill(x/2, 255, 255);
            ellipse(x, y, circleSize, circleSize);
            //Draw the text
//            fill(255);
//            textAlign(LEFT, TOP);
//            text("i: " + i + ", j: " + j, i*circleSize,j*circleSize);            
        }
    }
}
