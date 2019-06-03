public class LaserGun extends EnvironmentElement {
  float coolDown;
  color [] originalColors;
  float bigDiam;
  float actualBigDiam;
  Laser las;
  Ball b;
  boolean shootingMode;
  LaserGun(float cenX, float cenY, float angle, Ball b, float bigDiam, color [] original ) {
    super(cenX, cenY, 0, 0, 0);
    this.b = b;
    coolDown = 200;
    this.bigDiam = bigDiam;
    shootingMode = false;
    originalColors = original;
  }
  void display() {
    color actualColor1;
    color actualColor2;
    if (! shootingMode){
      setAngle();
      actualColor1 = originalColors[0];
      actualColor2 = originalColors[1];
      actualBigDiam = bigDiam;
    }
    else{
      float progress = (50-coolDown)/50;
      color white = color(255);
      actualColor1 = lerpColor(originalColors[0],white,progress);
      actualColor2 = lerpColor(originalColors[0],white,progress);
      actualBigDiam = bigDiam*pow(1.005,progress*50);
    } 
      
    pushMatrix();
    translate(x, y);
    rotate(angleRotation);
    stroke(20);
    fill(actualColor1);
    stroke(0);
    circle(0, 0, actualBigDiam);
    pushMatrix();
    rotate(35);
    PShape s = drawShape();
    shape(s, 0, 0);
    s.rotate(radians(120));
    shape(s, 0, 0);
    s.rotate(radians(120));
    shape(s, 0, 0);
    popMatrix();
    fill(actualColor2);
    float smallDiam = actualBigDiam*5.0/12;
    arc(0, 0, smallDiam, smallDiam, PI/2, 3*PI/2);
    rectMode(CENTER);
    rect(smallDiam, 0, smallDiam*2, smallDiam);
    stroke(actualColor2);
    line(0, -smallDiam/2, 0, smallDiam/2);
    popMatrix();

    shootBeam();
    if (las!= null) {
      las.display();
      las.move();
    }
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
  PShape drawShape() {
    float smallDiam = actualBigDiam*5.0/12;
    noFill();
    PShape bigArc = createShape(ARC, 0, 0, actualBigDiam, actualBigDiam, radians(150), PI*3/2);
    PShape line1 = createShape(LINE, 0, 0, 0, -smallDiam/5);
    PShape line2 = createShape(LINE, 0, -smallDiam, 0, -actualBigDiam/2);
    PShape line3 = createShape(LINE, 0, 0, smallDiam/5*-cos(PI/6), smallDiam/5*sin(PI/6));
    PShape line4 = createShape(LINE, smallDiam*-cos(PI/6), smallDiam*sin(PI/6), smallDiam*-cos(PI/6), smallDiam*sin(PI/6));
    PShape smallArc1 = createShape(ARC, 0, actualBigDiam/-4, actualBigDiam/3, actualBigDiam/3, PI/2, PI*3/2);
    PShape smallArc2 = createShape(ARC, actualBigDiam/4*-cos(PI/6), actualBigDiam/4*sin(PI/6), actualBigDiam/3, actualBigDiam/3, radians(150), radians(330));
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
    coolDown=200;
    shootingMode = false;
  }
  void shootBeam() {
    if (coolDown<50) {
      shootingMode = true;
    }
    if (coolDown<1) {
      float r = 10*actualBigDiam/12;
      las = new Laser(x+r*cos(angleRotation), y+r*sin(angleRotation), degrees(-angleRotation), 10, 800, color(244, 66, 131));
      coolDown = 200;
      shootingMode = false;
    }
    coolDown--;
  }
}
