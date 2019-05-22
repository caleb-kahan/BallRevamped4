public class Wood extends Wall{
  boolean isSawed;
  Wood(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
    isSawed=false;
  }
}