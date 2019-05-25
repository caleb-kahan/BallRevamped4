abstract class PowerUp {
  float size;
  float x;
  float y;
  int[] starColors;
  boolean isUsed;
  PowerUp(float x,float y,float size,int[] starColors) {
    this.starColors = starColors;
    this.size = 50*50/size;
    this.x = x;
    this.y = y;
    isUsed = false;
  }
  void display() {
    fill(starColors[0],starColors[1],starColors[2]);
    stroke(starColors[0]/2,starColors[1]/2,starColors[2]/2);
    strokeWeight(2);
    beginShape();
    vertex(x+50*0/size, y-50*48/size);
    vertex(x+50*12/size, y-50*15/size);
    vertex(x+50*47/size, y-50*15/size);
    vertex(x+50*23/size, y+50*7/size);
    vertex(x+50*32/size, y+50*40/size);
    vertex(x+50*0/size, y+50*20/size);
    vertex(x-50*32/size, y+50*40/size);
    vertex(x-50*23/size, y+50*7/size);
    vertex(x-50*47/size, y-50*15/size);
    vertex(x-50*12/size, y-50*15/size);
    endShape(CLOSE);
    stroke(0);
    strokeWeight(1);
    fill(0);
  }
  boolean isTouching(Ball b) {
    return (sqrt(sq(x - b.x)+sq(y - b.y)) < 50*50/size + b.radius);
  }
  abstract Ball use(Ball ball);
}
