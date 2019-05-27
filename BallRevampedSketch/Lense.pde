public class Lense extends EnvironmentElement {
  float radius;
  float angleArc;
  boolean isDead;
  float cen1X;
  float cen2X;
  float cen1Y;
  float cen2Y;
  boolean vert;

  Lense(float x, float y) {
    super(x, y, 0, 0, 0);
    radius =50;
    angleArc = 20;
    isDead =false;
    float endDist = calculateEndDist();
    float cen1X = 
  }
  boolean isTouching(Ball b) {
    float cenX1 = x-w/2+radius;
    float cenX2 = x+w/2-radius;
    float cenY1 = 
    float cenY2 =
    float [] interestingPoints = circleIntersection.circleCircleIntersects(x,y,b.x,b.y,radius,b.radius);
    if(interestingPoints==null) return false;
    
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
      stroke(lerpColor(from, to, (w/6+n)/(2*w/3)));
      line(n, output, n, -1*output);
    }
    popMatrix();
  }
  float lineGenerator (float input) {
    return sqrt(radius*radius-(input*input));
  }
  float calculateEndDist() {
    return radius*(1-cos(radians(angleArc/2)));
  }
  float propAngle(float radius, float cenX, float cenY, float otX, float otY) {
    float angle = atan((otY-cenY)/(otX-cenX));
    if (otX<cenX)
      angle +=PI;
    return radians(angle);
  }
  
}
