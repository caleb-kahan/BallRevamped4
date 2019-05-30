class Laser extends EnvironmentElement {
  float velocity;
  Laser(float cenX, float cenY, float angle) {
    super(cenX, cenY, 10, 90, angle);
    velocity=50;
  }
  boolean isTouching(Ball b) {
    return false;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(-angleRotation));
    rectMode(CORNER);
    fill(30, 144, 255);
    rect(0, -w/2, l, 2*w/5);
    fill(176, 219, 240);
    rect(0, -w/10, l, w/5);
    fill(30, 144, 255);
    rect(0, w/10, l, 2*w/5);
    popMatrix();
  }
  void move() {
    x+=cos(radians(angleRotation))*velocity;
    y-=sin(radians(angleRotation))*velocity;
  }
  boolean isTouching(Lense lens) {
    //If the lens is intersecting one of the circles and is inside the other or at least intersecting the other, then the ball is touching the lens.
    float [] centerAndWidthAndLength = returningCenterAndWidthAndLength();
    float rX = centerAndWidthAndLength[0];
    float rY = centerAndWidthAndLength[1];
    float rW = centerAndWidthAndLength[2];
    float rL = centerAndWidthAndLength[3];


    if (circleIntersection.rectangleInsideCircle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL) && circleIntersection.intersectsRectangle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL)) {
      return true;
    }
    if (circleIntersection.rectangleInsideCircle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL) && circleIntersection.intersectsRectangle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL)) {
      return true;
    }
    if (circleIntersection.rectangleInsideCircle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL) && circleIntersection.rectangleInsideCircle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL)) {
      return true;
    }
    if (circleIntersection.intersectsRectangle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL) && circleIntersection.intersectsRectangle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL)) {
      if (lens.vert) {
        if (y>lens.y-lens.l&& y<lens.y+lens.l) {
          return true;
        }
      } else {
        if (x>lens.x-lens.l && x<lens.x+lens.l) {
          return true;
        }
      }
    }
    return false;
  }
  float [] returningCenterAndWidthAndLength() {
    float [] returner = new float[4];
    float angle = radians(angleRotation);
    returner[0] = x+cos(angle)*l/2;
    returner[1] = y+sin(angle)*l/2;
    returner[2] = l * abs(cos(angle)) + w *abs(sin(angle));
    returner[3] = w * abs(cos(angle)) + l *abs(sin(angle));
    return returner;
  }
}
