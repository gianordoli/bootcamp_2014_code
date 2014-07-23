Planet[] planets = new Planet[8];

void setup() {
  size(600,200);
  noSmooth(); 
  
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(20+i*10,i+8);
  }
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2,height/2);
  stroke(0);
  fill(255);
  ellipse(0,0,20,20);
  for (int i = 0; i < planets.length; i++) {
    planets[i].update();
    planets[i].display();
  }
  popMatrix();
}

class Planet {
  float theta;
  float diameter;
  float distance;
  float orbitspeed;
  
  Planet(float distance_, float diameter_) {
    distance = distance_;
    diameter = diameter_;
    theta = 0; 
    orbitspeed = random(0.01,0.03);
  }
  
  void update() {
    theta += orbitspeed;
  }
  
  void display() {
    pushMatrix();
    rotate(theta);
    translate(distance,0);
    noStroke();
    fill(175);
    ellipse(0,0,diameter,diameter);
    popMatrix();
  }
}
