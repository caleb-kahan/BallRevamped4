import java.util.Arrays;
Level level;
void setup() {
  size(450,600);
  level = new LevelCreator().constructLevel(1);
}

void draw() {
  level.run();
}
void keyPressed() {
  level.ball.keyPressed();
}
void keyReleased() {
  level.ball.keyReleased();
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
