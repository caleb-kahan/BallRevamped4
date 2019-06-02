abstract class PowerUp {
  float size;
  float x;
  float y;
  int[] starColors;
  boolean isUsed;
  PowerUp(float x,float y,float size,int[] starColors) {
    this.starColors = starColors;
    this.size = 50*50/size;
    this.x = x;
    this.y = y;
    isUsed = false;
  }
  void display() {
    fill(starColors[0],starColors[1],starColors[2]);
    stroke(starColors[0]/2,starColors[1]/2,starColors[2]/2);
    strokeWeight(2);
    beginShape();
    vertex(x+50*0/size, y-50*48/size);
    vertex(x+50*12/size, y-50*15/size);
    vertex(x+50*47/size, y-50*15/size);
    vertex(x+50*23/size, y+50*7/size);
    vertex(x+50*32/size, y+50*40/size);
    vertex(x+50*0/size, y+50*20/size);
    vertex(x-50*32/size, y+50*40/size);
    vertex(x-50*23/size, y+50*7/size);
    vertex(x-50*47/size, y-50*15/size);
    vertex(x-50*12/size, y-50*15/size);
    endShape(CLOSE);
    stroke(0);
    strokeWeight(1);
    fill(0);
  }
  boolean isTouching(Ball b) {
    return (sqrt(sq(x - b.x)+sq(y - b.y)) < 50*50/size + b.radius);
  }
  abstract Ball use(Ball ball);
}

class BigPowerUp extends PowerUp {
  BigPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {101,255,162});
  }
  void display(){
    fill(starColors[0],starColors[1],starColors[2]);
    stroke(starColors[0]/2,starColors[1]/2,starColors[2]/2);
    strokeWeight(2);
    arrow(x,y,30.4,180);
    super.display();
    fill(0);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      if(! (ball instanceof NormalBall)) {
        float xVel = ball.xSpeed;
        float yVel = ball.ySpeed;
        ball = new NormalBall(ball.x,ball.y,48);
        ball.xSpeed = xVel;
        ball.ySpeed = yVel;
      }
      else ball.radius = 48;
    }
    return ball;
  }
}

class BombPowerUp extends PowerUp {
  BombPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {172, 152, 228});
  }
  void display() {
    fill(0);
    float radius = (50*50/size)*5;
    ellipse(x, y, 2*radius/3, 2*radius/3);
    fill(0);
    rectMode(CENTER);
    rect(x,y-18.7,10,4);
    stroke(190);
    strokeWeight(2);
    line(x,y-20.7,x,y-30);
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new BombBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}

class LaserPowerUp extends PowerUp {
  LaserPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {127, 255, 0});
  }
  void display() {
    color from = color(28);
    color to = color(242);
    float l = 5000/size+8;
    float w = l/3;
    for (float a = -w/2; a<w/4; a+=0.03) {
      color lerp = lerpColor(from, to, (a+w/2)/(3*w/4));
      stroke(lerp);
      line(x+a, y-l/2, x+a, y+l/2);
      line(x-l/2, y+a, x+l/2, y+a);
    }
    for (float a = 2; a<4; a+=0.03) {
      color lerp = lerpColor(to, from, (a-2)/6);
      stroke(lerp);
      line(x+a, y-12, x+a, y+12);
      line(x-12, y+a, x+12, y+a);
    }
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new LaserBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}

class HeavyPowerUp extends PowerUp {
  HeavyPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {28, 255, 226});
  }
  void display() {
    super.display();
    fill(175);
    ellipse(x,y,2500/size,2500/size);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new HeavyBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}

class RazorPowerUp extends PowerUp {
  RazorPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {148,136,250});
  }
  void display(){
    fill(220);
    for (float i = 0;i < 2*PI;i+=PI/4) {
      arc(x+(1500/size)*cos(i),y+(1500/size)*sin(i),2700/size,2700/size,i,7*PI/8+i,CHORD);
    }
    super.display();
    fill(0);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new RazorBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}

class SmallPowerUp extends PowerUp {
  SmallPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {101,255,162});
  }
  void display(){
    fill(starColors[0],starColors[1],starColors[2]);
    stroke(starColors[0]/2,starColors[1]/2,starColors[2]/2);
    strokeWeight(2);
    arrow(x,y,30.4,0);
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;      
      if(! (ball instanceof NormalBall)) {
        float xVel = ball.xSpeed;
        float yVel = ball.ySpeed;
        ball = new NormalBall(ball.x,ball.y,12);
        ball.xSpeed = xVel;
        ball.ySpeed = yVel;
      }
      else ball.radius = 12;
    }
    return ball;
  }
}

class WeightlessPowerUp extends PowerUp {
  float[][] spots;
  WeightlessPowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {160, 160, 160});
    float radius = (4*50*50/this.size);
    spots = new float[15][2];
    float angle  = 0;
    for (int i=0; i<15; i++) {
      float a = radius-25;
      float b = radians(angle);
      spots[i][0]=a;
      spots[i][1]=b;
      angle+=24;
    }
  }
  void display() {
    stroke(192, 192, 192);
    fill(0);
    float radius = (50*50/size)*4;
    ellipse(x, y, radius, radius);
    fill(175);
    stroke(120);
    for (int i=0; i<15; i++) {
      ellipse(x+spots[i][0]*cos(spots[i][1]), y+spots[i][0]*sin(spots[i][1]), 2, 2);
    }
    super.display();
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new WeightlessBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}

class FusePowerUp extends PowerUp {
  FusePowerUp(float x, float y, float size) {
    super(x, y, size, new int[] {255, 167, 167});
  }
  void display() {
    fill(130);
    rectMode(CENTER);
    rect(x, y+50*20/size,2*50*50/size,2*50*50/size);
    stroke(190);
    strokeWeight(2);
    line(x,y+50*20/size-50*50/size,x,y-4750/size);
    line(x-50*50/size,y-4750/size,x+50*50/size,y-4750/size);
    super.display();
    strokeWeight(1);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    return ball;
  }
  void use (Fuse fuse) {
    if (!isUsed) {
      fuse.isActivated = true;
      isUsed = true;
    }
  }
}

class FlipPowerUp extends PowerUp {
  FlipPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {250,250,150});
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  void display() {
    noFill();
    stroke(180);
    strokeWeight(2);
    ellipse(x,y,10000/size,10000/size);
    strokeWeight(1);
    fill(255,215,0);
    triangle(x+11.5,y-5, x+26.5,y-5,x+19,y+8.2);
    super.display();
  }
  Level use(Level level) {
    if (!isUsed) {
      isUsed = true;
      level.isFlipped = !level.isFlipped;
    }
    return level;
  }
  Ball use(Ball ball) {
    return ball;
  }
}

class LightPowerUp extends PowerUp {
  LightPowerUp(float x,float y,float size) {
    super(x,y,size,new int[] {255,255,255});
  }
  void display(){
    fill(starColors[0],starColors[1],starColors[2]);
    super.display();
    fill(0);
  }
  boolean isTouching(Ball b) {  
    return super.isTouching(b);
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new LightBall(x,y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}
public class BurningPowerUp extends PowerUp {
  float ellipseVelocity;
  float ellipseWidth;
  float ellipseHeight;
  BurningDrop [] drops;
  int dropIndex;

  BurningPowerUp(float x, float y, float elWid, float elHei) {
    super(x, y, 10, new int[]{244, 216, 160});
    ellipseVelocity = 0.2;
    drops = new BurningDrop[200];
    dropIndex = 0;
    ellipseWidth = elWid;
    ellipseHeight = elHei;
  }
  void display() {
    super.display();
      generateDrops();
    
    for (BurningDrop drop : drops) {
        if (drop!=null) {
          drop.display();
          drop.move();
        }
      }
  }
  void generateDrops() {
    if (dropIndex>=drops.length-1)
      dropIndex = 0;
    float time = millis();
    float newX = ellipseWidth*(cos(ellipseVelocity*time))+x;
    float newY = ellipseHeight*(sin(ellipseVelocity*time))+y;
    color yellow = color(255, 255, 0);
    color red = color(255, 0, 0);
    drops[dropIndex++] = new BurningDrop(newX, newY, 4, lerpColor(yellow, red, random(1)));
    newX = ellipseWidth*(cos(ellipseVelocity*(time)+PI))+x;
    newY = ellipseHeight*(sin(ellipseVelocity*(time)+PI))+y;
    drops[dropIndex++] = new BurningDrop(newX, newY,4, lerpColor(yellow, red, random(1)));
  }
  Ball use(Ball ball) {
    if (!isUsed) {
      isUsed = true;
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new BurningBall(ball.x, ball.y);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }


  public class BurningDrop {
    float x;
    float y;
    float size;
    float millisSec;
    color original;
    float velocity;
    boolean isDead;
    BurningDrop(float x, float y, float size, color col) {
      original = col;
      this.x=x;
      this.y=y;
      this.size=size;
      millisSec = millis()+1500;
      velocity = 1;
      isDead = false;
    }
    void display() {
      if (! isDead) {
        color blackGround = g.backgroundColor;
        float percentage = (millis()+1500-millisSec)/1500;
        color a = lerpColor(original, blackGround, percentage);
        fill(a);
        noStroke();
        for (int i = 2; i < size; i++ ) {
          ellipse(x, y + i*4, i*2, i*2);
        }
      }
    }
    void move() {
      if (! isDead) {
        y-=velocity;
        if (millis()>millisSec) isDead = true;
      }
    }
  }
}
