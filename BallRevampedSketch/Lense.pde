class Lense extends EnvironmentElement {
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
    radius =200;
    angleArc = 40;
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
    float boundingAngle1A;
    float boundingAngle1B;
    float boundingAngle2A;
    float boundingAngle2B;

    if (vert) {
      boundingAngle1A = constrainAngle(angleArc/2);
      boundingAngle1B = constrainAngle(-angleArc/2);
      boundingAngle2A = constrainAngle(180-angleArc/2);
      boundingAngle2B = constrainAngle(180+angleArc/2);
    } else {
      boundingAngle1A = constrainAngle(270-angleArc/2);
      boundingAngle1B = constrainAngle(270+angleArc/2);
      boundingAngle2A = constrainAngle(90-angleArc/2);
      boundingAngle2B = constrainAngle(90+angleArc/2);
    }
    float [] interestingPoints1 = circleIntersection.circleCircleIntersects(cen1X, cen1Y, b.x, b.y, radius, b.radius);
    float [] interestingPoints2 = circleIntersection.circleCircleIntersects(cen2X, cen2Y, b.x, b.y, radius, b.radius);
    if (interestingPoints1!= null) {
      float propAngle1 = propAngle(radius, cen1X, cen1Y, interestingPoints1[0], interestingPoints1[1]);
      float propAngle2 = propAngle(radius, cen1X, cen1Y, interestingPoints1[2], interestingPoints1[3]);
      if (vert && (!(propAngle1>boundingAngle1A && propAngle1<boundingAngle1B) || ! (propAngle2>boundingAngle1A && propAngle2<boundingAngle1B)))
          return true;
      else if (! vert && (propAngle1>boundingAngle1A && propAngle1<boundingAngle1B || propAngle2>boundingAngle1A && propAngle2<boundingAngle1B))
        return true;
    }
    if (interestingPoints2!= null) {
      float propAngle1 = propAngle(radius, cen2X, cen2Y, interestingPoints2[0], interestingPoints2[1]);
      float propAngle2 = propAngle(radius, cen2X, cen2Y, interestingPoints2[2], interestingPoints2[3]);
      if (propAngle1>boundingAngle2A && propAngle1<boundingAngle2B || propAngle2>boundingAngle2A && propAngle2<boundingAngle2B)
        return true;
    }
    return false;
  }
  float constrainAngle(float angle) {
    if (angle>360) angle-=360;
    if (angle<0)angle+=360;
    return angle;
  }
  void display() {
    stroke(230);

    float input;
    if (vert) input = x;
    else input = y;

    float endDist = calculateEndDist();
    for (float n = input - endDist; n<input; n+=0.03) {
      float[] outputs = lineGenerator(n, true);
      if (vert)
        line(n, outputs[0], n, outputs[1]);
      else 
      line(outputs[0], n, outputs[1], n);
    }
    color from = color(136);
    color to = color(196);
    for (float n = input; n<input+endDist; n+=0.03) {
      float[] outputs = lineGenerator(n, false);
      stroke(lerpColor(from, to, (-input+n)/(endDist)));
      if (vert)
        line(n, outputs[0], n, outputs[1]);
      else 
      line(outputs[0], n, outputs[1], n);
    }
  }
  float[] lineGenerator (float input, boolean isCircle1) {
    if (isCircle1) {
      return circleIntersection.outputFinder(cen1X, cen1Y, radius, input, ! vert);
    }
    return circleIntersection.outputFinder(cen2X, cen2Y, radius, input, ! vert);
  }
  float calculateEndDist() {
    return radius*(1-cos(radians(angleArc/2)));
  }
  float propAngle(float radius, float cenX, float cenY, float otX, float otY) {
    float angle = atan((otY-cenY)/(otX-cenX));
    angle = degrees(angle);
    if (otX<cenX)
      angle +=180;
    if (angle<0) angle+=360;
    if (angle>360) angle-=360;
    return angle;
  }
}
