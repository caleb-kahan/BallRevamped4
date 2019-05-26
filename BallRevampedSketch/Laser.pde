public class Laser extends EnvironmentElement {
  float velocity;
  Laser(float cenX, float cenY, float angle) {
    super(cenX, cenY, 10, 50, angle);
    velocity=10;
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
    y+=sin(radians(angleRotation))*velocity;
  }
}
