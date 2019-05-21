class HeavyBall extends Ball {
  HeavyBall(float x, float y, float radius) {
    super(x, y, radius, radius);
    gravity = -.13;
    upIncrement = .24;
  }
  void display() {
    if (!isDead) {  
      fill(175);
      arc(this.x, this.y, this.startRadius*2, this.startRadius*2, 0, PI/2, PIE);
      arc(this.x, this.y, this.startRadius*2, this.startRadius*2, -PI/2, 0, PIE);
      arc(this.x, this.y, this.startRadius*2, this.startRadius*2, PI, 3*PI/2, PIE);
      arc(this.x, this.y, this.startRadius*2, this.startRadius*2, PI/2, PI, PIE);
      fill(240);
      polygon(x,y,startRadius/3,6);
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
  void respawn() {
    ball = new NormalBall(startX, startY,25,25);
    for (PowerUp powerup : powerUps) {
      powerup.isUsed = false;
    }
  }
}
