class LaserPowerUp extends PowerUp {
  LaserPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {127, 255, 0});
  }
  void display() {
    color from = color(28);
    color to = color(242);
    float l = 5000/size+8;
    float w = l/3;
    for (float a = -w/2; a<w/4; a+=0.03) {
      color lerp = lerpColor(from, to, (a+w/2)/(3*w/4));
      stroke(lerp);
      line(x+a, y-l/2, x+a, y+l/2);
      line(x-l/2, y+a, x+l/2, y+a);
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
