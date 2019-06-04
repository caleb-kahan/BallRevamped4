public class FakeWood extends EnvironmentElement {
  float randomAngle;
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

  FakeWood(float x, float y) {
    super(x,y,0,0,random(TWO_PI));
    diameter = random(5, 100);
    endPoint1X = x - (diameter*cos(randomAngle)/2);
    endPoint2X = x + (diameter*cos(randomAngle)/2);
    endPoint1Y = y - (diameter*sin(randomAngle)/2);
    endPoint2Y = y + (diameter*sin(randomAngle)/2);

    float vertAdj1, vertAdj2, vertAdj3, vertAdj4 = random(10);
    
  }
}
