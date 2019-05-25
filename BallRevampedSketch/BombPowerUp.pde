class BombPowerUp extends PowerUp {
  BombPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {172, 152, 228});
  }
  void display() {
    fill(0);
    float radius = (50*50/size)*5;
    ellipse(x, y, 2*radius/3, 2*radius/3);
    fill(0);
    rectMode(CENTER);
    rect(x,y-18.7,10,4);
    stroke(190);
    strokeWeight(2);
    line(x,y-20.7,x,y-30);
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new BombBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}
