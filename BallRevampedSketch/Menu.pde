class Menu {
  int menuType;
  int levelStart;
  Menu() {
    menuType = 0;
    levelStart = 0;
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
      
    }
  }
  
  class Square {
    float x1;
    float y1;
    float x2;
    float y2;
    String text;
    Square(float X1, float Y1,float X2,float Y2,String Text) {
      x1 = X1;
      y1 = Y2;
      x2 = X2;
      y2 = Y2;
      text = Text;
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
      text(text,x1 + (x2-x1)/2,y1 + (y2-y1)/2);
    }
  }
}
