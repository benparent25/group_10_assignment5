class Fishes {
  PShape fish;
  PImage txtr;
  PVector start;
  PVector end;
  float angle;
  float angleSpeed;
  float angleRange;
  float t;
  int direction;
  PVector[] positions;

  Fishes(PShape fish, PImage txtr, PVector start, PVector end, float angle, float angleSpeed, 
  float angleRange, float t, int direction, PVector[] positions) {
    // Construct the object
    this.fish = fish;
    this.txtr = txtr;
    this.start = start;
    this.end = end;
    this.angle = angle;
    this.angleSpeed = angleSpeed;
    this.angleRange = angleRange;
    this.t = t;
    this.direction = direction;
    this.positions = positions;
  }

  void fishSetup(int scale) {
    fish.scale(scale);
    fish.setTexture(txtr);
  }

  void display() {
  // Calculate angle of 'wiggle'
  angle += angleSpeed * direction;
  
  // Calculate position based on lerp
  PVector pos = PVector.lerp(start, end, t);
  t += 0.003 * direction;
  
  // Draw the original fish
  drawFish(pos);

  // Control the direction of fish when it goes across screen space
  if (t >= 1 || t <= 0) {
    direction *= -1; 
    t = constrain(t, 0, 1);
  }
  
  // Draw additional fish relative to the original fish using generated positions
  for (int i = 0; i < positions.length; i++) {
    PVector relativePos = PVector.add(pos, positions[i]);
    drawFish(relativePos);
  }
}

  
  void drawFish(PVector position) {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateZ(PI);
    // 'Wiggle' the fish
    float angleOffset = sin(angle) * angleRange;
    rotateY(angleOffset + 30);
    
    // Rotate fish when it turns around
    if (direction == -1) {
      rotateY(PI);
    }

    shape(fish);
    popMatrix();
  }
}
