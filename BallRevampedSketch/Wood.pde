public class Wood extends Wall{
  boolean isSawed;
  Wood(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
    isSawed=false;
  }
  void display(){
    pushMatrix();
    color from = color(245,222,179);
    color to = color(160,82,45);
    translate(x, y);
    rotate(radians(angleRotation));
    rectMode(CENTER);
    rect(0, 0, w, l);
    for (float i = -l/2;i+=l/100;i<l/2){
      
    popMatrix();
  }
}