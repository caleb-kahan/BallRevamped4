class HeavyBall extends Ball {
  HeavyBall(float x, float y) {
    super(x, y, 24);
    gravity = -.13;
    upIncrement = .24;
  }
  void display() {
    if (!isDead) {  
      fill(175);
      arc(this.x, this.y, 48, 48, 0, PI/2, PIE);
      arc(this.x, this.y, 48, 48, -PI/2, 0, PIE);
      arc(this.x, this.y, 48, 48, PI, 3*PI/2, PIE);
      arc(this.x, this.y, 48, 48, PI/2, PI, PIE);
      fill(240);
      polygon(x,y,24/3,6);
      fill(0);
    }
  }
  /*Regular Polygon code from processing website
   */
  void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
  void move() {
    if (!isDead) super.move();
  }
}
