abstract class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float radius;
  boolean isDead;
  boolean[] keys;
  int [][] colors;
  float gravity;
  float upIncrement;
  Ball(float x, float y, float radius) {
    this.x = x; 
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    this.radius = radius;
    isDead = false;
    keys = new boolean[4];
    upIncrement = .32;
  }
  abstract void display();
  void move() {
    if (keys[0]) 
      ySpeed+=upIncrement;
    if (keys[1])
      ySpeed-=upIncrement;
    if (keys[2]) 
      xSpeed+=.13;
    if (keys[3]) 
      xSpeed-=.13;
    this.x += this.xSpeed;
    this.y -= this.ySpeed;
    this.ySpeed += gravity;
  }
  boolean keyPressed() {
    if (keyCode == UP) {
      keys[0] = true;
    } else if (keyCode == DOWN) {
      keys[1] = true;
    } else if (keyCode == RIGHT) {
      keys[2] = true;
    } else if (keyCode == LEFT) {
      keys[3] = true;
    }
    return true;
  }
  boolean keyReleased() {
    if (keyCode == UP) {
      keys[0] = false;
    } else if (keyCode == DOWN) {
      keys[1] = false;
    } else if (keyCode == RIGHT) {
      keys[2] = false;
    } else if (keyCode == LEFT) {
      keys[3] = false;
    }
    return true;
  }
  abstract Ball respawn(float x, float y, ArrayList<PowerUp> powerUps);
}
