class Wall extends EnvironmentElement {
  boolean isTouching(Ball b) {
    //Stack-Overflow Code
    //If the center is on  the left side on the rectangle and above, the closest point is the upper left vertex.
    //Same with right and above, right and below, and left and below.
    //All these cases are containied with the constrained.
    //However, when the center is between the two sides of the rectangle, the circle will simply be perpindicularly above it,
    //and the closest point will share a coordinate with the circle.

    float closestX = constrain(b.x, x-width/2.0, x+width/2.0);
    float closestY = constrain(b.y, y+height/2.0, y-height/2.0);

    float distanceSq = sq(b.x-closestX) +sq(b.y-closestY);
    return distanceSq < sq(b.radius);
  }
  void display() {
    pushMatrix();
    fill(0); // white square
    translate(x, y);
    rotate(radians(angleRotation));
    rect(x, y, width, height);
    popMatrix();
  }
}
