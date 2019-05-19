import java.util.Arrays;
class Haken {
  boolean[] keys;
  Haken() {
    keys = new boolean[4];
    keys[0] = false;
    keys[1] = false;
    keys[2] = false;
    keys[3] = false;
  }
  void move() {
    text(keyPressed + " " + keyCode + " " + Arrays.toString(keys), 100,100);
    if (keys[0]) {
      text("KONO", 10,10);
    }
      
    if (keys[1]){
      text("DIO", 10,100);
    }
    if (keys[2]){
      text("DA", 10,200);
    }
    if (keys[3]){
      text("DESU", 10,300);
    }
  }
  void  keyPressed() {
    text("HAKEN", 400,100);
    if (key == 'w') {
      keys[0] = true;
    }
    else if (key == 's') {
      keys[1] = true;
    }
    else if (key == 'd') {
      keys[2] = true;
    }
    else if (key == 'a') {
      keys[3] = true;
    }
  }
  void keyReleased() {
    text("FLOWER", 400,150);
    if (key == 'w') {
      keys[0] = false;
    }
    else if (key == 's') {
      keys[1] = false;
    }
    else if (key == 'd') {
      keys[2] = false;
    }
    else if (key == 'a') {
      keys[3] = false;
    }
  }
}
Haken band;
void setup() {
    size(450,600);  
    background(255);  
    band = new Haken();
    
}

void draw() {
  background(255);
  fill(0);
  band.move();
}
void keyPressed() {
  band.keyPressed();
}
void keyReleased() {
  band.keyReleased();
}
