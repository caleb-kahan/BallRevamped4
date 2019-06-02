public class Game{
  int currentLevel;
  int deaths;
  int time;
  Level level;
  Menu menu;
  LevelCreator creator;
  Game() {
    currentLevel = 0;
    menu = new Menu();
  }
  void run() {
    if (currentLevel > 0) {
      if (sec != second()) {
        sec = second();
        timeOfGame++;
      }
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
      fill(255);
      text("Level "+ level.levelNumber,15,15);
      text("Time "+timeOfGame,260,15);
      text("Deaths "+deaths,360,15);
    }
    else {
      //menu.run();
      menu.display();
      currentLevel = menu.levelStart;
      if (currentLevel > 0) {
        creator = new LevelCreator();
        level = creator.constructLevel(currentLevel);
      }
    }
  }  
}
