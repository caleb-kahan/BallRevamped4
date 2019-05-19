abstract class EnvironmentElement{
  float x;
  float y;
  float w;
  float l;
  float angleRotation;
  
  EnvironmentElement(float cenX, float cenY, float wid, float heigh, float angle){
    x = cenX;
    y = cenY;
    w = wid;
    l = heigh;
    angleRotation = angle;
  }
  abstract boolean isTouching(Ball b);
  abstract void display();
}
