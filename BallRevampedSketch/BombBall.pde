class BombBall extends Ball {
  int time;
  int prevTime;
  BombBall(float x, float y) {
    super(x, y, 24);
    gravity = -0.06;
    colors = new int[4][3];
    colors[0][0]=(int)(51*0.1);
    colors[0][1]=(int)(255*0.1);
    colors[0][2]=(int)(102*0.1);
    colors[1][0]=(int)(204*0.1);
    colors[1][1]=(int)(51*0.1);
    colors[1][2]=(int)(204*0.1);
    colors[2][0]=(int)(51*0.1);
    colors[2][1]=(int)(100*0.1);
    colors[2][2]=(int)(250*0.1);
    colors[3][0]=(int)(255*0.1);
    colors[3][1]=(int)(51*0.1);
    colors[3][2]=(int)(50*0.1);
    time = 5;
    prevTime = second();
  }
  void display() {
    if (!isDead) {        
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(this.x, this.y, 48, 48, 0, PI/2, PIE);
      fill(colors[1][0], colors[1][1], colors[1][2]);
      arc(this.x, this.y, 48, 48, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(this.x, this.y, 48, 48, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(this.x, this.y, 48, 48, PI/2, PI, PIE);
      fill(0);
      rectMode(CENTER);
      rect(x,y-27,15,6);
      stroke(190);
      strokeWeight(2);
      noFill();
      line(x,y-30,x,y-40);
      arc(x+5,y-40,10,10,PI,11*PI/6);
      textSize(15);
      fill(255);
      text(""+time,x-4,y+4);
      strokeWeight(1);
      if (second() != prevTime) {
        prevTime = second();
        time--;
      }
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}
