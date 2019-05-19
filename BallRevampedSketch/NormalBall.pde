class NormalBall extends Ball {
  NormalBall(int x, int y,int diameter) {
    super(x, y, diameter);
  }
  void display() {
    fill(51,255,102);
    arc(this.x,this.y,this.diameter,this.diameter,0,PI/2,PIE);
    fill(204,51,204);
    arc(this.x,this.y,this.diameter,this.diameter,-PI/2,0,PIE);
    fill(51,100,250);
    arc(this.x,this.y,this.diameter,this.diameter,PI,3*PI/2,PIE);
    fill(255,51,50);
    arc(this.x,this.y,this.diameter,this.diameter,PI/2,PI,PIE);
  }
  void move() {
   super.move();
  }
}
