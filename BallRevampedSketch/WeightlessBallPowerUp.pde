class WeightlessBallPowerUp extends PowerUp {
  int [][] spots;
 WeightlessBallPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {101,255,162});
    
  }
  void display(){
   stroke(192,192,192);
   fill(0);
   circle(x,y,(50*50/size)*1.1);
   
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
