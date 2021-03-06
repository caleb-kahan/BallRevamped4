public class Game{
  int currentLevel;
  int time;
  Level level;
  Menu menu;
  LevelCreator creator;
  boolean isPaused;
  Game() {
    currentLevel = 0;
    menu = new Menu();
  }
  void run() {
    if (!isPaused) {
      if (currentLevel > 0 && currentLevel < 33) {
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
          if (currentLevel == 32) {
            menu.menuType = 2;
          }
          level = creator.constructLevel(level.levelNumber+1);
          currentLevel++;
        }
        fill(255);
        textSize(15);
        text("Level "+ level.levelNumber,15,15);
        text("Time "+timeOfGame,260,15);
        text("Deaths "+deaths,360,15);
      }
      else {
        menu.display();
        currentLevel = menu.levelStart;
        if (currentLevel > 0) {
          creator = new LevelCreator();
          level = creator.constructLevel(currentLevel);
        }
        if (menu.menuType == 2) {
          textSize(30);
          fill(255);
          text(""+timeOfGame,300,203);
          text(""+deaths,300,261);
        } 
        menu.levelStart = 0;
      }
    }
    else {
      fill(180);
      rectMode(CENTER);
      rect(225,300,200,300);
      if (mouseX > 125 && mouseX < 320 && mouseY > 420 && mouseY < 440) {
        fill(80);
      }
      else {
        fill(255);
      }
      textSize(30);
      text("Back to Game",125,440);
     
      if (mouseX > 150 && mouseX < 300 && mouseY > 170 && mouseY < 190) {
        fill(80);
      }
      else {
        fill(255);
      }
      textSize(30);
      text("Main Menu",145,190);
    }
  }
}
