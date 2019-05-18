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
  abstract void move();
  //abstract boolean isTouching(PowerUp p);
}


Ball ball;

void setup() {
  size(450,600);
  ball = new NormalBall(50,50);
}

void draw() {
  background(255);
  ball.display();
  ball.move();
}
