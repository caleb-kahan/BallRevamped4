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
    translate(x, y);
    stroke(232);
    for (float n = -w/2; n<-w/6; n+=0.03) {
      float output = lineGenerator(n);
      line(n, output, n, -1*output);
    }
    color from = color(136);
    color to = color(196);
    for (float n = -w/6; n<w/2; n+=0.03) {
      float output = lineGenerator(n);
      stroke(lerpColor(from,to,(w/6+n)/(2*w/3)));
      line(n, output, n, -1*output);
    }
    popMatrix();
  }
  float lineGenerator (float input) {
    float altL = l/2;
    float altW =  w/2;
    return sqrt(altL*altL-(input*input*altL*altL/altW/altW));
  }
}
