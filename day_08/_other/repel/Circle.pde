class Circle{
  PVector pos;
  float radius;
  float final_radius;
  Circle(float x, float y){
    pos = new PVector(x, y);
    radius = 1;
    final_radius = random(30, 60);
  }
  
  void update(){
    for(Circle c : myBalls){
      float distance = dist(c.pos.x, c.pos.y, pos.x, pos.y);
      float minDistance = c.radius + radius;
      if(distance < minDistance && distance > 0){
        PVector escape = new PVector(pos.x - c.pos.x,
                                     pos.y - c.pos.y);
        escape.normalize();
        pos.x += escape.x * 1.1;
        pos.y += escape.y * 1.1;
      }    
    }  
  }

  void display(){
    if(radius < final_radius * 0.99){
      radius += (final_radius - radius) * 0.1;
    }
    stroke(255);
    noFill();
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
  }
}
