class Dot {
  float x;
  float y;
  boolean isLit;
  Dot (float x,float y) {
    this.x = x;
    this.y = y;
  }
  void light() {
    isLit = true;
  }
  void reset() {
    isLit = false;
  }
  void display() {
    fill(130);
    noStroke();
    ellipse(x,y,7,7);
    stroke(0);
  }
}
