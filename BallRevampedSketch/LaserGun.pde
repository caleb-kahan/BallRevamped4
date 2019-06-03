public class LaserGun extends EnvironmentElement {
  int nextShot;
  Laser l;
  Ball b;
  boolean shootingMode;
  LaserGun(float cenX, float cenY, float angle) {
    super(cenX, cenY, 0, 0, 0);
  }
  void display() {


    fill(135);
    circle(x, y, 60);
    PShape s = drawShape();
    shape(s, x, y);
    s.rotate(radians(120));
    shape(s, x, y);
    s.rotate(radians(120));
    shape(s, x, y);
    stroke(20);
    fill(190);
    arc(x, y, 25, 25, PI/2, 3*PI/2);
    rectMode(CENTER);
    rect(x+25, y, 50, 25);
    stroke(190);
    line(x, y-12.5, x, y+12.5);
  }
  boolean isTouching(Ball ball) {
    return false;
  }
  PShape drawShape() {
    noFill();
    PShape bigArc = createShape(ARC, 0, 0, 60, 60, radians(150), PI*3/2);
    PShape line1 = createShape(LINE, 0, 0, 0, -5);
    PShape line2 = createShape(LINE, 0, -25, 0, -30);
    PShape line3 = createShape(LINE, 0, 0, 5*-cos(PI/6), 5*sin(PI/6));
    PShape line4 = createShape(LINE, 25*-cos(PI/6), 25*sin(PI/6), 30*-cos(PI/6), 30*sin(PI/6));
    PShape smallArc1 = createShape(ARC, 0, -15, 20, 20, PI/2, PI*3/2);
    PShape smallArc2 = createShape(ARC, 15*-cos(PI/6), 15*sin(PI/6), 20, 20, radians(150), radians(330));
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
}
