public class BurningPowerUp extends PowerUp {
  public class BurningDrop {
    color c;
    float x;
    float y;
    float size;
    BurningDrop(color c, float x, float y, float size) {
      this.c=c;
      this.x=x;
      this.y=y;
      this.size=size;
    }
    void display() {
      noStroke();
      for (int i = 2; i < size; i++ ) {
        ellipse(x, y + i*4, i*2, i*2);
      }
    }
  }
}
