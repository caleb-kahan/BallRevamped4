import java.util.Arrays;


Ball ball;
Wall wallie;
Wood woodie;
float startX;
float startY;
float startRadius;
ArrayList<PowerUp> powerUps;
void setup() {
  size(450, 600);
  startX = 255;
  startY = 50;
  ball = new NormalBall(startX, startY,25,25);
  wallie = new Wall(200,200,50,100,0);
  woodie = new Wood(270,270,200,200,0);
  PowerUp smallstar = new SmallPowerUp(100,100,10);
  PowerUp bigstar = new BigPowerUp(300,100,10);
  PowerUp lightstar = new WeightlessPowerUp(100,300,10);
  PowerUp heavystar = new HeavyPowerUp(300,300,10);
  powerUps = new ArrayList<PowerUp>();
  powerUps.add(smallstar);
  powerUps.add(bigstar);
  powerUps.add(lightstar);
  powerUps.add(heavystar);
}

void draw() {
  background(255);
  rectMode(CENTER);
  fill(255,0,0);
  rect(startX-1,startY,9,9);
  fill(0);
  text("X",startX-5,startY+4);
  if (ball.y > 600 || ball.y < 0 || ball.x > 450 || ball.x < 0) {
    ball.respawn();
  }
  wallie.display();
  woodie.display();
  for (PowerUp star : powerUps) { 
    star.display();
    if (star.isTouching(ball)) {
      star.use();
    }
  }
  ball.display();
  ball.move();
  stroke(0);
}
void keyPressed() {
  ball.keyPressed();
}
void keyReleased() {
  ball.keyReleased();
}