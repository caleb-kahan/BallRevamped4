import java.util.Arrays;
class Haken {
  boolean[] keys;
  int[] colors;
  float size;
  float x;
  float y;
  Haken(float x,float y,float size,int[] colors) {
    keys = new boolean[4];
    this.colors = colors;
    this.size = 50*50/size;
    this.x = x;
    this.y = y;
  }
  void display() {
    background(255);
    fill(colors[0],colors[1],colors[2]);
    stroke(colors[0]/2,colors[1]/2,colors[2]/2);
    strokeWeight(2);
    beginShape();
    vertex(x+50*0/size, y-50*48/size);
    vertex(x+50*12/size, y-50*15/size);
    vertex(x+50*47/size, y-50*15/size);
    vertex(x+50*23/size, y+50*7/size);
    vertex(x+50*32/size, y+50*40/size);
    vertex(x+50*0/size, y+50*20/size);
    vertex(x-50*32/size, y+50*40/size);
    vertex(x-50*23/size, y+50*7/size);
    vertex(x-50*47/size, y-50*15/size);
    vertex(x-50*12/size, y-50*15/size);
    endShape(CLOSE);
  }
}
Haken band;
void setup() {
    size(450,600);  
    background(255);  
<<<<<<< HEAD:Experiments/exp1/exp1.pde
    band = new Haken();
    
=======
    band = new Haken(100,100,30,new int[] {255,130,160});
>>>>>>> d6f418c3b7b4a9294d87d8bd0ae53cacf836ad3d:Experiments/Experiments.pde
}

void draw() {
  band.display();
}
