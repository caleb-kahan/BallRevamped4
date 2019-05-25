class LaserBall extends Ball {
  LaserBall(float x, float y) {
    super(x, y, 24);
    gravity = -.06;
    radius = 24;
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
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(this.x, this.y, this.radius*2, this.radius*2, 0, PI/2, PIE);
      fill(colors[1][0], colors[1][1], colors[1][2]);
      arc(this.x, this.y, this.radius*2, this.radius*2, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(this.x, this.y, this.radius*2, this.radius*2, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(this.x, this.y, this.radius*2, this.radius*2, PI/2, PI, PIE);

      //Here comes special cylinders;
      color from = color(28);
      color to = color(242);
      for (float a = -6; a<3; a+=0.03) {
        color lerp = lerpColor(from, to, (a+6)/9);
        stroke(lerp);
        line(x+a, y-18, x+a, y+18);
        line(x-18, y+a, x+18, y+a);
      }
      for (float a = 3; a<6; a+=0.03) {
        color lerp = lerpColor(to, from, (a-3)/9);
        stroke(lerp);
        line(x+a, y-18, x+a, y+18);
        line(x-18, y+a, x+18, y+a);
      }
    }
  }
  void shootBeam() {
  }
  void move() {
    if (!isDead) super.move();
  }
}
