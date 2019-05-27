class Stick extends Wall{
  int passesLeft;
  boolean ballTouched;
  boolean ballAbove;
  Stick(float x,float y,float len) {
    super(x,y,len,8,0);
    passesLeft = 5;
    ballAbove = true;
  }
  void display() {
    fill(235,167,51);
    super.display();
    fill(153,0,76);
    stroke(0);
    polygon(x-w/2,y,16,5);
    textSize(12);
    fill(255);
    text(""+passesLeft,x-w/2-4,y+4);
    
    if (passesLeft == 0) {
      fill(0,0,255);
      arrow(x,y+40,40,0);
    }
    else if (passesLeft % 2 == 1) {
      fill(101,255,162);
      arrow(x,y-30,20,0);
    }
    else {
      fill(101,255,162);
      arrow(x,y+30,20,180);
    }
  }
}
