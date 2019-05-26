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
  }
  void display() {
    for (Dot dot : dots) {
      dot.display();
    }
    if (isActivated) {
      if (millis() - time == 10 && currentDot < dots.size()) {
        time = millis();
        dots.get(currentDot).light();
        currentDot++;
      }
    }
  }
}
class Dot {
  float x;
  float y;
  boolean isLit;
  Dot (float x,float y) {
    this.x = x;
    this.y = y;
  }
  void light() {
    isLit = true;
  }
  void reset() {
    isLit = false;
  }
  void display() {
    fill(130);
    noStroke();
    ellipse(x,y,7,7);
    stroke(0);
  }
}
