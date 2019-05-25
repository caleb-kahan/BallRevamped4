class Level {
  int levelNumber;
  ArrayList<EnvironmentElement> elements;
  ArrayList<PowerUp> powerUps;
  Ball ball;
  float startX;
  float startY;
  
  Level(int levelNum, ArrayList<EnvironmentElement> elements, ArrayList<PowerUp> powerUps, Ball ball, float x, float y) {
    levelNumber = levelNum;
    this.elements = elements;
    this.powerUps = powerUps;
    this.ball = ball;
    startX = x;
    startY = y;
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
        if (element instanceof Wood && ball instanceof RazorBall) {
          ((Wood)element).isDestroyed = true;
        }
        else {
          respawn();
        }
      }
    }
    for (PowerUp powerup : powerUps) { 
      powerup.display();
      if (powerup.isTouching(ball)) {
        ball = powerup.use(ball);
      }
    }
    ball.display();
    ball.move();
    stroke(0);
  }
  
  void respawn() {
    ball = new BombBall(startX,startY);
    for (PowerUp powerup : powerUps) {
      powerup.isUsed = false;
    }
    for (EnvironmentElement element : elements) {
      if (element instanceof Wood) {
        ((Wood)element).isDestroyed = false;
      }
    }
  }
}
