class RazorPowerUp extends PowerUp {
  RazorPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {148,136,250});
  }
  void display(){
    fill(220);
    for (float i = 0;i < 2*PI;i+=PI/4) {
      arc(x+(1500/size)*cos(i),y+(1500/size)*sin(i),2700/size,2700/size,i,7*PI/8+i,CHORD);
    }
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
      ball = new RazorBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}
