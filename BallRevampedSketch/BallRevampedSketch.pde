import java.util.Arrays;
abstract class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  int diameter;
  boolean isDead;
  boolean[] keys;

  Ball(int x, int y, int diameter) {
    this.x = x; 
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    this.diameter = diameter;
    isDead = false;
    keys = new boolean[4];
  }  
  abstract void display();
  void move() {
    if (keys[0]) 
      ySpeed+=.32;
    if (keys[1])
      ySpeed-=.32;
    if (keys[2]) 
      xSpeed+=.13;
    if (keys[3]) 
      xSpeed-=.13;
    this.x += this.xSpeed;
    this.y -= this.ySpeed;
    this.ySpeed -= .06;
  }
  boolean keyPressed() {
    if (keyCode == UP) {
      keys[0] = true;
    }
    else if (keyCode == DOWN) {
      keys[1] = true;
    }
    else if (keyCode == RIGHT) {
      keys[2] = true;
    }
    else if (keyCode == LEFT) {
      keys[3] = true;
    }
    return true;
  }
  boolean keyReleased() {
    if (keyCode == UP) {
      keys[0] = false;
    }
    else if (keyCode == DOWN) {
      keys[1] = false;
    }
    else if (keyCode == RIGHT) {
      keys[2] = false;
    }
    else if (keyCode == LEFT) {
      keys[3] = false;
    }
    return true;
  }
  void respawn(float x, float y) {
    this.x = x;
    this.y = y;
    this.xSpeed = 0;
    this.ySpeed = 0;
  }
  //abstract boolean isTouching(PowerUp p);
}

Ball ball;

void setup() {
  size(450, 600);
  ball = new NormalBall(225, 50,50);
}

void draw() {
  background(255);
  if (ball.y > 600 || ball.y < 0 || ball.x > 450 || ball.x < 0) {
    ball.respawn(255,50);
  }
  Wall wallie = new Wall(200,200,50,100,0);
  wallie.display();
  if(wallie.isTouching(ball)) circle(300,300,50);
  ball.display();
  ball.move();
}
void keyPressed() {
  ball.keyPressed();
}
void keyReleased() {
  ball.keyReleased();
}
