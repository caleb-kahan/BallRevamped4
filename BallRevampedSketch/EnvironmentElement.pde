abstract class EnvironmentElement{
  float x;
  float y;
  float w;
  float l;
  float angleRotation;
  
  EnvironmentElement(float cenX, float cenY, float wid, float heigh, float angle){
    x = cenX;
    y = cenY;
    w = wid;
    l = heigh;
    angleRotation = angle;
  }
  abstract boolean isTouching(Ball b);
  abstract void display();
}

class Laser extends EnvironmentElement {
  float velocity;
  Laser(float cenX, float cenY, float angle) {
    super(cenX, cenY, 10, 50, angle);
    velocity=10;
  }
  boolean isTouching(Ball b) {
    return false;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(angleRotation));
    rectMode(CORNER);
    fill(30, 144, 255);
    rect(-w/2, l, 2*w/5, l);
    fill(176, 219, 240);
    rect(-w/10, l, w/5, l);
    fill(30, 144, 255);
    rect(2/10, l, 2*w/5, l);
    popMatrix();
  }
  void move() {
    x+=cos(radians(angleRotation))*velocity;
    y+=sin(radians(angleRotation))*velocity;
  }
}



class Portal extends EnvironmentElement {
  Portal(float cenX, float cenY) {
    super(cenX, cenY, 50, 50, 0);
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
    fill(100,150,250);
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
    if(newBallX<0) angle+=PI;
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
      }
      else {
        for (float i = -w/2, j=0; i<w/2; i+=w/200, j+=0.005) {
          color lerp = lerpColor(from, to, j);
          stroke(lerp);
          line(-l/2, i, l/2, i);
        }
      }
      popMatrix();
    }
  }
  Ball explode(Ball ball) {
    if (ball instanceof BombBall && ((BombBall)ball).time < 0) {
      float newBallX = ball.x-x;
      float newBallY = ball.y-y;
      float angle = atan(newBallY/newBallX);
      if(newBallX<0) angle+=PI;
      float distance= sqrt(sq(newBallX)+sq(newBallY));
      float subAngle = radians(angleRotation);
      newBallX= distance*(cos(angle)*cos(subAngle) + sin(angle)*sin(subAngle));
      newBallY = distance*(sin(angle)*cos(subAngle) - cos(angle)*sin(subAngle));      
      float closestX = constrain(newBallX, -w/2.0, w/2.0);
      float closestY = constrain(newBallY, -l/2.0, l/2.0); 
      float distanceSq = sq(newBallX-closestX) +sq(newBallY-closestY);  
      if (distanceSq < sq(3*ball.radius)) {
        isDestroyed = true;
      }
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new NormalBall(ball.x, ball.y,24);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
  void explode(Fuse fuse) {
    if (fuse.currentDot == fuse.dots.size()) {
      isDestroyed = true;
    }
  }
  
}

class Fuse extends EnvironmentElement{
  ArrayList<Dot> dots;
  float[] points;
  boolean isActivated;
  int currentDot;
  int time;
  Fuse(float[] points) {
    super(0,0,0,0,0);
    dots = new ArrayList<Dot>();
    for (int i = 0;i < points.length-2;i+=2) {
      if ((int)points[i] == (int)points[i+2]) {
        float direction = 1;
        if (points[i+1] > points[i+3]) {
          direction = -1;
        }
        for (float y = points[i+1];abs(y - points[i+3]) >= 6;y += 11*direction) {
          dots.add(new Dot(points[i],y));
        }
      }
      else {
        float direction = 1;
        if (points[i] > points[i+2]) {
          direction = -1;
        }
        for (float x = points[i];abs(x - points[i+2]) >= 6;x += 11*direction) {
          dots.add(new Dot(x,points[i+1]));
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
      if (millis() - time > 60 && currentDot < dots.size()) {
        time = millis();
        dots.get(currentDot).light();
        currentDot++;
      }
    }
  }
}

class Dot extends EnvironmentElement{
  boolean isLit;
  Dot (float x,float y) {
    super(x,y,7,7,0);
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
      ellipse(x,y,w,l);
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
  boolean isDead;
  float cen1X;
  float cen2X;
  float cen1Y;
  float cen2Y;
  boolean vert;

  Lense(float x, float y, boolean vert) {
    super(x, y, 0, 0, 0);
    radius =200;
    angleArc = 40;
    isDead =false;
    this.vert = vert;
    float endDist = calculateEndDist();
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
    stroke(230);

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
    color from = color(136);
    color to = color(196);
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
    return radius*(1-cos(radians(angleArc/2)));
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
