class BurningBall extends NormalBall {
  float millisSec;
  float [][] original;
  BurningBall(float x, float y) {
    super(x, y, 24);
    millisSec = millis()+4000;
    original = new float[4][3];
    for (int i = 0; i<colors.length; i++) {
      for (int j =0; j<colors[0].length; j++) {
        original[i][j] = colors[i][j];
      }
    }
  }
  void dying() { 
    for (int i = 0; i<colors.length; i++) {
      color black = color(0, 0, 0);
      float percentage = (millis()+4000-millisSec)/4000;
      color quadCol = color(original[i][0],original[i][1],original[i][2]);
      color a = lerpColor(quadCol, black, percentage);
      colors[i][0]= (int) red(a);
      colors[i][1]= (int) green(a);
      colors[i][2]= (int) blue(a);
    }
    if (millis()>millisSec) isDead = true;
  }
  void display() {
    super.display();
    dying();
  }
}
