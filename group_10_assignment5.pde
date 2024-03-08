// Initialize variables
Fishes fish_group;
PVector[] positions;


void setup() {
  size(700, 700, P3D);
  
  // Setup the fish
  PShape fishShape = loadShape("fish.obj");
  PImage fishTexture = loadImage("fish.png");
  PVector start = new PVector(-300, height/2, -300);
  PVector end = new PVector(width + 300, height/2, -300);
  
  // Create a Fishes object
  fishPositions();
  fish_group = new Fishes(fishShape, fishTexture, start, end, 0.0, 0.07, radians(10), 0.0, 1, positions);
  fish_group.fishSetup(35);
}

void fishPositions(){
  // Create positions to make a 'school' of fish
  positions = new PVector[4];
  for (int i = 0; i < positions.length; i++) {
    float offsetX = random(-100, 100); 
    float offsetY = random(-100, 100);
    float offsetZ = random(-200, 200);
    positions[i] = new PVector(offsetX, offsetY, offsetZ);
  }
}

void draw() {
  background(0);
  lights();
  
  fish_group.display();
}
