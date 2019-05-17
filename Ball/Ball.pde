abstract class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  boolean isDead;

  Ball(int x, int y) {
    this.x = x; 
    this.y=y;
    xSpeed = 0;
    ySpeed = 0
      isDead = false;
  }  
  abstract void display();
  abstract void move();
  abstract boolean isTouching(Powerup p);
}
