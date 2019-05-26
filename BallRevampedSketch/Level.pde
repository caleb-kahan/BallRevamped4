class Level {
  int levelNumber;
  ArrayList<EnvironmentElement> elements;
  ArrayList<PowerUp> powerUps;
  Ball ball;
  float startX;
  float startY;
  int fuseIndex;
  int woodIndex;
  
  Level(int levelNum, ArrayList<EnvironmentElement> elements, ArrayList<PowerUp> powerUps, Ball ball, float x, float y,int fuseIdx, int woodIdx) {
    levelNumber = levelNum;
    this.elements = elements;
    this.powerUps = powerUps;
    this.ball = ball;
    startX = x;
    startY = y;
    fuseIndex = fuseIdx;
    woodIndex = woodIdx;
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
      if (element instanceof Wood) {
        ball = ((Wood)element).explode(ball);
      }
      if (element.isTouching(ball)){
        if (element instanceof Wood && ball instanceof RazorBall) {
          ((Wood)element).isDestroyed = true;
        }
        else if (!(element instanceof Wood) || (element instanceof Wood && !((Wood)element).isDestroyed)) {
          respawn();
        }
      }
    }
    for (PowerUp powerup : powerUps) { 
      powerup.display();
      if (powerup.isTouching(ball)) {
        if (powerup instanceof FusePowerUp) {
          ( (FusePowerUp)powerup).use((Fuse)(elements.get(fuseIndex)));
        }
        else {
          ball = powerup.use(ball);
        }
      }
    }
    ((Wood)elements.get(woodIndex)).explode((Fuse)elements.get(fuseIndex));
    ball.display();
    ball.move();
    stroke(0);
  }
  
  void respawn() {
    ball = new NormalBall(startX,startY,24);
    for (PowerUp powerup : powerUps) {
      powerup.isUsed = false;
    }
    for (EnvironmentElement element : elements) {
      if (element instanceof Wood) {
        ((Wood)element).isDestroyed = false;
      }
      if (element instanceof Fuse) {
        ((Fuse)element).reset();
      }
    }
  }
}
