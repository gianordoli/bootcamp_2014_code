void setup(){
  size(500, 500);

  //Loading the data from my tsv file  
  String[] originalData = loadStrings("posts_by_class.tsv");
//  println(originalData.length);
  for(int i = 1; i < originalData.length; i++){
//    println(originalData[i]);
    // Split is gonna look for a delimiter
    // and split the line in an Array (tab, in this case)
    String[] myLine = split(originalData[i], "\t");
//    println(myLine.length);
    println(myLine[0]);  //First column
    println(myLine[1]);  //Second column
  }
}

void draw(){
}
