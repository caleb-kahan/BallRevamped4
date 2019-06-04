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
  float angleRotation;
  boolean rotatable;
  Ball(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    this.radius = radius;
    isDead = false;
    keys = new boolean[4];
    upIncrement = .32;
    angleRotation =0;
  }
  abstract void display();
  void move() {
    if (keys[0]) {
      ySpeed+=upIncrement;
    }
    if (keys[1]) {
      ySpeed-=upIncrement;
    }
    if (keys[2]) {
      xSpeed+=.13;
    }
    if (keys[3]) {
      xSpeed-=.13;
    }
    this.x += this.xSpeed;
    this.y -= this.ySpeed;
    this.ySpeed += gravity;
    angleRotation+=0.8*(xSpeed/radius);
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
}

class NormalBall extends Ball {
  NormalBall(float x, float y, float radius) {
    super(x, y, radius);
    gravity = -0.06;
    colors = new int[4][3];
    colors[0][0]=51;
    colors[0][1]=255;
    colors[0][2]=102;
    colors[1][0]=204;
    colors[1][1]=51;
    colors[1][2]=204;
    colors[2][0]=51;
    colors[2][1]=100;
    colors[2][2]=250;
    colors[3][0]=255;
    colors[3][1]=51;
    colors[3][2]=50;
    rotatable = true;
  }
  void display() {
    if (!isDead) {
      stroke(0);
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(0, 0, this.radius*2, this.radius*2, 0, PI/2, PIE);
      fill(colors[1][0], colors[1][1], colors[1][2]);
      arc(0, 0, this.radius*2, this.radius*2, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(0, 0, this.radius*2, this.radius*2, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(0, 0, this.radius*2, this.radius*2, PI/2, PI, PIE);
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}

class BombBall extends Ball {
  int time;
  int prevTime;
  BombBall(float x, float y) {
    super(x, y, 24);
    gravity = -0.06;
    colors = new int[4][3];
    colors[0][0]=(int)(51*0.1);
    colors[0][1]=(int)(255*0.1);
    colors[0][2]=(int)(102*0.1);
    colors[1][0]=(int)(204*0.1);
    colors[1][1]=(int)(51*0.1);
    colors[1][2]=(int)(204*0.1);
    colors[2][0]=(int)(51*0.1);
    colors[2][1]=(int)(100*0.1);
    colors[2][2]=(int)(250*0.1);
    colors[3][0]=(int)(255*0.1);
    colors[3][1]=(int)(51*0.1);
    colors[3][2]=(int)(50*0.1);
    time = 5;
    prevTime = second();
    rotatable = false;
  }
  void display() {
    if (!isDead) {        
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(this.x, this.y, 48, 48, 0, PI/2, PIE);
      fill(colors[1][0], colors[1][1], colors[1][2]);
      arc(this.x, this.y, 48, 48, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(this.x, this.y, 48, 48, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(this.x, this.y, 48, 48, PI/2, PI, PIE);
      fill(0);
      rectMode(CENTER);
      rect(x, y-27, 15, 6);
      stroke(190);
      strokeWeight(2);
      noFill();
      line(x, y-30, x, y-40);
      arc(x+5, y-40, 10, 10, PI, 11*PI/6);
      textSize(15);
      fill(255);
      text(""+time, x-4, y+4);
      strokeWeight(1);
      if (second() != prevTime) {
        prevTime = second();
        time--;
      }
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}

class HeavyBall extends Ball {
  HeavyBall(float x, float y) {
    super(x, y, 24);
    gravity = -.13;
    upIncrement = .24;
    rotatable = true;
  }
  void display() {
    if (!isDead) {  
      fill(175);
      arc(0, 0, 48, 48, 0, PI/2, PIE);
      arc(0, 0, 48, 48, -PI/2, 0, PIE);
      arc(0, 0, 48, 48, PI, 3*PI/2, PIE);
      arc(0, 0, 48, 48, PI/2, PI, PIE);
      fill(240);
      polygon(0, 0, 24/3, 6);
      fill(0);
    }
  }  
  void move() {
    if (!isDead) super.move();
  }
}


class RazorBall extends Ball {
  RazorBall(float x, float y) {
    super(x, y, 24);
    gravity = -0.06;
    colors = new int[4][3];
    colors[0][0]=51;
    colors[0][1]=255;
    colors[0][2]=102;
    colors[1][0]=204;
    colors[1][1]=51;
    colors[1][2]=204;
    colors[2][0]=51;
    colors[2][1]=100;
    colors[2][2]=250;
    colors[3][0]=255;
    colors[3][1]=51;
    colors[3][2]=50;
    rotatable = true;
  }
  void display() {
    if (!isDead) {  
      fill(220);
      for (float i = 0; i < 2*PI; i+=PI/6) {
        arc(18*cos(i), 18*sin(i), 22, 22, -PI/10+i, 2*PI/3+i, CHORD);
      }
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(0, 0, this.radius*2, this.radius*2, 0, PI/2, PIE);
      fill(colors[1][0], colors[1][1], colors[1][2]);
      arc(0, 0, this.radius*2, this.radius*2, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(0, 0, this.radius*2, this.radius*2, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(0, 0, this.radius*2, this.radius*2, PI/2, PI, PIE);
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}

class WeightlessBall extends Ball {
  float spots [][];
  WeightlessBall(float x, float y) {
    super(x, y, 24);
    spots = new float[20][2]; 
    gravity = 0;
    colors = new int[4][3];
    colors[0][0]=(int)(51*0.3);
    colors[0][1]=(int)(255*0.3);
    colors[0][2]=(int)(102*0.3);
    colors[1][0]=(int)(204*0.3);
    colors[1][1]=(int)(51*0.3);
    colors[1][2]=(int)(204*0.3);
    colors[2][0]=(int)(51*0.3);
    colors[2][1]=(int)(100*0.3);
    colors[2][2]=(int)(250*0.3);
    colors[3][0]=(int)(255*0.3);
    colors[3][1]=(int)(51*0.3);
    colors[3][2]=(int)(50*0.3);
    for (int i=0; i<10; i++) {
      float a = random(radius-1);
      float b = random(2*PI);
      spots[i][0]=a;
      spots[i][1]=b;
    }
    rotatable = true;
  }
  void display() {
    if (!isDead) {  
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(0, 0, 48, 48, 0, PI/2, PIE);
      fill(colors[1][0], colors[1][1], colors[1][2]);
      arc(0, 0, 48, 48, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(0, 0, 48, 48, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(0, 0, 48, 48, PI/2, PI, PIE);
      for (int i=0; i<10; i++) {
        fill(120);
        ellipse(spots[i][0]*cos(spots[i][1]), spots[i][0]*sin(spots[i][1]), 3, 3);
      }
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}



class LaserBall extends Ball {
  Laser [] lasers;
  int laserIndex;
  float upCoolDown;
  float downCoolDown;
  float rightCoolDown;
  float leftCoolDown;

  LaserBall(float x, float y) {
    super(x, y, 24);
    gravity = -.06;
    radius = 24;
    colors = new int[4][3];
    colors[0][0]=51;
    colors[0][1]=255;
    colors[0][2]=102;
    colors[1][0]=204;
    colors[1][1]=51;
    colors[1][2]=204;
    colors[2][0]=51;
    colors[2][1]=100;
    colors[2][2]=250;
    colors[3][0]=255;
    colors[3][1]=51;
    colors[3][2]=50;
    lasers= new Laser[40];
    laserIndex=0;
    upCoolDown = 0;
    downCoolDown = 0;
    leftCoolDown = 0;
    rightCoolDown = 0;
    rotatable = false;
  }
  void display() {
    if (!isDead) {
      pushMatrix();
      translate(x, y);
      rotate(angleRotation);
      fill(colors[0][0], colors[0][1], colors[0][2]);
      arc(0, 0, this.radius*2, this.radius*2, 0, PI/2, PIE);
      fill(colors[1][0], colors[1][1], colors[1][2]);
      arc(0, 0, this.radius*2, this.radius*2, -PI/2, 0, PIE);
      fill(colors[2][0], colors[2][1], colors[2][2]);
      arc(0, 0, this.radius*2, this.radius*2, PI, 3*PI/2, PIE);
      fill(colors[3][0], colors[3][1], colors[3][2]);
      arc(0, 0, this.radius*2, this.radius*2, PI/2, PI, PIE);
      popMatrix();

      //Here comes special cylinders;
      color from = color(28);
      color to = color(242);
      for (float a = -4; a<2; a+=0.03) {
        color lerp = lerpColor(from, to, (a+4)/6);
        stroke(lerp);
        line(x+a, y-12, x+a, y+12);
        line(x-12, y+a, x+12, y+a);
      }
      for (float a = 2; a<4; a+=0.03) {
        color lerp = lerpColor(to, from, (a-2)/6);
        stroke(lerp);
        line(x+a, y-12, x+a, y+12);
        line(x-12, y+a, x+12, y+a);
      }
      shootBeam();
      for (Laser laser : lasers) {
        if (laser!=null) {
          laser.display();
          laser.move();
        }
      }
    }
  }
  void shootBeam() {

    if (laserIndex>=lasers.length-4)
      laserIndex = 0;
    if (keys[0]==true) {
      if (upCoolDown<1) {
        lasers[laserIndex]=new Laser(x, y-radius, 90, 10, 90, color(30, 144, 255));
        laserIndex++;
        upCoolDown=20;
      }
    }
    if (keys[1]==true) {
      if (downCoolDown<1) {
        lasers[laserIndex]=new Laser(x, y+radius, 270, 10, 90, color(30, 144, 255));
        laserIndex++;
        downCoolDown=20;
      }
    }
    if (keys[2]==true) {
      if (rightCoolDown<1) {
        lasers[laserIndex]=new Laser(x+radius, y, 0, 10, 90, color(30, 144, 255));
        laserIndex++;
        rightCoolDown=20;
      }
    }
    if (keys[3]==true) {
      if (leftCoolDown<1) {
        lasers[laserIndex]=new Laser(x-radius, y, 180, 10, 90, color(30, 144, 255));
        laserIndex++;
        leftCoolDown=20;
      }
    }
    leftCoolDown--;
    downCoolDown--;
    rightCoolDown--;
    upCoolDown--;
  }
  void move() {
    if (!isDead) super.move();
  }
}

class LightBall extends Ball {
  LightBall(float x, float y) {
    super(x, y, 24);
    gravity = -.06;
    rotatable = false;
  }
  void display() {
    if (!isDead) {
      fill(255);
      ellipse(x, y, 48, 48);
      noFill();
      stroke(245);
      strokeWeight(20);
      ellipse(x, y, 68, 68);    
      strokeWeight(1);
    }
  }
  void move() {
    if (!isDead) super.move();
  }
}
class BurningBall extends NormalBall {
  float millisSec;
  float [][] original;
  BurningBall(float x, float y) {
    super(x, y, 24);
    millisSec = millis()+4000;
    original = new float[4][3];
    for (int i = 0; i<colors.length; i++) {
      for (int j =0; j<colors[0].length; j++) {
        original[i][j] = colors[i][j];
      }
    }
    rotatable = true;
  }
  void dying() { 
    for (int i = 0; i<colors.length; i++) {
      color black = color(0, 0, 0);
      float percentage = (millis()+4000-millisSec)/4000;
      color quadCol = color(original[i][0], original[i][1], original[i][2]);
      color a = lerpColor(quadCol, black, percentage);
      colors[i][0]= (int) red(a);
      colors[i][1]= (int) green(a);
      colors[i][2]= (int) blue(a);
    }
    if (millis()>millisSec) isDead = true;
  }
  void display() {
    super.display();
    dying();
  }
}
