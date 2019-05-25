class RazorBall extends Ball {
  RazorBall(float x, float y) {
    super(x, y, 24);
    gravity = -0.06;
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
      fill(220);
      for (float i = 0;i < 2*PI;i+=PI/6) {
        arc(x+18*cos(i),y+18*sin(i),22,22,-PI/10+i,2*PI/3+i,CHORD);
      }
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(x, y, this.radius*2, this.radius*2, 0, PI/2, PIE);
      fill(colors[1][0],colors[1][1], colors[1][2]);
      arc(x, y, this.radius*2, this.radius*2, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(x, y, this.radius*2, this.radius*2, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(x, y, this.radius*2, this.radius*2, PI/2, PI, PIE);
      
      
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}
