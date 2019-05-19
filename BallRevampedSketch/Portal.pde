public class Portal extends EnvironmentElement {
  Portal(float cenX, float cenY, int wid, int heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
  }
  boolean isTouching(Ball b) {
    float closestX = constrain(b.x, x-width/2.0, x+width/2.0);
    float closestY = constrain(b.y, y-height/2.0, y+height/2.0);

    float distanceSq = sq(b.x-closestX) +sq(b.y-closestY);
    return distanceSq < sq(b.radius);
  }
  void display() {
    pushMatrix();
    translate(500, 500);

    fill(75, 0, 130);
    rect(0, 0, 180, 180);
    rotate(radians(angle));
    stroke(0, 255, 255);
    for (float x =-40*PI; x<40*PI; x+=0.25) {
      point(x, 10*cos(x/25));
    }
    for (float y =-40*PI; y<40*PI; y+=0.25) {
      point(10*sin(y/25), y);
    }
    rotate(radians(-angle));
    stroke(153, 50, 204);
    for (float y = 0; y>=-20; y-=0.5) {
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
    stroke(255);

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
    angle++;
  }
}
