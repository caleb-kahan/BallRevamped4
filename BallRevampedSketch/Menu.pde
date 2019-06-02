 class Menu {
  int menuType;
  int levelStart;
  ArrayList<Square> squares;
  Menu() {
    menuType = 0;
    levelStart = 0;
    squares = new ArrayList<Square>();
    int level = 1;
    for (float i = 40;i <= 348;i += 102) {
      for (float j = 70;j <= 550;j += 86) {
        squares.add(new Square(i,j,i+62,j+62,level++));
      }    
    }
  }
  void run() {
    if (menuType == 0) {
      if (mousePressed && mouseX>45 && mouseX<113 && mouseY>151 && mouseY<171) {
        levelStart = 1;
      }
      else if (mousePressed && mouseX>45 && mouseX<113 && mouseY>220 && mouseY<240) {
        menuType = 1;
      }
    }
    else if (menuType == 1) {
      for (Square square : squares) {
        if (square.isTouching()) {
          levelStart = square.level;
        }
      } 
    }
  }
  void display() {
    noStroke();
    fill(51,255,102);
    beginShape();
    vertex(0,0);
    vertex(284,0);
    vertex(219,266);
    vertex(0,206);
    endShape(CLOSE);
    
    fill(204,51,204);
    beginShape();
    vertex(450,0);
    vertex(450,326);
    vertex(219,266);
    vertex(284,0);
    endShape(CLOSE);
    
    fill(51,100,250);
    beginShape();
    vertex(450,600);
    vertex(134,600);
    vertex(219,266);
    vertex(450,326);
    endShape(CLOSE);
    
    fill(255,51,50);
    beginShape();
    vertex(0,600);
    vertex(0,206);
    vertex(219,266);
    vertex(134,600);
    endShape(CLOSE);
    if (menuType == 0) {
      textSize(50);
      fill(255);
      text("Ball Revamped 4", 22,50);
    }
    fill(255);
    arrow(mouseX,mouseY,20,0);
  }
 }  
 class Square {
    float x1;
    float y1;
    float x2;
    float y2;
    int level;
    Square(float X1, float Y1,float X2,float Y2,int lvl) {
      x1 = X1;
      y1 = Y2;
      x2 = X2;
      y2 = Y2;
      level = lvl;
    }
    boolean isTouching() {
      if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
        return true;
      }
      return false;
    }
    void display() {
      rectMode(CORNERS);
      rect(x1,y1,x2,y2);
      text(""+level,x1 + (x2-x1)/2,y1 + (y2-y1)/2);
    }
 }
