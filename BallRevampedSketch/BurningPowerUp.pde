public class BurningPowerUp extends PowerUp {

  public class BurningDrop {
    color c;
    float x;
    float y;
    float size;
    float millisSec;
    color original;
    float velocity;
    BurningDrop(float x, float y, float size, float sec, color col) {
      c=col;
      original = col;
      this.x=x;
      this.y=y;
      this.size=size;
      millisSec = sec;
      velocity = 1;
    }
    void display() {
      noStroke();
      for (int i = 2; i < size; i++ ) {
        ellipse(x, y + i*4, i*2, i*2);
      }
    }
  }
}
