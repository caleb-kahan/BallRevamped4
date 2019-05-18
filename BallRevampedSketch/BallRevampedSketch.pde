import java.util.Arrays;
abstract class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  boolean isDead;
  boolean[] keys;

  Ball(int x, int y) {
    this.x = x; 
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    isDead = false;
    keys = new boolean[4];
    keys[0] = false;
    keys[1] = false;
    keys[0] = false;
    keys[1] = false;
  }  
  abstract void display();
  void move() {
    text(keyPressed + " " + keyCode + " " + Arrays.toString(keys), 10,10);;
    //if (key == CODED) {
      if (keys[0]) 
        ySpeed+=.35;
      if (keys[1])
        ySpeed-=.35;
      if (keys[2]) 
        xSpeed+=.2;
      if (keys[3]) 
        xSpeed-=.2;
    //}
    this.x += this.xSpeed;
    this.y -= this.ySpeed;
    this.ySpeed -= .09;
  }
  boolean keyPressed() {
    if (key == 'w') {
      keys[0] = true;
    }
    else if (key == 's') {
      keys[1] = true;
    }
    else if (key == 'd') {
      keys[2] = true;
    }
    else if (key == 'a') {
      keys[3] = true;
    }
    return true;
  }
  boolean keyReleased() {
    if (key == 'w') {
      keys[0] = false;
    }
    else if (key == 's') {
      keys[1] = false;
    }
    else if (key == 'd') {
      keys[2] = false;
    }
    else if (key == 'a') {
      keys[3] = false;
    }
    return true;
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
