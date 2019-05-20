class WeightlessBall extends Ball {
  float spots [][];
  WeightlessBall(float x, float y, float radius, float startRadius) {
    super(x, y, radius, startRadius);
    spots = new float[20][2]; 
    gravity = 0;
    colors = new int[4][3];
    colors[0][0]=(int)(51*0.3);
    colors[0][1]=(int)(255*0.3);
    colors[0][2]=(int)(102*0.3);
    colors[1][0]=(int)(204*0.3);
    colors[1][1]=(int)(51*0.3);
    colors[1][2]=(int)(204*0.3);
    colors[2][0]=(int)(51*0.3);
    colors[2][1]=(int)(100*0.3);
    colors[2][2]=(int)(250*0.3);
    colors[3][0]=(int)(255*0.3);
    colors[3][1]=(int)(51*0.3);
    colors[3][2]=(int)(50*0.3);
    for (int i=0; i<10; i++) {
      float a = random(-radius, radius);
      float b = random(-radius, radius);
      spots[i][0]=a;
      spots[i][1]=b;
    }
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
      for (int i=0; i<10; i++) {
        fill(76.5);
        ellipse(x+spots[i][0], y+spots[i][1], 3, 3);
      }
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}