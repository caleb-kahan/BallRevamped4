public class Lense extends EnvironmentElement {
  float radius;
  float angleArc;
  boolean isDead;
  float cen1X;
  float cen2X;
  float cen1Y;
  float cen2Y;
  boolean vert;

  Lense(float x, float y, boolean vert) {
    super(x, y, 0, 0, 0);
    radius =50;
    angleArc = 20;
    isDead =false;
    this.vert = vert;
    float endDist = calculateEndDist();
    if (vert) {
      cen1X = x-endDist+radius;
      cen2X = x+endDist-radius;
      cen1Y = y;
      cen2Y = y;
    } else {
      cen1Y = y-endDist+radius;
      cen2Y = y+endDist-radius;
      cen1X = x;
      cen2X = x;
    }
  }
  boolean isTouching(Ball b) {
    float [] interestingPoints = circleIntersection.circleCircleIntersects(x, y, b.x, b.y, radius, b.radius);
    if (interestingPoints==null) return false;

    return true;
  }
  void display() {
    stroke(232);
    
    float input;
    if (vert) input = x;
    else input = y;
    
    float endDist = calculateEndDist();
    for (float n = input - endDist; n<input; n+=0.03) {
      float[] outputs = lineGenerator(n, true);
      line(n, outputs[0], n, outputs[1]);
    }
    color from = color(136);
    color to = color(196);
    for (float n = input; n<input+endDist; n+=0.03) {
      float[] outputs = lineGenerator(n, false);
      stroke(lerpColor(from, to, (w/6+n)/(2*w/3)));
      line(n, outputs[0], n, outputs[1]);
    }
  }
  float[] lineGenerator (float input, boolean isCircle1) {
    if (isCircle1) {
      return circleIntersection.outputFinder(cen1X, cen1Y, radius, input, ! vert);
    }
    return circleIntersection.outputFinder(cen1Y, cen2Y, radius, input, ! vert);
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
