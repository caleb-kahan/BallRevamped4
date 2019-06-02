public class LaserGun extends EnvironmentElement {
  int nextShot;
  Laser l;
  Ball b;
  boolean shootingMode;
  LaserGun() {
    super(0,0,0,0,0);
  }
  void display() {
    float [][] circle1;
    float [][] circle2;
    float [][] circle3;
    float radius = sqrt(12);
    float distSmall = radius*(tan(degrees(30)));
    float distBig = radius*(cos(degrees(30)));
    
    
    float c1X = x;
    float c1Y = y;
  }
  boolean isTouching(Ball ball) {
    return false;
  }
}
