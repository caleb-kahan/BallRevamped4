class BigPowerUp extends PowerUp {
  BigPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {101,255,162});
  }
  void display(){
    fill(starColors[0],starColors[1],starColors[2]);
    stroke(starColors[0]/2,starColors[1]/2,starColors[2]/2);
    strokeWeight(2);
    beginShape();
    vertex(x-50*12/size, y+3*50*48/(size*2));
    vertex(x+50*12/size, y+3*50*48/(size*2));
    vertex(x+50*12/size, y-50*20/size);
    vertex(x+50*55/size, y-50*20/size);
    vertex(x-50*0/size, y-5*50*48/(size*3));
    vertex(x-50*55/size, y-50*20/size);
    vertex(x-50*12/size, y-50*20/size);
    endShape(CLOSE);
    super.display();
    fill(0);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void use() {
    if (!isUsed) {
      isUsed = true;
      if(! (ball instanceof NormalBall)) {
        float xVel = ball.xSpeed;
        float yVel = ball.ySpeed;
        ball = new NormalBall(x,y,48,ball.startRadius);
        ball.xSpeed = xVel;
        ball.ySpeed = yVel;
      }
      else ball.radius = 48;
    }
  }
}
