public class LevelCreator{
  LevelCreator(){
    
  }
  Level constructLevel(int num) {
    Level level;
    switch(num){
      case 1:
        level = level1();
      default:
        level = level1();
    }
    return level;   
  }
  Level level1(){
    size(450, 600);
    int startX = 255;
    int startY = 50;
    Ball ball = new NormalBall(startX, startY,25,25);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(200,200,50,100,0));
    elements.add(new Wood(270,270,200,200,0));
    elements.add(new Wall(440,300,20,290,0)); 
    elements.add(new Wall(10,300,20,290,0)); 
    elements.add(new Wall(225,10,450,20,0)); 
    elements.add(new Wall(225,690,450,20,0)); 
    elements.add(new Portal(400,500));
    PowerUp smallstar = new SmallPowerUp(100,100,10);
    PowerUp bigstar = new BigPowerUp(300,100,10);
    PowerUp lightstar = new WeightlessPowerUp(100,300,10);
    PowerUp heavystar = new HeavyPowerUp(300,300,10);
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(smallstar);
    powerUps.add(bigstar);
    powerUps.add(lightstar);
    powerUps.add(heavystar);
    return new Level(1, elements, powerUps, ball);
  }
}
