import java.util.Arrays;
abstract class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float radius;
  float startRadius;
  boolean isDead;
  boolean[] keys;
  int [][] colors;
  float gravity;
  Ball(float x, float y, float radius,float startRadius) {
    this.x = x; 
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    this.radius = radius;
    this.startRadius = startRadius;
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
  void respawn(float x, float y) {
    this.x = x;
    this.y = y;
    this.xSpeed = 0;
    this.ySpeed = 0;
    this.radius = startRadius;
    for (PowerUp powerup : powerUps) {
      powerup.isUsed = false;
    }
  }
  //abstract boolean isTouching(PowerUp p);
}

Ball ball;
Wall wallie;
float startX;
float startY;
float startRadius;
ArrayList<PowerUp> powerUps;
void setup() {
  size(450, 600);
  startX = 255;
  startY = 50;
  ball = new NormalBall(startX, startY,25,25);
  wallie = new Wall(200,200,50,100,0);
  PowerUp smallstar = new SmallPowerUp(100,100,10);
  PowerUp bigstar = new BigPowerUp(300,100,10);
  powerUps = new ArrayList<PowerUp>();
  powerUps.add(smallstar);
  powerUps.add(bigstar);
}

void draw() {
  background(255);
  if (ball.y > 600 || ball.y < 0 || ball.x > 450 || ball.x < 0) {
    ball.respawn(255,50);
  }
  wallie.display();
  if(wallie.isTouching(ball)) ellipse(300,300,50,50);
  for (PowerUp star : powerUps) { 
    star.display();
    if (star.isTouching(ball)) {
      ellipse(300,300,50,50);
      star.use();
    }
  }
  ball.display();
  ball.move();
}
void keyPressed() {
  ball.keyPressed();
}
void keyReleased() {
  ball.keyReleased();
}