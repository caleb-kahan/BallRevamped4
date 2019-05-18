class NormalBall extends Ball {
  NormalBall(int x, int y) {
    super(x, y);
  }
  void display() {
    stroke(255);
    fill(51, 255, 102);
    arc(this.x, this.y-10, this.x+10, this.y, PI/2, 0);
    fill(204, 51, 204);
    arc(this.x+10, this.y, this.x, this.y+10, 0, -PI/2);
    fill(51, 0, 153);
    arc(this.x, this.y+10, this.x-10, this.y, 3*PI/2, PI);
    fill(255, 51, 102);
    arc(this.x-10, this.y, this.x, this.y-10, PI, PI/2);
    fill(255);
  }
  void move() {
   super.move();
  }
}
