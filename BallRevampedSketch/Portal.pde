public class Portal extends EnvironmentElement {
  Portal(float cenX, float cenY, float wid, float heigh, float angle) {
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
    float sinDist = sqrt(sq(w-10)+sq(l-10))/2;
    for (float x =-sinDist; x<sinDist; x+=0.25) {
      point(x, 10*cos(x/25));
    }
    for (float y =-sinDist; y<sinDist; y+=0.25) {
      point(10*sin(y/25), y);
    }
    rotate(radians(-angleRotation));
    stroke(153, 50, 204);
    fill(153, 50, 204);
    rect(w/2-2.5, 0, 5, l);
    rect(-w/2+2.5, 0, 5, l);
    rect(0, l/2-2.5, w, 5);
    rect(0, -l/2+2.5, w, 5);
    fill(255);
    popMatrix();
    angleRotation++;
  }
}
