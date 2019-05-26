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
    pushMatrix();
    translate(x,y);
    
    
  }
  float lineGenerator (float input) {
    float altL = l/2;
    float altW =  w/2;
    return sqrt(altL*altL-(input*input*altL*altL/altW/altW));
  }
}
