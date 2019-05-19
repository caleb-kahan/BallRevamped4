float angle;
void setup() {
  size(1000, 1000);
  rectMode(CENTER);
  angle =0;
}
void draw() {
  background(255);
  pushMatrix();
  translate(500, 500);
  
  fill(75, 0, 130);
  rect(0, 0, 180, 180);
  rotate(radians(angle));
  stroke(0,255,255);
  for (float x =-40*PI; x<40*PI; x+=0.25) {
    point(x, 10*cos(x/25));
  }
  for (float y =-40*PI; y<40*PI; y+=0.25) {
    point(10*sin(y/25), y);
  }
  rotate(radians(-angle));
  stroke(153, 50, 204);
  for(float y = 0; y>=-20;y-=0.5){
    line(-110,y-90,110,y-90);
  }
  for(float y = 0; y<=20;y+=0.5){
    line(-110,y+90,110,y+90);
  }
  for(float x = 0; x>=-20;x-=0.5){
    line(x-90,-110,x-90,110);
  }
  for(float x = 0; x<=20;x+=0.5){
    line(x+90,-110,x+90,110);
  }
  stroke(255);
  
   for(float y = -20; y>=-40;y-=0.5){
    line(-110,y-90,110,y-90);
  }
  for(float y = 20; y<=40;y+=0.5){
    line(-110,y+90,110,y+90);
  }
  for(float x = -20; x>=-40;x-=0.5){
    line(x-90,-110,x-90,110);
  }
  for(float x = 20; x<=40;x+=0.5){
    line(x+90,-110,x+90,110);
  }
  popMatrix();
  angle++;
}
