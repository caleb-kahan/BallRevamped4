abstract class EnvironmentElement{
  float x;
  float y;
  int width;
  int height;
  float angleRotation;
  
  EnvironmentElement(float cenX, float cenY, int wid, int heigh, float angle){
    x = cenX;
    y = cenY;
    width = wid;
    height = heigh;
    angleRotation = angle;
  }
  abstract boolean isTouching(Ball b);
  abstract void display();
}
