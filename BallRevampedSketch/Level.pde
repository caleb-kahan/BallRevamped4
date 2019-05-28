class Level {
  int levelNumber;
  ArrayList<EnvironmentElement> elements;
  ArrayList<PowerUp> powerUps;
  Ball ball;
  float startX;
  float startY;
  int fuseIndex;
  int woodIndex;
  boolean isDark;
  
  Level(int levelNum, ArrayList<EnvironmentElement> elements, ArrayList<PowerUp> powerUps, Ball ball, float x, float y,int fuseIdx, int woodIdx,boolean isdark) {
    levelNumber = levelNum;
    this.elements = elements;
    this.powerUps = powerUps;
    this.ball = ball;
    startX = x;
    startY = y;
    fuseIndex = fuseIdx;
    woodIndex = woodIdx;
    isDark = isdark;
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
      if (element.isTouching(ball) && !(element instanceof ForceField)){
        if (element instanceof Wood && ball instanceof RazorBall) {
          ((Wood)element).isDestroyed = true;
        }
        else if (!(element instanceof Stick) && (!(element instanceof Wood) || (element instanceof Wood && !((Wood)element).isDestroyed))) {
          respawn();
        }
        else if (element instanceof Stick) {
          ((Stick)element).ballTouched = true;
        }
      }
      else if (element instanceof ForceField) {
        if (element.isTouching(ball) && !((ForceField)element).isDeactivated) {
          respawn();
        }
      }
      if (element instanceof Stick && (element.isTouching(ball) != ((Stick)element).ballTouched) && ((((Stick)element).ballAbove && ball.y > element.y) || 
                                                                                                       (!((Stick)element).ballAbove && ball.y < element.y)) ) {
          ((Stick)element).ballAbove = !((Stick)element).ballAbove;
          ((Stick)element).ballTouched = false;
          if (((Stick)element).passesLeft > 0) {
            ((Stick)element).passesLeft--;
          }
      }
      if (element instanceof Stick && ((Stick)element).passesLeft == 0) {
        for (EnvironmentElement Element : elements) {
          if (Element instanceof ForceField) {
            ((ForceField)Element).isDeactivated = true;
          }
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
    if (isDark) {
      stroke(0);
      strokeWeight(750);
      noFill();
      ellipse(ball.x,ball.y,1000,1000);
      strokeWeight(1);
    }
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
      if (element instanceof Stick) {
        ((Stick)element).passesLeft = 5;
        ((Stick)element).ballAbove = true;
        ((Stick)element).ballTouched = false;
      }
       if (element instanceof ForceField) {
         ((ForceField)element).isDeactivated = false;
       }
    }
  }
}