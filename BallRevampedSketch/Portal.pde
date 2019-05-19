public class Portal extends EnvironmentElement {
  Portal(float cenX, float cenY, int wid, int heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
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
    fill(75, 0, 130);
    rect(0, 0, w-10, l-10);
    rotate(radians(angleRotation));
    stroke(0, 255, 255);
    float sineDist = sqrt(sq(w-10)+sq(l-10))/2;
    for (float x =-sinDist; x<sinDist; x+=0.25) {
      point(x, 10*cos(x/25));
    }
    for (float y =-sinDist; y<sinDist; y+=0.25) {
      point(10*sin(y/25), y);
    }
    rotate(radians(-angleRotation));
    fill(153, 50, 204);
    for (float y = 0; y>=-5; y-=0.5) {
      line(-110, y-90, 110, y-90);
    }
    for (float y = 0; y<=20; y+=0.5) {
      line(-110, y+90, 110, y+90);
    }
    for (float x = 0; x>=-20; x-=0.5) {
      line(x-90, -110, x-90, 110);
    }
    for (float x = 0; x<=20; x+=0.5) {
      line(x+90, -110, x+90, 110);
    }
    fill(255);

    for (float y = -20; y>=-40; y-=0.5) {
      line(-110, y-90, 110, y-90);
    }
    for (float y = 20; y<=40; y+=0.5) {
      line(-110, y+90, 110, y+90);
    }
    for (float x = -20; x>=-40; x-=0.5) {
      line(x-90, -110, x-90, 110);
    }
    for (float x = 20; x<=40; x+=0.5) {
      line(x+90, -110, x+90, 110);
    }
    popMatrix();
    angleRotation++;
  }
 
