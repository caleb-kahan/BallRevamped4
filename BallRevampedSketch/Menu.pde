 class Menu {
  int menuType;
  int levelStart;
  ArrayList<Square> squares;
  Menu() {
    menuType = 0;
    levelStart = 0;
    squares = new ArrayList<Square>();
    int level = 1;
    for (float j = 70;j <= 550;j += 86) {
      for (float i = 30;i <= 348;i += 102) {
        squares.add(new Square(i,j,i+62,j+62,level++));
      }    
    }
  }
  void mouseClicked() {
    if (menuType == 0) {
      if (mouseX>50 && mouseX<109 && mouseY>154 && mouseY<186) {
        levelStart = 1;
      }
      else if (mouseX>50 && mouseX<138 && mouseY>284 && mouseY<310) {
        menuType = 1;
      }
    }
    else {
      for (Square square : squares) {
        if (square.isTouching()) {
          levelStart = square.level;
        }
      }
      if (mouseX > 10 && mouseX<66 && mouseY>10 && mouseY<35) {
        menuType = 0;
      }
    }
   return true;
  }
  /*void run() {
    if (menuType == 0) {
      if (mousePressed && mouseX>50 && mouseX<109 && mouseY>154 && mouseY<186) {
        levelStart = 1;
      }
      else if (mousePressed && mouseX>50 && mouseX<138 && mouseY>284 && mouseY<310) {
        menuType = 1;
      }
    }
    else if (menuType == 1) {
      for (Square square : squares) {
        if (mousePressed && square.isTouching()) {
          levelStart = square.level;
        }
      }
      if (mousePressed && mouseX > 10 && mouseX<66 && mouseY>10 && mouseY<35) {
        menuType = 0;
      }
    }
  }*/
  void display() {
    noStroke();
    fill(51,220,102);
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
      noFill();
      rectMode(CORNERS);
      rect(50,154,109,186);
      rect(50,284,138,310);
      textSize(30);
      if (mouseX > 50 && mouseX < 109 && mouseY > 154 && mouseY < 186) {
        fill(80);
      }
      else {
        fill(255);
      }
      text("Play",50,180);
      if (mouseX > 50 && mouseX < 138 && mouseY > 284 && mouseY < 310) {
        fill(80);
      }
      else {
        fill(255);
      }
      text("Levels",50,308);
      fill(255);
      text("Chris Choi",50,495);
      text("Caleb Kahan",50,530);
      textSize(18);
      text("Created by",50,460);
      
    }
    else  {
      fill(255);
      text("Levels" ,160,40);
      rectMode(CORNERS);
      noFill();
      rect (10,10,66,35);
      if (mouseX > 10 && mouseX < 66 && mouseY > 10 && mouseY < 35) {
        fill(80);
      }
      else {
        fill(255);
      }
      textSize(25);
      text("back",10,33);
      
      for (Square square : squares) {
        int fill = 0;
        if (square.isTouching()) {
          fill = 80;
        }
        else {
          fill = 255;
        }
        rectMode(CORNERS);
        stroke(fill);
        square.display(fill);
      }
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
      y1 = Y1;
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
    void display(int fill) {
      noFill();
      rect(x1,y1,x2,y2);
      fill(fill);
      text(""+level,x1 + (x2-x1)/2-8,y1 + (y2-y1)/2+8);
    }
 }
