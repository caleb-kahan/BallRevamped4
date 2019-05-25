class Level {
  int levelNumber;
  ArrayList<EnvironmentElement> elements;
  ArrayList<PowerUp> powerUps;
  Ball ball;
  float startX;
  float startY;
  
  Level(int levelNum, ArrayList<EnvironmentElement> elements, ArrayList<PowerUp> powerUps, Ball ball) {
    levelNumber = levelNum;
    this.elements = elements;
    this.powerUps = powerUps;
    this.ball = ball;
  }
  void run(){
    background(255);
    rectMode(CENTER);
    fill(255,0,0);
    rect(startX-1,startY,9,9);
    fill(0);
    text("X",startX-5,startY+4);
    for (EnvironmentElement element : elements) {
      element.display();
      if (element.isTouching(ball)){
        ball.respawn(startX,startY,powerUps);
      }
    }
    for (PowerUp powerup : powerUps) { 
      powerup.display();
      if (powerup.isTouching(ball)) {
        powerup.use(ball);
      }
    }
    ball.display();
    ball.move();
    stroke(0);
  }
  
  void respawn() {
    ball.x = startX;
    ball.y = startY;
    ball.xSpeed = 0;
    ball.ySpeed = 0;
    ball.radius = 48;
    for (PowerUp powerup : powerUps) {
      powerup.isUsed = false;
    }
  }
}
