class Laser extends EnvironmentElement {
  float velocity;
  Laser(float cenX, float cenY, float angle) {
    super(cenX, cenY, 10, 90, angle);
    velocity=50;
  }
  boolean isTouching(Ball b) {
    return false;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(-angleRotation));
    rectMode(CORNER);
    fill(30, 144, 255);
    rect(0, -w/2, l, 2*w/5);
    fill(176, 219, 240);
    rect(0, -w/10, l, w/5);
    fill(30, 144, 255);
    rect(0, w/10, l, 2*w/5);
    popMatrix();
  }
  void move() {
    x+=cos(radians(angleRotation))*velocity;
    y-=sin(radians(angleRotation))*velocity;
  }
  boolean isTouching(Lense lens) {
    //If the lens is intersecting one of the circles and is inside the other or at least intersecting the other, then the ball is touching the lens.
    if(circleIntersection.rectangleInsideCircle(lens.cen1X, lens.cen1Y, lens.radius,x,y+l/2,w,l) && circleIntersection.intersectsRectangle(lens.cen2X, lens.cen2Y, lens.radius,x,y+l/2,l,w)){
      return true;
    }
    if(circleIntersection.rectangleInsideCircle(lens.cen2X, lens.cen2Y, lens.radius,x,y+l/2,w,l) && circleIntersection.intersectsRectangle(lens.cen1X, lens.cen1Y, lens.radius,x,y+l/2,l,w)){
      return true;
    }
    if(circleIntersection.rectangleInsideCircle(lens.cen1X, lens.cen1Y, lens.radius,x,y+l/2,w,l) && circleIntersection.rectangleInsideCircle(lens.cen2X, lens.cen2Y, lens.radius,x,y+l/2,l,w)){
      return true;
    }
    return false;
    
    /*
    if (lens.vert) {
      float dist;
      if (angleRotation==0 || angleRotation ==180) {
        dist = abs(x - lens.x);
        if(dist<lens.endDist+l/2) 
          lens.isDestroyed = true;
      }
      else {
        dist = abs(y - lens.y);
        if(dist<lens.l+l/2) 
          lens.isDestroyed = true;
      }
    }
    else {
      float dist;
      if (angleRotation==0 || angleRotation ==180) {
        dist = abs(x - lens.x);
        if(dist<lens.l+l/2) 
          lens.isDestroyed = true;
      }
      else {
        dist = abs(y - lens.y);
        if(dist<lens.endDist+l/2) 
          lens.isDestroyed = true;
      }
    }*/
  }
  float [] returningCenterAndWidthAndLength(){
    float [] returner = new float[4];
    float angle = radians(angleRotation);
    if(angleRotation==0){
      returner[0] = x+l/2;
      returner[1] = y;
      returner[2] = l * abs(cos(angle)) + w *abs(sin(angle));
      returner[3] = w * abs(cos(angle)) + l *abs(sin(angle));
    }
    if(angleRotation==180){
      returner[0] = x+l/2;
      returner[1] = y;
      returner[2] = l;
      returner[3] = w;
    }
    if(angleRotation==0){
      returner[0] = x+l/2;
      returner[1] = y;
      returner[2] = l;
      returner[3] = w;
    }
    if(angleRotation==0){
      returner[0] = x+l/2;
      returner[1] = y;
      returner[2] = l;
      returner[3] = w;
    }
  }
}
