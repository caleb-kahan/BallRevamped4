class NormalBall extends Ball {
  NormalBall(float x, float y, float radius, float startRadius) {
    super(x, y, radius, startRadius);
    gravity = 0.06;
    colors = new int[4][3];
    colors[0][0]=51;
    colors[0][1]=255;
    colors[0][2]=102;
    colors[1][0]=204;
    colors[1][1]=51;
    colors[1][2]=204;
    colors[2][0]=51;
    colors[2][1]=100;
    colors[2][2]=250;
    colors[3][0]=255;
    colors[3][1]=51;
    colors[3][2]=50;

  }
  void display() {
    if (!isDead) {  
      fill(51, 255, 102);
      arc(this.x, this.y, this.radius*2, this.radius*2, 0, PI/2, PIE);
      fill(204, 51, 204);
      arc(this.x, this.y, this.radius*2, this.radius*2, -PI/2, 0, PIE);
      fill(51, 100, 250);
      arc(this.x, this.y, this.radius*2, this.radius*2, PI, 3*PI/2, PIE);
      fill(255, 51, 50);
      arc(this.x, this.y, this.radius*2, this.radius*2, PI/2, PI, PIE);
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}
