public class BurningPowerUp extends PowerUp {

  public class BurningDrop {
    float x;
    float y;
    float size;
    float millisSec;
    color original;
    float velocity;
    boolean isDead;
    BurningDrop(float x, float y, float size, color col) {
      original = col;
      this.x=x;
      this.y=y;
      this.size=size;
      millisSec = millis()+2000;
      velocity = 1;
      isDead = false;
    }
    void display() {
      if (! isDead) {
        color blackGround = g.backgroundColor;
        float percentage = (millis()+2000-millisSec)/4000;
        color a = lerpColor(original, blackGround, percentage);
        fill(a);
        noStroke();
        for (int i = 2; i < size; i++ ) {
          ellipse(x, y + i*4, i*2, i*2);
        }
      }
    }
    void move() {
      if (! isDead) {
        y-=velocity;
        if (millis()>millisSec) isDead = true;
      }
    }
  }
}
