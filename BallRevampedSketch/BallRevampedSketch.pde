int deaths;
int sec = second();
int timeOfGame;
Game game;
void setup() {
  size(450,600);
  game = new Game();
}
void draw() {
  game.run();
  textSize(20);
  //text(""+mouseX+" "+mouseY, mouseX,mouseY);
}
void mouseClicked() {
  if (game.isPaused) {
    if (mouseX > 125 && mouseX < 320 && mouseY > 425 && mouseY < 440) {
      game.isPaused = !game.isPaused;
    }
    if (mouseX > 150 && mouseX < 300 && mouseY > 170 && mouseY < 190) {
      game.menu.levelStart = 0;
      game.currentLevel = 0;
      game.menu.menuType = 0;
      game.isPaused = !game.isPaused;
      deaths = 0;
      timeOfGame = 0;
    }
  }
  game.menu.mouseClicked();
}
void keyPressed() {
  game.level.ball.keyPressed();
}
void keyReleased() {
  if (key == 'p') {
    game.isPaused = !game.isPaused;
  }  
  game.level.ball.keyReleased();
}
/*Regular Polygon code from processing website
   */
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void arrow(float x,float y,float size,float angleRotation) {
  pushMatrix();
  translate(x,y);
  rotate(radians(angleRotation));
  beginShape(); 
  vertex(-2.4*size/30.4, -14.4*size/30.4);
  vertex(+2.4*size/30.4, -14.4*size/30.4);
  vertex(+2.4*size/30.4, +4*size/30.4);
  vertex(+11*size/30.4, +4*size/30.4);
  vertex(0, +16*size/30.4);
  vertex(-11*size/30.4, +4*size/30.4);
  vertex(-2.4*size/30.4, +4*size/30.4);
  
  endShape(CLOSE);
  translate(-x,-y);
  popMatrix();
}
