//Declaring arrays
//Initializing with a size 0
//Because we don' know yet how many elements we're gonna load
String[] classNames = new String[0];
int[] nPosts = new int[0];

void setup(){
  size(500, 500);

  //Loading the data from my tsv file  
  Table teachers = loadTable("posts_by_class.tsv", "header");
  
  //Looping through the table's lines
  for(int i = 0; i < teachers.getRowCount(); i++){
    
    //For each line, create a TableRow object
    TableRow myRow = teachers.getRow(i);
    
    //Appending each one of the columns to one of our arrays
    classNames = append(classNames, myRow.getString("class"));
    nPosts = append(nPosts, myRow.getInt("posts"));
  }
}

void draw(){
  background(200, 0, 150);
  textAlign(LEFT, TOP);
  float y = 0;
  for(int i = 0; i < classNames.length; i++){
    textSize(nPosts[i]/6);
    text(classNames[i], 20, y);
    y += nPosts[i]/6;
  }
}
