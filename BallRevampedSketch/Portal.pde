public class Portal extends EnvironmentElement {
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
