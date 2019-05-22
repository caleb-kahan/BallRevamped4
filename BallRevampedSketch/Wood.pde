public class Wood extends Wall{
  boolean isSawed;
  Wood(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
    isSawed=false;
  }
  void display(){
    pushMatrix();
    fill(0);
    translate(x, y);
    rotate(radians(angleRotation));
    rectMode(CENTER);
    rect(0, 0, w, l);
    popMatrix();
  }
}