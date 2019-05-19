abstract class PowerUp {
  float size;
  float x;
  float y;
  int[] colors;
  boolean isUsed;
  PowerUp(float x,float y,float size,int[] colors) {
    this.colors = colors;
    this.size = 50*50/size;
    this.x = x;
    this.y = y;
    isUsed = false;
  }
  void display() {
    background(255);
    fill(colors[0],colors[1],colors[2]);
    stroke(colors[0]/2,colors[1]/2,colors[2]/2);
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
  }
  boolean isTouching(Ball b) {
    return (sqrt(sq(x - b.x)+sq(y - b.y)) < 50*50/size + b.radius);
  }
  abstract void use();
}
