public class Wood extends Wall {
  boolean isSawed;
  Wood(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
    isSawed=false;
  }
  void display() {
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
