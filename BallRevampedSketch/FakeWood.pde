public class FakeWood{
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

  FakeWood(float x, float y) {
    angle = random(TWO_PI);
    diameter = random(5, 100);
    endPoint1X = x - (diameter/2);
    endPoint2X = x + (diameter/2);
    endPoint1Y = y;
    endPoint2Y = y;

    float vertAdj1= random(10);
    float vertAdj2= random(10);
    float vertAdj3= random(10);
    float vertAdj4= random(10);
    
    point1AboveX = (endPoint1X + endPoint2X)/3;
    point1BelowX = (endPoint1X + endPoint2X)/3;
    point2AboveX = (endPoint1X + endPoint2X)*2/3;
    point2BelowX = (endPoint1X + endPoint2X)*2/3;
    
    point1AboveY = y - vertAdj1;
    point1BelowY = y + vertAdj2;
    point2AboveY = y - vertAdj3;
    point2BelowY = y + vertAdj4;   
  }
  
  
}
