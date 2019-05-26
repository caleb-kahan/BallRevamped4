class LaserPowerUp extends PowerUp {
  LaserPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {127, 255, 0});
  }
  void display() {
    color from = color(28);
    color to = color(242);
    for (float a = -4; a<2; a+=0.03) {
      color lerp = lerpColor(from, to, (a+4)/6);
      stroke(lerp);
      line(x+a, y-12, x+a, y+12);
      line(x-12, y+a, x+12, y+a);
    }
    for (float a = 2; a<4; a+=0.03) {
      color lerp = lerpColor(to, from, (a-2)/6);
      stroke(lerp);
      line(x+a, y-12, x+a, y+12);
      line(x-12, y+a, x+12, y+a);
    }
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
      ball = new LaserBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}
