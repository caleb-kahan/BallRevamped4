public class Game{
  int currentLevel;
  int deaths;
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
      if (currentLevel > 0) {
        if (keyPressed && key == 'p') {
          isPaused = !isPaused;
        }
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
        menu.display();
        currentLevel = menu.levelStart;
        if (currentLevel > 0) {
          creator = new LevelCreator();
          level = creator.constructLevel(currentLevel);
        }
      }
    }
    else {
      fill(180);
      rectMode(CENTER);
      rect(225,300,200,300);
      rectMode(CORNERS);
      noFill();
      noStroke();
      rect(125,425,325,445);
      if (mouseX > 125 && mouseX < 325 && mouseY > 425 && mouseY < 445) {
        fill(80);
      }
      else {
        fill(255);
      }
      textSize(30);
      text("Back to Game",125,445);
      if (keyPressed && key == 'p') {
          isPaused = !isPaused;
      }
    }
  }
}
