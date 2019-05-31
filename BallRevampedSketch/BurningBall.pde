class BurningBall extends NormalBall {
  int startSec;
  int endSec;
  float divisor = 0.25;
  BurningBall(float x, float y) {
    super(x, y, 24);
    startSec = second();
    endSec = (startSec+4)%60;
  }
  void dying() { 
    for (int i = 0; i<colors.length; i++) {
      float secondsLeft = (endSec+60-second())%60;
      color a = color(colors[i][0], colors[i][1], colors[i][2]);
      color black = color(0, 0, 0);
      a = lerpColor(a, black, divisor);
      colors[i][0]= (int)red(a);
      colors[i][0]= (int)green(a);
      colors[i][0]= (int)blue(a);
    }
    divisor+=0.25;
    if(endSec == second()) isDead = true;
  }
  void display(){
    super.display();
    dying();
  }
}