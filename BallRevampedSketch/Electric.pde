class ForceField extends Wall {
  boolean isDeactivated;
  float yPos;
  ForceField (float x,float y,float len) {
    super(x,y,len,30,0);
  }
  void display() {
    fill(96,209,243);
    noStroke();
    for (float xcoor = x - w/2;xcoor < x+w/2;xcoor++) {
      ellipse(xcoor, y+12*cos(yPos),3,3);
      yPos+=6;
    }
    fill(153,0,76);
    stroke(0);
    polygon(x-w/2,y,16,5);
    polygon(x+w/2,y,16,5);
  }
  void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
