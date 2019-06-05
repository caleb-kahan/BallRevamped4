public class FakeWood {
  float angle;
  float diameter;
  float endPoint1X;
  float endPoint2X;
  float endPoint1Y;
  float endPoint2Y;
  float point1AboveX;
  float point1AboveY;
  float point2AboveX;
  float point2AboveY;
  float point1BelowX;
  float point1BelowY;
  float point2BelowX;
  float point2BelowY;
  PShape shape;
  float x;
  float y;

  FakeWood(float x, float y) {
    this.x=x;
    this.y=y;
    angle = random(TWO_PI);
    diameter = random(20, 150);
    endPoint1X = -(diameter/2);
    endPoint2X = (diameter/2);
    endPoint1Y = 0;
    endPoint2Y = 0;

    float vertAdj1= random(1, 10);
    float vertAdj2= random(1, 10);
    float vertAdj3= random(1, 10);
    float vertAdj4= random(1, 10);

    point1AboveX = endPoint1X + (endPoint2X-endPoint1X)/3;
    point1BelowX = endPoint1X + (endPoint2X-endPoint1X)/3;
    point2AboveX = endPoint1X + (endPoint2X-endPoint1X)*2/3;
    point2BelowX = endPoint1X + (endPoint2X-endPoint1X)*2/3;

    point1AboveY = -vertAdj1;
    point1BelowY = vertAdj2;
    point2AboveY = -vertAdj3;
    point2BelowY = +vertAdj4;

    shape = createShape();
    shape.beginShape();
    shape.stroke(0);
    shape.fill(132, 99, 18);
    shape.curveVertex(endPoint1X, endPoint1Y);
    shape.curveVertex(endPoint1X, endPoint1Y);
    shape.curveVertex(point1AboveX, point1AboveY);
    shape.curveVertex(point2AboveX, point2AboveY);
    shape.curveVertex(point2AboveX, point2AboveY);
    shape.curveVertex(endPoint2X, endPoint2Y);
    shape.curveVertex(point2BelowX, point2BelowY);
    shape.curveVertex(point1BelowX, point1BelowY);
    shape.curveVertex(endPoint1X, endPoint1Y);
    shape.curveVertex(endPoint1X, endPoint1Y);
    shape.endShape();
  }
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    shape(shape, 0, 0);
    popMatrix();
  }
}
