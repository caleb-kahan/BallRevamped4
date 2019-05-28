class Laser extends EnvironmentElement {
  float velocity;
  Laser(float cenX, float cenY, float angle) {
    super(cenX, cenY, 10, 20, angle);
    velocity=15;
  }
  boolean isTouching(Ball b) {
    return false;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(angleRotation));
    rectMode(CORNER);
    fill(30, 144, 255);
    rect(-w/2, l, 2*w/5, l);
    fill(176, 219, 240);
    rect(-w/10, l, w/5, l);
    fill(30, 144, 255);
    rect(2/10, l, 2*w/5, l);
    popMatrix();
  }
  void move() {
    x+=cos(radians(angleRotation))*velocity;
    y-=sin(radians(angleRotation))*velocity;
  }
  void isTouching(Lense lens) {
    if (lens.vert) {
      float dist;
      if (angleRotation==0 || angleRotation ==180) {
        dist = abs(x - lens.x);
        if(dist<lens.endDist+l/2) 
          lens.isDestroyed = true;
      }
      else {
        dist = abs(y - lens.y);
        if(dist<lens.l+l/2) 
          lens.isDestroyed = true;
      }
    }
    else {
      float dist;
      if (angleRotation==0 || angleRotation ==180) {
        dist = abs(x - lens.x);
        if(dist<lens.l+l/2) 
          lens.isDestroyed = true;
      }
      else {
        dist = abs(y - lens.y);
        if(dist<lens.endDist+l/2) 
          lens.isDestroyed = true;
      }
    }
  }
}