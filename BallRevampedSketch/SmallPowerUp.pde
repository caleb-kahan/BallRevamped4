class SmallPowerUp extends PowerUp {
  SmallPowerUp(float x,float y,float size,int[] colors) {
    super(x,y,size,colors);
  }
  void display(){
    super.display();
    text(""+isUsed,10,400);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void use() {
    if (!isUsed) {
      isUsed = true;
      ball.radius = 12;
    }
  }
}
