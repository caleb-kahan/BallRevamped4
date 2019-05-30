class BurningBall extends NormalBall {
  float endSec;
  BurningBall(float x, float y) {
    super(x, y, 24);
    endSec = (second()+8)%60;
  }
  
}