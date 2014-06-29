ArrayList<Particle> particles;
ArrayList<ParticleSystem> systems;
import java.util.Iterator;

void setup() {
  size(640,360);
  particles = new ArrayList<Particle>();
  systems = new ArrayList<ParticleSystem>();
  noSmooth();
}

void draw() {
  background(255);

  //[offset-down] A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle(new PVector(width/2,50)));

  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
  //does the above the old fashioned way
//  for (int i = 0; i < particles.size(); i++) {
//    Particle p = particles.get(i);
//    p.run();
//    if (p.isDead()) {
//      particles.remove(i);
//    }
//  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = new PVector(mouseX, mouseY);//l.get();
    lifespan = 255.0;
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 3.0;
  }

  void display() {
    stroke(0,lifespan);
    fill(0);//,lifespan);
    ellipse(location.x,location.y,2,2);
  }

  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class ParticleSystem {
  ArrayList particles;
  PVector origin;
  
  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList();
  }
  
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  //needs run function etc. still
}

//void mousePressed() {
//  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));  
//}
