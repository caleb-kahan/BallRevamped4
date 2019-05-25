import java.util.Arrays;
Level level = new LevelCreator().constructLevel(1);
void setup() { 
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
