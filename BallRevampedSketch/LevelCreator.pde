public class LevelCreator{
  Level constructLevel(int num) {
    "level"+num+"()";
  }
  Level level1(){
    size(450, 600);
    startX = 255;
    startY = 50;
    ball = new NormalBall(startX, startY,25,25);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(200,200,50,100,0));
    elements.add(new Wood(270,270,200,200,0));
    PowerUp smallstar = new SmallPowerUp(100,100,10);
    PowerUp bigstar = new BigPowerUp(300,100,10);
    PowerUp lightstar = new WeightlessPowerUp(100,300,10);
    PowerUp heavystar = new HeavyPowerUp(300,300,10);
    powerUps = new ArrayList<PowerUp>();
    powerUps.add(smallstar);
    powerUps.add(bigstar);
    powerUps.add(lightstar);
    powerUps.add(heavystar);
    return new Level(num, elements, powerUps, ball);
  }
}