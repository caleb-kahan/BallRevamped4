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
          ySpeed+=.35;
        if (keyCode == DOWN)
          ySpeed-=.35;
        if (keyCode== RIGHT) 
          xSpeed+=.2;
        if (keyCode== LEFT) 
          xSpeed-=.2;
      }
    }
    this.x += this.xSpeed;
    this.y -= this.ySpeed;
    this.ySpeed -= .09;
  }
  //abstract boolean isTouching(PowerUp p);
}


Ball ball;

void setup() {
  size(450, 600);
  ball = new NormalBall(225, 50);
}

void draw() {
  background(255);
  ball.display();
  ball.move();
  if (ball.y > 600 || ball.y < 0 || ball.x > 450 || ball.x < 0) {
    ball.x = 225;
    ball.y = 50;
    ball.xSpeed = 0;
    ball.ySpeed = 0;
  }

}
