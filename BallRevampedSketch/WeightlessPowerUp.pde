class WeightlessPowerUp extends PowerUp {
  float[][] spots;
  WeightlessPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {160, 160, 160});
    float radius = (4*50*50/this.size);
    spots = new float[40][2];
    for (int i=0; i<40; i++) {
      float a = random(radius-20);
      float b = random(2*PI);
      spots[i][0]=a;
      spots[i][1]=b;
    }
  }
  void display() {
    stroke(192, 192, 192);
    fill(0);
    float radius = (50*50/size)*4;
    ellipse(x, y, radius, radius);
    fill(0);
    stroke(120);
    for (int i=0; i<40; i++) {
     
      ellipse(x+spots[i][0]*cos(spots[i][1]), y+spots[i][0]*sin(spots[i][1]), 4, 4);
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