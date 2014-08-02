void setup() { 
  size(1024, 768); 
  background(0);
}

void draw() { 
  //diagonals(width/2, height/2); 
  //diagonals(0, height/2); 
  //diagonals(width, height/2);
  
  stroke(255);
  line(mouseX, mouseY, width/2, height/2); 
}

void diagonals(int x, int y) { 
  line(mouseX, mouseY, x+20, y-40); 
  line(mouseX+10, mouseY, x+30, y-40); 
  line(mouseX+20, mouseY, x+40, y-40);
}
