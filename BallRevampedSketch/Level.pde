class Level {
  int levelNumber;
  ArrayList<EnvironmentElement> elements;
  ArrayList<PowerUp> powerUps;
  Ball ball;
  
  Level(int levelNum, ArrayList<EnvironmentElement> elements, ArrayList<PowerUp> powerUps) {
    levelNumber = levelNum;
    this.elements = elements;
    this.powerUps = powerUps;
  }
  void respawn() {
    ball.x = startX;
    ball.y = startY;
    ball.xSpeed = 0;
    ball.ySpeed = 0;
    ball.radius = startRadius;
    for (PowerUp powerup : powerUps) {
      powerup.isUsed = false;
    }
  }
}