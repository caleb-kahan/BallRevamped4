class WeightlessBallPowerUp extends PowerUp {
  int [][] spots;
 WeightlessBallPowerUp(float x,float y,float size, int [][] spots) {
    super(x,y,size,new int[] {101,255,162});
    this.spots=spots;
  }
  void display(){
   stroke(192,192,192);
   fill(0);
   circle(x,y,size);
   
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void use() {
    if (!isUsed) {
      isUsed = true;
      ball = new WeightlessBall(ball.x,ball.y,ball.radius,ball.startRadius);
    }
  }
}
