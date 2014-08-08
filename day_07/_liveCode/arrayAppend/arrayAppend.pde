//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7 - Arrays
// Drawing tool using append
//----------------------------------------------------

//Declaring and initializing the arrays
//Note that they're both empty (length = 0)
float[] posX = new float[0];
float[] posY = new float[0];
 
void setup() {  // this is run once.  
    size(500, 500); 
} 
 
void draw() {  // this is run repeatedly.  
    background(0);
    stroke(255);
 
    for(int i = 0; i < posX.length; i++){
//        println("x: " + posX[i] + ", y: " + posY[i]);
        strokeWeight(5);
        point(posX[i], posY[i]);
        
        //Draw the line
        strokeWeight(1);
        if(i < posX.length - 1){
            line(posX[i], posY[i], posX[i + 1], posY[i + 1]);
        }
    }
    println(posX.length);
}
 
void mousePressed(){
    //myArray = append(myArray, new element)
    posX = append(posX, mouseX);
    posY = append(posY, mouseY);
}
