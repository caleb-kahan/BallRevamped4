public class BurningPowerUp extends PowerUp {
  float ellipseVelocity;
  float ellipseWidth;
  float ellipseHeight;
  BurningDrop [] drops;
  int dropIndex;

  BurningPowerUp(float x, float y, float elWid, float elHei) {
    super(x, y, 20, new int[]{244, 216, 160});
    ellipseVelocity = 2;
    drops = new BurningDrop[50];
    dropIndex = 0;
    ellipseWidth = elWid;
    ellipseHeight = elHei;
  }
  void display() {

    super.display();
    if (millis()%3==1) {
    }
  }
  void generateDrops() {
    if (dropIndex>=drops.length-1)
      dropIndex = 0;
    float time = millis();
    float newX = ellipseWidth*(cos(ellipseVelocity*time));
    float newY = ellipseHeight*(sin(ellipseVelocity*time));
    color yellow = color(255, 0, 0);
    color red = color(255, 0, 0);
    drops[dropIndex++] = new BurningDrop(newX, newY, 3, lerpColor(yellow, red, random(1)));
    newX = ellipseWidth*(cos(ellipseVelocity*time+PI));
    newY = ellipseHeight*(sin(ellipseVelocity*time+PI));
    drops[dropIndex++] = new BurningDrop(newX, newY, 3, lerpColor(yellow, red, random(1)));
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new BurningBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }


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
