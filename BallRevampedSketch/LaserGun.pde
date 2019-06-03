public class LaserGun extends EnvironmentElement {
  int nextShot;
  Laser l;
  Ball b;
  boolean shootingMode;
  LaserGun(float cenX, float cenY, float angle, Ball b) {
    super(cenX, cenY, 0, 0, 0);
    this.b = b;
  }
  void display() {
    setAngle();
    pushMatrix();
    translate(x, y);
    rotate(angleRotation);
    fill(135);
    float bigDiam=40;
    circle(0, 0, bigDiam);
    PShape s = drawShape(bigDiam);
    shape(s, 0, 0);
    s.rotate(radians(120));
    shape(s, 0, 0);
    s.rotate(radians(120));
    shape(s, 0, 0);
    stroke(20);
    fill(190);
    float smallDiam = bigDiam*5.0/12;
    arc(0, 0, smallDiam, smallDiam, PI/2, 3*PI/2);
    rectMode(CENTER);
    rect(smallDiam, 0, smallDiam*2, smallDiam);
    stroke(190);
    line(0, -smallDiam/2, 0, smallDiam/2);
    popMatrix();
  }
  boolean isTouching(Ball ball) {
    return false;
  }
  void setAngle() {
    if (b!=null) {
      float angle = atan((b.y-y)/(b.x-x));
      if (b.x-x<0)
        angle+=PI;
      angleRotation= angle;
    }
  }
  PShape drawShape(float bigDiam) {
    float smallDiam = bigDiam*5.0/12;
    noFill();
    PShape bigArc = createShape(ARC, 0, 0, bigDiam, bigDiam, radians(150), PI*3/2);
    PShape line1 = createShape(LINE, 0, 0, 0, -smallDiam/5);
    PShape line2 = createShape(LINE, 0, -smallDiam, 0, -bigDiam/2);
    PShape line3 = createShape(LINE, 0, 0, smallDiam/5*-cos(PI/6), smallDiam/5*sin(PI/6));
    PShape line4 = createShape(LINE, smallDiam*-cos(PI/6), smallDiam*sin(PI/6), smallDiam*-cos(PI/6), smallDiam*sin(PI/6));
    PShape smallArc1 = createShape(ARC, 0, bigDiam/-4, bigDiam/3, bigDiam/3, PI/2, PI*3/2);
    PShape smallArc2 = createShape(ARC, bigDiam/4*-cos(PI/6), bigDiam/4*sin(PI/6), bigDiam/3, bigDiam/3, radians(150), radians(330));
    PShape alien = createShape(GROUP);
    alien.addChild(bigArc);
    alien.addChild(line1);
    alien.addChild(line2);
    alien.addChild(line3);
    alien.addChild(line4);
    alien.addChild(smallArc1);
    alien.addChild(smallArc2);
    return alien;
  }
  void reset(Ball b) {
    this.b = b;
  }
}
