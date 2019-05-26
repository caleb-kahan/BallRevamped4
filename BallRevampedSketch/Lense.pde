public class Lense extends EnvironmentElement {
  float radius;
  boolean isDead;

  Lense(float x, float y, float w, float l) {
    super(x, y, w, l, 0);
    radius =50;
    isDead =false;
  }
  boolean isTouching(Ball b) {
    return true;
  }
  void display() {
  }
}
