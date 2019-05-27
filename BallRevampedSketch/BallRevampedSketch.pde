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
