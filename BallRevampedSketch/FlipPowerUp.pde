class FlipPowerUp extends PowerUp {
  FlipPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {250,250,150});
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void display() {
    noFill();
    stroke(180);
    strokeWeight(2);
    ellipse(x,y,10000/size,10000/size);
    strokeWeight(1);
    fill(255,215,0);
    triangle(x+11.5,y-5, x+26.5,y-5,x+19,y+8.2);
    super.display();
  }
  Level use(Level level, Ball ball) {
    if (!isUsed) {
      isUsed = true;
      //ball.x = 450 - ball.x;
      //ball.y = 600 - ball.y;
      level.isFlipped = !level.isFlipped;
    }
    return level;
  }
  Ball use(Ball ball) {
    return ball;
  }
}
