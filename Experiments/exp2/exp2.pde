size(1000,1000);
background(255);
pushMatrix();
translate(500,500);
fill(153,50,204);
rectMode(CENTER);
rect(0,0,200,200);
fill(75,0,130);
rect(0,0,175,175);
for(float x =-95; x<95;x+=0.5){
  point(x,15*cos(x/20));
}
for(float y =-95; y<95;y+=0.5){
  point(15*sin(y/20),y);
}
popMatrix();
