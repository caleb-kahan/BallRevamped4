public class FakeWood extends EnvironmentElement{
  float randomAngle;
  float diameter;
  float point1AboveX;
  float point1AboveY;
  float point2AboveX;
  float point2AboveY;
  float point1BelowX;
  float point1BelowY;
  float point2BelowX;
  float point2BelowY;
  
  FakeWood(float x, float y){
    float randomAngle = random(TWO_PI);
    float diameter = random(5,100);
    
  }
