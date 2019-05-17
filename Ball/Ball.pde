Public abstract class Ball {
  private float x;
  private float y;
  private float xSpeed;
  private float ySpeed;
  private boolean isDead;

  Ball(int x, int y) {
    this.x = x; 
    this.y=y;
    xSpeed = 0;
    ySpeed = 0
    isDead = false;
  }
