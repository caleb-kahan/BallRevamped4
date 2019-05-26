class Fuse {
  ArrayList<Dot> dots;
  float[] points;
  Fuse(float[] points) {
    for (int i = 0;i < points.length-2;i+=2) {
      if ((int)points[i] == (int)points[i+2]) {
        float direction = 1;
        if (points[i+1] > points[i+3]) {
          direction = -1;
        }
        for (float y = points[i+1];y - points[i+3] >= 3;y += 5*direction) {
          dots.add(new Dot(points[i],[points[y]);
        }
      }
      else {
        
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
}
