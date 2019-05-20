class WeightlessBallPowerUp extends PowerUp {
 WeightlessBallPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {101,255,162});
  }
  void display(){
    fill(colors[0],colors[1],colors[2]);
    stroke(colors[0]/2,colors[1]/2,colors[2]/2);
    strokeWeight(2);
    beginShape();
    vertex(x-50*12/size, y-3*50*48/(size*2));
    vertex(x+50*12/size, y-3*50*48/(size*2));
    vertex(x+50*12/size, y+50*20/size);
    vertex(x+50*55/size, y+50*20/size);
    vertex(x-50*0/size, y+5*50*48/(size*3));
    vertex(x-50*55/size, y+50*20/size);
    vertex(x-50*12/size, y+50*20/size);
    endShape(CLOSE);
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void use() {
    if (!isUsed) {
      isUsed = true;
      ball.radius = 12;
    }
  }
}
