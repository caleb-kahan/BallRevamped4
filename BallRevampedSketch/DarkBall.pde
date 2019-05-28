class DarkBall extends NormalBall {
  DarkBall(float x,float y, float radius) {
    super(x,y,radius);
  }
  void display() {
    stroke(0);
    strokeWeight(200);
    ellipse(x,y,200,200);
    super.display();
  }
}