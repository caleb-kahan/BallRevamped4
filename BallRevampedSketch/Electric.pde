class ForceField extends Wall {
  boolean isDeactivated;
  float yPos;
  ForceField (float x,float y,float len) {
    super(x,y,len,30,0);
  }
  void display() {
    if (!isDeactivated) {  
      fill(96,209,243);
      noStroke();
      for (float xcoor = x - w/2;xcoor < x+w/2;xcoor++) {
        ellipse(xcoor, y+12*cos(yPos),3,3);
        yPos+=6;
      }
    }
    fill(153,0,76);
    stroke(0);
    polygon(x-w/2,y,16,5);
    polygon(x+w/2,y,16,5);
  }
}
