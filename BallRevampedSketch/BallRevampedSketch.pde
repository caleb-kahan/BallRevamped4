abstract class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  boolean isDead;

  Ball(int x, int y) {
    this.x = x; 
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    isDead = false;
  }  
  abstract void display();
  void move() {
    if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == UP) 
          ySpeed+=1.5;
        if (keyCode == DOWN)
          ySpeed-=1.5;
        if (keyCode== RIGHT) 
          xSpeed+=1.5;
        if (keyCode== DOWN) 
          xSpeed -=1.5;
      }
      this.x += this.xSpeed;
      this.y -= this.ySpeed;
      this.ySpeed -= 1;
    }
  }
  //abstract boolean isTouching(PowerUp p);
}


Ball ball;

void setup() {
  size(450, 600);
  ball = new NormalBall(50, 50);
}

void draw() {
  background(255);
  ball.display();
  ball.move();
}
