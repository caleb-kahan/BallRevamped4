abstract class EnvironmentElement {
  float x;
  float y;
  float w;
  float l;
  float angleRotation;

  EnvironmentElement(float cenX, float cenY, float wid, float heigh, float angle) {
    x = cenX;
    y = cenY;
    w = wid;
    l = heigh;
    angleRotation = angle;
  }
  abstract boolean isTouching(Ball b);
  abstract void display();
}





class Portal extends EnvironmentElement {
  boolean isFake;
  Portal(float cenX, float cenY, boolean fake) {
    super(cenX, cenY, 63, 63, 0);
    isFake = fake;
  }
  boolean isTouching(Ball b) {
    float closestX = constrain(b.x, x-w/2.0, x+w/2.0);
    float closestY = constrain(b.y, y-l/2.0, y+l/2.0);

    float distanceSq = sq(b.x-closestX) +sq(b.y-closestY);
    return distanceSq < sq(b.radius);
  }
  void display() {
    pushMatrix();
    translate(x, y);
    fill(78, 130, 222);
    rect(0, 0, w-10, l-10);
    rotate(radians(angleRotation));
    stroke(0);
    line(-w/2+6, l/2-6, w/2-6, -l/2+6);
    line(-w/2+6, -l/2+6, w/2-6, l/2-6);
    rotate(radians(-angleRotation));
    fill(100, 150, 250);
    rect(w/2-2.5, 0, 5, l);
    rect(-w/2+2.5, 0, 5, l);
    rect(0, l/2-2.5, w, 5);
    rect(0, -l/2+2.5, w, 5);
    fill(255);
    popMatrix();
    angleRotation+=5;
  }
}

class Wall extends EnvironmentElement {
  Wall(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
  }
  boolean isTouching(Ball b) {
    /*Stack-Overflow Code- Works for non-oblique rectangles.
     *If the center is on  the left side on the rectangle and above, the closest point is the upper left vertex.
     *Same with right and above, right and below, and left and below.
     *All these cases are containied with the constrained.
     *However, when the center is between the two sides of the rectangle, the circle will simply be perpindicularly above it,
     *and the closest point will share a coordinate with the circle.
     *Works for Oblique rectangles
     */
    float newBallX = b.x-x;
    float newBallY = b.y-y;
    float angle = atan(newBallY/newBallX);
    if (newBallX<0) angle+=PI;
    float distance= sqrt(sq(newBallX)+sq(newBallY));
    float subAngle = radians(angleRotation);
    newBallX= distance*(cos(angle)*cos(subAngle) + sin(angle)*sin(subAngle));
    newBallY = distance*(sin(angle)*cos(subAngle) - cos(angle)*sin(subAngle));

    float closestX = constrain(newBallX, -w/2.0, w/2.0);
    float closestY = constrain(newBallY, -l/2.0, l/2.0);

    float distanceSq = sq(newBallX-closestX) +sq(newBallY-closestY);

    return distanceSq < sq(b.radius);
  }
  void display() {
    pushMatrix();
    stroke(70);
    translate(x, y);
    rotate(radians(angleRotation));
    rectMode(CENTER);
    rect(0, 0, w, l);
    popMatrix();
  }
}

public class Wood extends Wall {
  boolean isDestroyed;
  FakeWood [] components;
  Wood(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
    isDestroyed=false;
  }
  void display() {
    if (!isDestroyed) {
      pushMatrix();
      color from = color(245, 222, 179);
      color to = color(160, 82, 45);
      translate(x, y);
      rotate(radians(angleRotation));  
      if (w>l) {
        for (float i = -l/2, j=0; i<l/2; i+=l/200, j+=0.005) {
          color lerp = lerpColor(from, to, j);
          stroke(lerp);
          line(-w/2, i, w/2, i);
        }
      } else {
        for (float i = -w/2, j=0; i<w/2; i+=w/200, j+=0.005) {
          color lerp = lerpColor(from, to, j);
          stroke(lerp);
          line(-l/2, i, l/2, i);
        }
      }
      popMatrix();
    } else {
      for (FakeWood woodie : components) {
        woodie.display();
        woodie.move();
      }
    }
  }
  Ball explode(Ball ball) {
    if (ball instanceof BombBall && ((BombBall)ball).time < 0) {
      float newBallX = ball.x-x;
      float newBallY = ball.y-y;
      float angle = atan(newBallY/newBallX);
      if (newBallX<0) angle+=PI;
      float distance= sqrt(sq(newBallX)+sq(newBallY));
      float subAngle = radians(angleRotation);
      newBallX= distance*(cos(angle)*cos(subAngle) + sin(angle)*sin(subAngle));
      newBallY = distance*(sin(angle)*cos(subAngle) - cos(angle)*sin(subAngle));      
      float closestX = constrain(newBallX, -w/2.0, w/2.0);
      float closestY = constrain(newBallY, -l/2.0, l/2.0); 
      float distanceSq = sq(newBallX-closestX) +sq(newBallY-closestY);  
      if (distanceSq < sq(3*ball.radius)) {
        isDestroyed = true;
        components = new FakeWood[30];
        for (int i = 0; i<components.length; i++) {
          components[i] = new FakeWood(x, y);
        }
      }
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new NormalBall(ball.x, ball.y, 24);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
  void explode(Fuse fuse) {
    if (isDestroyed == false && fuse.currentDot == fuse.dots.size()) {
      isDestroyed = true;
      components = new FakeWood[30];
      for (int i = 0; i<components.length; i++) {
        components[i] = new FakeWood(x, y);
      }
    }
  }
}

class Fuse extends EnvironmentElement {
  ArrayList<Dot> dots;
  float[] points;
  boolean isActivated;
  int currentDot;
  int time;
  Fuse(float[] points) {
    super(0, 0, 0, 0, 0);
    dots = new ArrayList<Dot>();
    for (int i = 0; i < points.length-2; i+=2) {
      if ((int)points[i] == (int)points[i+2]) {
        float direction = 1;
        if (points[i+1] > points[i+3]) {
          direction = -1;
        }
        for (float y = points[i+1]; abs(y - points[i+3]) >= 6; y += 11*direction) {
          dots.add(new Dot(points[i], y));
        }
      } else {
        float direction = 1;
        if (points[i] > points[i+2]) {
          direction = -1;
        }
        for (float x = points[i]; abs(x - points[i+2]) >= 6; x += 11*direction) {
          dots.add(new Dot(x, points[i+1]));
        }
      }
    }
    currentDot = 0;
    time = millis();
  }
  boolean isTouching(Ball b) {
    return false;
  }
  void reset() {
    for (Dot dot : dots) {
      dot.reset();
    }
    currentDot = 0;
    isActivated = false;
  }
  void display() {
    for (Dot dot : dots) {
      dot.display();
    }
    if (isActivated) {
      if (millis() - time > 100 && currentDot < dots.size()) {
        time = millis();
        dots.get(currentDot).light();
        currentDot++;
      }
    }
  }
}

class Dot extends EnvironmentElement {
  boolean isLit;
  Dot (float x, float y) {
    super(x, y, 7, 7, 0);
  }
  void light() {
    isLit = true;
  }
  void reset() {
    isLit = false;
  }
  void display() {
    if (!isLit) {
      fill(130);
      noStroke();
      ellipse(x, y, w, l);
      stroke(0);
    }
  }
  boolean isTouching(Ball b) {
    return false;
  }
}
class Lense extends EnvironmentElement {
  float radius;
  float angleArc;
  float endDist;
  boolean isDead;
  float cen1X;
  float cen2X;
  float cen1Y;
  float cen2Y;
  boolean vert;
  boolean isDestroyed;

  Lense(float x, float y, boolean vert) {
    super(x, y, 0, 0, 0);
    radius =200;
    angleArc = 40;
    isDead =false;
    this.vert = vert;
    endDist = calculateEndDist();
    isDestroyed = false;

    if (vert) {
      cen1X = x-endDist+radius;
      cen2X = x+endDist-radius;
      cen1Y = y;
      cen2Y = y;
    } else {
      cen1Y = y-endDist+radius;
      cen2Y = y+endDist-radius;
      cen1X = x;
      cen2X = x;
    }
  }
  boolean isTouching(Ball b) {
    if (isDestroyed) return false;
    float boundingAngle1A;
    float boundingAngle1B;
    float boundingAngle2A;
    float boundingAngle2B;

    if (vert) {
      boundingAngle1A = constrainAngle(180-angleArc/2);
      boundingAngle1B = constrainAngle(180+angleArc/2);
      boundingAngle2A = constrainAngle(angleArc/2);
      boundingAngle2B = constrainAngle(-angleArc/2);
    } else {
      boundingAngle1A = constrainAngle(270-angleArc/2);
      boundingAngle1B = constrainAngle(270+angleArc/2);
      boundingAngle2A = constrainAngle(90-angleArc/2);
      boundingAngle2B = constrainAngle(90+angleArc/2);
    }
    float [] interestingPoints1 = circleIntersection.circleCircleIntersects(cen1X, cen1Y, b.x, b.y, radius, b.radius);
    float [] interestingPoints2 = circleIntersection.circleCircleIntersects(cen2X, cen2Y, b.x, b.y, radius, b.radius);
    if (interestingPoints1!= null) {
      float propAngle1 = propAngle(radius, cen1X, cen1Y, interestingPoints1[0], interestingPoints1[1]);
      float propAngle2 = propAngle(radius, cen1X, cen1Y, interestingPoints1[2], interestingPoints1[3]);
      if ((propAngle1>boundingAngle1A && propAngle1<boundingAngle1B || propAngle2>boundingAngle1A && propAngle2<boundingAngle1B))
        return true;
    }
    if (interestingPoints2!= null) {
      float propAngle1 = propAngle(radius, cen2X, cen2Y, interestingPoints2[0], interestingPoints2[1]);
      float propAngle2 = propAngle(radius, cen2X, cen2Y, interestingPoints2[2], interestingPoints2[3]);
      if (vert && (!(propAngle1>boundingAngle2A && propAngle1<boundingAngle2B) || !(propAngle2>boundingAngle2A && propAngle2<boundingAngle2B)))
        return true;
      else if (! vert && (propAngle1>boundingAngle2A && propAngle1<boundingAngle2B || propAngle2>boundingAngle2A && propAngle2<boundingAngle2B))
        return true;
    }
    return false;
  }
  float constrainAngle(float angle) {
    if (angle>360) angle-=360;
    if (angle<0)angle+=360;
    return angle;
  }
  void display() {
    if (isDestroyed) return;
    stroke(235);
    float input;
    if (vert) input = x;
    else input = y;

    float endDist = calculateEndDist();
    for (float n = input - endDist; n<input; n+=0.03) {
      float[] outputs = lineGenerator(n, true);
      if (vert)
        line(n, outputs[0], n, outputs[1]);
      else 
      line(outputs[0], n, outputs[1], n);
    }
    color from = color(117);
    color to = color(186);
    for (float n = input; n<input+endDist; n+=0.03) {
      float[] outputs = lineGenerator(n, false);
      stroke(lerpColor(from, to, (-input+n)/(endDist)));
      if (vert)
        line(n, outputs[0], n, outputs[1]);
      else 
      line(outputs[0], n, outputs[1], n);
    }
  }
  float[] lineGenerator (float input, boolean isCircle1) {
    if (isCircle1) {
      return circleIntersection.outputFinder(cen1X, cen1Y, radius, input, ! vert);
    }
    return circleIntersection.outputFinder(cen2X, cen2Y, radius, input, ! vert);
  }
  float calculateEndDist() {
    float endDist = radius*(1-cos(radians(angleArc/2)));
    l = sqrt(2*endDist*radius-endDist*endDist);
    return endDist;
  }
  float propAngle(float radius, float cenX, float cenY, float otX, float otY) {
    float angle = atan((otY-cenY)/(otX-cenX));
    angle = degrees(angle);
    if (otX<cenX)
      angle +=180;
    if (angle<0) angle+=360;
    if (angle>360) angle-=360;
    return angle;
  }
}

class ForceField extends Wall {
  boolean isDeactivated;
  float yPos;
  ForceField (float x, float y, float len) {
    super(x, y, len, 30, 0);
  }
  void display() {
    if (!isDeactivated) {  
      fill(96, 209, 243);
      noStroke();
      for (float xcoor = x - w/2; xcoor < x+w/2; xcoor++) {
        ellipse(xcoor, y+12*cos(yPos), 3, 3);
        yPos+=6;
      }
    }
    fill(153, 0, 76);
    stroke(0);
    polygon(x-w/2, y, 16, 5);
    polygon(x+w/2, y, 16, 5);
  }
}

class Stick extends Wall {
  int passesLeft;
  boolean ballTouched;
  boolean ballAbove;
  Stick(float x, float y, float len) {
    super(x, y, len, 8, 0);
    passesLeft = 5;
    ballAbove = true;
  }
  void display() {
    fill(235, 167, 51);
    super.display();
    fill(153, 0, 76);
    stroke(0);
    polygon(x-w/2, y, 16, 5);
    textSize(12);
    fill(255);
    text(""+passesLeft, x-w/2-4, y+4);

    if (passesLeft == 0) {
      fill(0, 0, 255);
      arrow(x, y+40, 40, 0);
    } else if (passesLeft % 2 == 1) {
      fill(101, 255, 162);
      arrow(x, y-30, 20, 0);
    } else {
      fill(101, 255, 162);
      arrow(x, y+30, 20, 180);
    }
  }
}

class Spikes extends Wall {
  float spikeLevel;
  float spikeSpeed;
  Spikes() {
    super(225, 2.5, 450, 5, 0);
    spikeLevel = -10;
    spikeSpeed = .01;
  }
  void display() {
    fill(0);
    stroke(0);
    if (spikeLevel > 21) {
      rect(x, (spikeLevel-21)/2, w, spikeLevel-21);
    }
    fill(50);
    rect(x, spikeLevel-21, w, 14);
    fill(110);
    rect(x, spikeLevel-7, w, 14);
    fill(160);
    for (float x = 0; x < 450; x+=19.5) {
      triangle(x, spikeLevel, x+19.5, spikeLevel, x+9.75, spikeLevel+25);
    }
  }
  void reset() {
    spikeLevel = -10;
    spikeSpeed = .01;
    l = 15;
  }
}
class Laser extends EnvironmentElement {
  float velocity;
  color c;
  Laser(float cenX, float cenY, float angle, float w, float l, color c) {
    super(cenX, cenY, w, l, angle);
    velocity=50;
    this.c=c;
  }
  boolean isTouching(Ball b) {
    float [] importantData  = returningCenterAndWidthAndLength(true);
    float newBallX = b.x-importantData[0];
    float newBallY = b.y-importantData[1];
    float angle = atan(newBallY/newBallX);
    if (newBallX<0) angle+=PI;
    float distance= sqrt(sq(newBallX)+sq(newBallY));
    float subAngle = radians(-angleRotation);
    newBallX= distance*(cos(angle)*cos(subAngle) + sin(angle)*sin(subAngle));
    newBallY = distance*(sin(angle)*cos(subAngle) - cos(angle)*sin(subAngle));

    float closestX = constrain(newBallX, -l/2.0, l/2.0);
    float closestY = constrain(newBallY, -w/2.0, w/2.0);

    float distanceSq = sq(newBallX-closestX) +sq(newBallY-closestY);

    return distanceSq < sq(b.radius);
  }
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(-angleRotation));
    rectMode(CORNER);
    fill(c);
    rect(0, -w/2, l, 2*w/5);
    fill(176, 219, 240);
    rect(0, -w/10, l, w/5);
    fill(c);
    rect(0, w/10, l, 2*w/5);
    translate(-x, -y);
    popMatrix();
    rectMode(CENTER);
  }
  void move() {
    x+=cos(radians(angleRotation))*velocity;
    y-=sin(radians(angleRotation))*velocity;
  }
  boolean isTouching(Lense lens) {
    //If the lens is intersecting one of the circles and is inside the other or at least intersecting the other, then the ball is touching the lens.
    float [] centerAndWidthAndLength = returningCenterAndWidthAndLength(false);
    float rX = centerAndWidthAndLength[0];
    float rY = centerAndWidthAndLength[1];
    float rW = centerAndWidthAndLength[2];
    float rL = centerAndWidthAndLength[3];


    if (circleIntersection.rectangleInsideCircle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL) && circleIntersection.intersectsRectangle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL)) {
      return true;
    }
    if (circleIntersection.rectangleInsideCircle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL) && circleIntersection.intersectsRectangle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL)) {
      return true;
    }
    if (circleIntersection.rectangleInsideCircle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL) && circleIntersection.rectangleInsideCircle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL)) {
      return true;
    }
    if (circleIntersection.intersectsRectangle(lens.cen1X, lens.cen1Y, lens.radius, rX, rY, rW, rL) && circleIntersection.intersectsRectangle(lens.cen2X, lens.cen2Y, lens.radius, rX, rY, rW, rL)) {
      if (lens.vert) {
        if (y>lens.y-lens.l&& y<lens.y+lens.l) {
          return true;
        }
      } else {
        if (x>lens.x-lens.l && x<lens.x+lens.l) {
          return true;
        }
      }
    }
    return false;
  }
  float [] returningCenterAndWidthAndLength(boolean flipped) {
    float [] returner = new float[4];
    float temp = flipped? -1: 1;
    float angle = radians(angleRotation*temp);
    returner[0] = x+cos(angle)*l/2;
    returner[1] = y+sin(angle)*l/2;
    returner[2] = l * abs(cos(angle)) + w *abs(sin(angle));
    returner[3] = w * abs(cos(angle)) + l *abs(sin(angle));
    return returner;
  }
}
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
    if (! shootingMode) {
      setAngle();
      actualColor1 = originalColors[0];
      actualColor2 = originalColors[1];
      actualBigDiam = bigDiam;
    } else {
      float progress = (50-coolDown)/50;
      color white = color(255);
      actualColor1 = lerpColor(originalColors[0], white, progress);
      actualColor2 = lerpColor(originalColors[0], white, progress);
      actualBigDiam = bigDiam*pow(1.005, progress*50);
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
