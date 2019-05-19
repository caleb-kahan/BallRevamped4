class SmallPowerUp extends PowerUp {
  SmallPowerUp(float x,float y,float size,int[] colors) {
    super(x,y,size,colors);
  }
  void display(){
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void use(Ball b) {
    if (!this.isUsed) {
      b = new NormalBall(startX,startY,10);
    }
  }
}
