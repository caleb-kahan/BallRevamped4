class WeightlessPowerUp extends PowerUp {
  float[][] spots;
  WeightlessPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {160, 160, 160});
    float radius = (4*50*50/this.size);
    for (int i=0; i<20; i++) {
      spots = new float[20][2];
      float a = random(-radius, radius);
      float b = random(-radius, radius);
      spots[i][0]=a;
      spots[i][1]=b;
    }
  }
  void display() {
    stroke(192, 192, 192);
    fill(0);
    float radius = (50*50/size)*4;
    ellipse(x, y, radius, radius);
    fill(120);
    stroke(120);
    for (int i=0; i<20; i++) {
     
      ellipse(x+spots[i][0], y+spots[i][1], 2, 2);
    }
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void use() {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new WeightlessBall(ball.x, ball.y, 24);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
  }
}