class BurningBall extends NormalBall {
  float endSec;
  BurningBall(float x, float y) {
    super(x, y, 24);
    endSec = (second()+8)%60;
  }
  void dying() { 
    for (int i = 0; i<colors.length; i++) {
      float secondsLeft = (endSec+60-second())%60;
      color a = color(colors[i][0], colors[i][1], colors[i][2]);
      color black = color(0, 0, 0);
      a = lerpColor(a, black, secondsLeft);
      colors[i]=a;
    }
  }
}