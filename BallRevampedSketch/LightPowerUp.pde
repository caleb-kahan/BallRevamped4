class LightPowerUp extends PowerUp {
  LightPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {255,255,255});
  }
  void display(){
    fill(starColors[0],starColors[1],starColors[2]);
    super.display();
    fill(0);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new LightBall(x,y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}
