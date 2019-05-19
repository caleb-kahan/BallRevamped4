class NormalBall extends Ball {
  NormalBall(int x, int y) {
    super(x, y);
    radius = 25;
  }
  void display() {
    fill(51,255,102);
    arc(this.x,this.y,radius*2,radius*2,0,PI/2,PIE);
    fill(204,51,204);
    arc(this.x,this.y,radius*2,radius*2,-PI/2,0,PIE);
    fill(51,100,250);
    arc(this.x,this.y,radius*2,radius*2,PI,3*PI/2,PIE);
    fill(255,51,50);
    arc(this.x,this.y,radius*2,radius*2,PI/2,PI,PIE);
  }
  void move() {
   super.move();
  }
}
