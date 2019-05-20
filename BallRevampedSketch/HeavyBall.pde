class HeavyBall extends Ball {
  HeavyBall(float x, float y, float radius, float startRadius) {
    super(x, y, radius, startRadius);
    gravity = -.13;
    upIncrement = .24;
  }
  void display() {
    if (!isDead) {  
      fill(190);
      arc(this.x, this.y, this.radius*2, this.radius*2, 0, PI/2, PIE);
      arc(this.x, this.y, this.radius*2, this.radius*2, -PI/2, 0, PIE);
      arc(this.x, this.y, this.radius*2, this.radius*2, PI, 3*PI/2, PIE);
      arc(this.x, this.y, this.radius*2, this.radius*2, PI/2, PI, PIE);
      fill(0);
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}
