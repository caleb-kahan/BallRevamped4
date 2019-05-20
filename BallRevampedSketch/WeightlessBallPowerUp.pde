class WeightlessBallPowerUp extends PowerUp {
  float[][] spots;
  WeightlessBallPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {160, 160, 160});
    float radius = (50*50/size)*1.1;
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
    for (int i=0; i<20; i++) {
      fill(76.5);
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
      ball = new WeightlessBall(ball.x, ball.y, ball.radius, ball.startRadius);
    }
  }
}
