class LevelCreator {
  LevelCreator() {
  }
  Level constructLevel(int num) {
    switch(num) {
      case 1:
        return level1();
      default :
        return leveltest();
    }
  }
  Level leveltest() {
    float startX = 255;
    float startY = 50;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    //elements.add(new Wood(270, 270, 100, 100, 0));
    elements.add(new Wall(440, 300, 20, 580, 0)); 
    elements.add(new Wall(10, 300, 20, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 20, 0)); 
    elements.add(new Wall(225, 590, 450, 20, 0)); 
    //elements.add(new Portal(400, 500));
    //elements.add(new Fuse(new float[] {225, 150, 150, 150, 150, 300, 250, 300}));
    //elements.add(new ForceField(350, 350, 100));
   // elements.add(new Stick(350, 150, 100));
    elements.add(new Lense(200, 200, false));
    //elements.add(new Spikes());
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    /*powerUps.add(new SmallPowerUp(100, 100, 10));
    powerUps.add(new BigPowerUp(150, 100, 10));
    powerUps.add(new WeightlessPowerUp(100, 300, 10));
    powerUps.add(new HeavyPowerUp(100, 400, 10));
    powerUps.add(new RazorPowerUp(100, 500, 10));
    powerUps.add(new BombPowerUp(200, 100, 10));
    */

    powerUps.add(new LaserPowerUp(300, 400, 10));
    /*powerUps.add(new FusePowerUp(225, 150, 10));
    powerUps.add(new FlipPowerUp(100, 150, 10));*/
    //powerUps.add(new LightPowerUp(100, 150, 10));
    return new Level(0, elements, powerUps, ball, startX, startY, -1, -1, false,true,new int[]{255,255,255}); //if you uncomment out everything, change -1,-1 to 6,0
  }
  Level level1() {
    float startX = 65;
    float startY = 70;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 20, 580, 0)); 
    elements.add(new Wall(10, 300, 20, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 20, 0)); 
    elements.add(new Wall(225, 590, 450, 20, 0)); 
    elements.add(new Portal(350, 510));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(1, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
}
