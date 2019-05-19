abstract class EnvironmentElement{
  float x;
  float y;
  int w;
  int l;
  float angleRotation;
  
  EnvironmentElement(float cenX, float cenY, int wid, int heigh, float angle){
    x = cenX;
    y = cenY;
    w = wid;
    l = heigh;
    angleRotation = angle;
  }
  abstract boolean isTouching(Ball b);
  abstract void display();
}
