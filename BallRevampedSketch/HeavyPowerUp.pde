class HeavyPowerUp extends PowerUp {
  HeavyPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {28, 255, 226});
  }
  void display() {
    super.display();
    fill(175);
    ellipse(x,y,2500/size,2500/size);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void use() {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
<<<<<<< HEAD
      ball = new HeavyBall(ball.x, ball.y, 48,48);
=======
      ball = new HeavyBall(ball.x, ball.y, ball.startRadius);
>>>>>>> help
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
  }
}
