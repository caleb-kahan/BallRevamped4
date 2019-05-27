public class Lense extends EnvironmentElement {
  float radius;
  float angleArc;
  boolean isDead;

  Lense(float x, float y) {
    super(x, y, 0, 0, 0);
    radius =50;
    angleArc = 20;
    isDead =false;
    calculateWidth();
  }
  boolean isTouching(Ball b) {
    
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
    return sqrt(radius*radius-(input*input));
  }
  void calculateWidth(){
    w = 2 * radius*(1-cos(radians(angleArc/2)));
  }
}
