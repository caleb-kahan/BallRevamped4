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
    rect(0, 0, w, l);
    popMatrix();
  }
}
