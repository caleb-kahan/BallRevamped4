class NormalBall extends Ball {
  NormalBall(float x, float y,float radius,float startRadius) {
    super(x, y, radius,startRadius);
  }
  void display() {
    if (!isDead) {  
      fill(51,255,102);
      arc(this.x,this.y,this.radius*2,this.radius*2,0,PI/2,PIE);
      fill(204,51,204);
      arc(this.x,this.y,this.radius*2,this.radius*2,-PI/2,0,PIE);
      fill(51,100,250);
      arc(this.x,this.y,this.radius*2,this.radius*2,PI,3*PI/2,PIE);
      fill(255,51,50);
      arc(this.x,this.y,this.radius*2,this.radius*2,PI/2,PI,PIE);
    }
  }
  void move() {
   if (!isDead) super.move();
  }
}
