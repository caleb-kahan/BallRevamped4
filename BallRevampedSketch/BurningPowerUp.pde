public class BurningPowerUp extends PowerUp {

  public class BurningDrop {
    color c;
    float x;
    float y;
    float size;
    float millisSec;
    color original;
    float velocity;
    boolean isDead;
    BurningDrop(float x, float y, float size, color col) {
      c=col;
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
        color black = color(0, 0, 0);
        float percentage = (millis()+4000-millisSec)/4000;
        color quadCol = color(original[i][0], original[i][1], original[i][2]);
        color a = lerpColor(quadCol, black, percentage);
        colors[i][0]= (int) red(a);
        colors[i][1]= (int) green(a);
        colors[i][2]= (int) blue(a);
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
