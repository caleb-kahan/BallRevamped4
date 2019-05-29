class LightBall extends Ball {
  LightBall(float x,float y) {
    super(x,y,24);
    gravity = -.06;
  }
  void display() {
    if (!isDead) {
      fill(255);
      ellipse(x,y,48,48);
      noFill();
      stroke(245);
      strokeWeight(20);
      ellipse(x,y,68,68);    
      strokeWeight(1);
    }
  }
   void move() {
    if (!isDead) super.move();
  }
}
