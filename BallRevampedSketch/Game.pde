public class Game{
  int currentLevel;
  Level level;
  LevelCreator creator;
  Game() {
    creator = new LevelCreator();
    level = creator.constructLevel(1);
    currentLevel = 1;
  }
  void run() {
    stroke(0);
    strokeWeight(1);
    if (level.isFlipped) {
      pushMatrix();
      translate(450,600);
      rotate(PI);
      level.display();
      translate(-450,-600);
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
