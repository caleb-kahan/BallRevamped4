public class Laser extends EnvironmentElement {
  float velocity;
  Laser(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
    velocity=10;
  }
  boolean isTouching(Ball b) {
    return false;
  }
}
