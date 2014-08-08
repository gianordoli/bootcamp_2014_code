//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 7, Arrays - loadTable
//
// How to load table with high and low record temps of NYC in January
// and use those values to plot a bar chart
// Nicole Messier
//
// http://processing.org/reference/for.html
//----------------------------------------------------


Table table; //delcare table object
int numRows; //declare variable for the number of rows in table
int largestHigh, smallestHigh; //variables for mapping
int largestLow, smallestLow; //variables for mapping

void setup(){
  background(255);
  size(displayWidth, displayHeight);
  table = loadTable("nyWeather.csv", "header");
  
  //how many rows are in the table?
  numRows = table.getRowCount();
  println("Number of Rows: " + numRows);
  
  //set up arrays to store numbers from table
  int[] year = new int[numRows];
  int[] high = new int[numRows];
  int[] low = new int[numRows];
  int[] yearMap = new int[numRows];
  int[] highMap = new int[numRows];
  int[] lowMap = new int[numRows];
  
  //load values from table and store in the arrays
  for (int i=0; i<numRows; i++) {
    
    year[i] = table.getInt(i,0); 
    low[i] = table.getInt(i, 1);
    high[i] = table.getInt(i, 2);
    //if you want to load a string the format would be what?
    //string nameString = table.getString("headerName");
    //println("year: " + year[i]);
    //println("low: " + low);
    //println("high: " + high);
  }
  
  //--------------check high and low values in column "high"-------  
   largestHigh = high[0];
   smallestHigh = high[0];
   for(int i=0; i<numRows-1; i++){
     if(high[i]>largestHigh){
       largestHigh = high[i];
      }
   
      if(high[i]<smallestHigh){
       smallestHigh=high[i]; 
      }
    }
  println("largestHigh: " + largestHigh);
  println("smallestHigh: " + smallestHigh);
  
  //--------------check high and low values in column "low"-------  
   largestLow = low[0];
   smallestLow = low[0];
   for(int i=0; i<numRows-1; i++){
     if(low[i]>largestLow){
       largestLow = low[i];
      }
   
      if(low[i]<smallestLow){
       smallestLow=low[i]; 
      }
    }
  println("largestLow: " + largestLow);
  println("smallestLow: " + smallestLow);
  
  //--------------map & draw high and low temps------- 
  for(int i=0; i<numRows; i++){
    yearMap[i] = int(map(year[i], 1900, 2014, 0, width));
    highMap[i] = int(map(high[i], smallestLow, largestHigh, 0, height/2));
    lowMap[i] = int(map(low[i], smallestLow, largestHigh, 0, height/2));
    
    //draw a line in the middle of the screen to represent the x-axis 
    //on the bar chart
    fill(0);
    line(0,height/2, width, height/2);
    
    //plot red rectangles for high temp records
    fill(255, 0, 0);
    rect(yearMap[i],height/2-highMap[i],2.5,highMap[i]);
    
    //check to see if low temps are negative, and if so shift the
    //x and y value of the rect corner
    if(low[i]>0){
      //plot blue rectangles for low temp records
      fill(0, 0, 255);
      rect(yearMap[i]+2.5,height/2-lowMap[i],2.5,lowMap[i]);
    }else if(low[i]<0){
      //plot blue rectangles for low temp records
       fill(0, 0, 255);
       rect(yearMap[i]+2.5,height/2,2.5,abs(lowMap[i]));
    }
  }
}



