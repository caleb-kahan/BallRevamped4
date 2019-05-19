import java.util.Arrays;
abstract class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float radius;
  boolean isDead;
  boolean[] keys;

  Ball(float x, float y, float radius) {
    this.x = x; 
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    this.radius = radius;
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
Wall wallie;
PowerUp star;
float startX;
float startY;
void setup() {
  size(450, 600);
  startX = 255;
  startY = 50;
  ball = new NormalBall(startX, startY,25);
  wallie = new Wall(200,200,50,100,0);
  star = new SmallPowerUp(100,100,10,new int[] {255,130,160});
}

void draw() {
  background(255);
  if (ball.y > 600 || ball.y < 0 || ball.x > 450 || ball.x < 0) {
    ball.respawn(255,50);
  }
  star.display();
  wallie.display();
  if(wallie.isTouching(ball) || star.isTouching(ball)) circle(300,300,50);
  if (star.isTouching(ball)) star.use(ball);
  ball.display();
  ball.move();
}
void keyPressed() {
  ball.keyPressed();
}
void keyReleased() {
  ball.keyReleased();
}
