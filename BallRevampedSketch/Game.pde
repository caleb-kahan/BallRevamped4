public class Game{
  int currentLevel;
  Level level;
  LevelCreator creator;
  Game() {
    creator = new LevelCreator();
    level = creator.constructLevel(18);
    currentLevel = 18;
  }
  void run() {
    stroke(0);
    strokeWeight(1);
    if (level.isFlipped) {
      pushMatrix();
      translate(450,600);
      rotate(PI);
      level.display();
      popMatrix();
    }
    else {
      level.display();
    }
    level.run();
    if (level.nextLevel) {
      level = creator.constructLevel(level.levelNumber+1);
    }
  }
  
}
