class BurningBall extends NormalBall {
  float endSec;
  BurningBall(float x, float y) {
    super(x, y, 24);
    endSec = (second()+8)%60;
  }
  void dying() {
    fill(0);
    for (int i = 0; i<colors.length; i++) {
      for (int j = 0; j<colors[0].length; j++) {
        colors[i][j] = 0;
      }
    }
  }
}
