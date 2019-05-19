class Wall extends EnvironmentElement {
  Wall(float cenX, float cenY, int wid, int heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
  }
  boolean isTouching(Ball b) {
    //Stack-Overflow Code- Works for non-oblique rectangles.
    //If the center is on  the left side on the rectangle and above, the closest point is the upper left vertex.
    //Same with right and above, right and below, and left and below.
    //All these cases are containied with the constrained.
    //However, when the center is between the two sides of the rectangle, the circle will simply be perpindicularly above it,
    //and the closest point will share a coordinate with the circle.
    /*
    float closestX = constrain(b.x, x-width/2.0, x+width/2.0);
    float closestY = constrain(b.y, y+height/2.0, y-height/2.0);

    float distanceSq = sq(b.x-closestX) +sq(b.y-closestY);
    return distanceSq < sq(b.radius);
    */
    //Works for Oblique rectangles
    float newBallX = b.x-x;
    float newBallY = b.y-y;
    float angle = atan(newBallY/newBallX);
    if(newBallX<0) angle+=PI;
    float distance= sqrt(sq(newBallX)+sq(newBallY));
    float subAngle = radians(angleRotation);
    newBallX= distance*(cos(angle)*cos(subAngle) - sin(angle)*sin(subAngle));
    newBallY = distance*(sin(angle)*cos(subAngle) + cos(angle)*sin(subAngle));
    
    float closestX = constrain(newBallX, -w/2.0, w/2.0);
    float closestY = constrain(newBallY, -l/2.0, l/2.0);

    float distanceSq = sq(newBallX-closestX) +sq(newBallY-closestY);
    return distanceSq < sq(b.radius);
    
  }
  void display() {
    pushMatrix();
    fill(0);
    translate(x, y);
    rotate(radians(angleRotation));
    rectMode(CENTER);
    rect(0, 0, w, l);
    popMatrix();
  }
}