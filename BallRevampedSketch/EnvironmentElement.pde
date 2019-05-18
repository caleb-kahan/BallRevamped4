abstract class EnvironmentElement{
  float x;
  float y;
  int width;
  int height;
  
  abstract boolean isTouching(Ball b);
  abstract void display();
}
