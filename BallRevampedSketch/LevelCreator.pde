class LevelCreator {
  LevelCreator() {
  }
  Level constructLevel(int num) {
    switch(num) {
      case 1:
        return level1();
      case 2:
        return level2();
      case 3:
        return level3();
      case 4:
        return level4();
      case 5:
        return level5();
      case 6:
        return level6();
      case 7:
        return level7();
      case 8:
        return level8();
      case 9:
        return level9(); 
      case 10:
        return level10();
      case 11:
        return level11();
      case 12:
        return level12();
      case 13:
        return level13();
      case 14:
        return level14(); 
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
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
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
    powerUps.add(new RazorPowerUp(100, 500, 10));*/
    powerUps.add(new BombPowerUp(200, 100, 10));
    //*/

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
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    elements.add(new Portal(350, 510));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(1, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level2() {
    float startX = 65;
    float startY = 70;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    elements.add(new Wall(100, 340, 225, 15, 0)); 
    elements.add(new Portal(100, 525));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(2, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level3() {
    float startX = 65;
    float startY = 70;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450,15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    elements.add(new Wall(286, 71, 15, 141, 0)); 
    elements.add(new Wall(286,494 , 15, 212, 0)); 
    elements.add(new Wall(358,141,164,15, 0)); 
    elements.add(new Wall(358,388 ,164,15,0));
    elements.add(new Wood(286, 265, 246, 15, 90));
    elements.add(new Portal(358, 265));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new RazorPowerUp(125, 445, 10));
    return new Level(3, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level4() {
    float startX = 225;
    float startY = 70;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    elements.add(new Wall(150, 494, 15, 211, 0)); 
    elements.add(new Wall(300, 494, 15, 211, 0)); 
    elements.add(new Portal(75, 525));
    elements.add(new Portal(225, 525));
    elements.add(new Portal(375, 525));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(4, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level5() {
    float startX = 210;
    float startY = 315;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    elements.add(new Wood(100, 60, 100, 15, 90));
    elements.add(new Wood(150, 100, 100, 15, 0));
    elements.add(new Wood(200, 60, 100, 15, 90));
    elements.add(new Wall(55, 330, 80, 15, 0)); 
    elements.add(new Wall(375, 330, 125, 15, 0)); 
    elements.add(new Portal(150, 55));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new RazorPowerUp(340, 520, 10));
    return new Level(5, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level6() {
    float startX = 60;
    float startY = 55;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    elements.add(new Wall(75, 285, 120, 15, 0)); 
    elements.add(new Wall(360, 285, 160, 15, 0));
    elements.add(new Wall(125, 510, 15, 150, 0)); 
    elements.add(new Wall(290, 510, 15, 150, 0));
    elements.add(new ForceField(210, 440, 175));
    elements.add(new Stick(205, 285, 160));
    elements.add(new Portal(220, 550));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(6, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level7() {
    float startX = 220;
    float startY = 530;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(105, 110, 180, 15, 0)); 
    elements.add(new Wall(380, 110, 120, 15, 0));
    elements.add(new Wall(95, 170, 160, 15, 0)); 
    elements.add(new Wall(170, 250, 310, 15, 0));
    
    elements.add(new Wall(40, 340, 50, 15, 0)); 
    elements.add(new Wall(325, 405, 240, 15, 0));
    elements.add(new Wall(40, 475, 50, 15, 0)); 
    elements.add(new Wall(40, 525, 55, 15, 0));
    
    elements.add(new Wall(390, 475, 90, 15, 0)); 
    elements.add(new Wall(410, 525, 55, 15, 0));

    elements.add(new Portal(220, 55));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(7, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level8() {
    float startX = 60;
    float startY = 155;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(100, 100, 185, 15, 0)); 
    elements.add(new Wall(340, 420, 185, 15, 0));
    elements.add(new Portal(53, 55));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new SmallPowerUp(345, 520, 10));
    return new Level(8, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level9() {
    float startX = 80;
    float startY = 95;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(60, 235, 112, 15, 0)); 
    elements.add(new Wall(310, 235, 262, 15, 0));
    elements.add(new Wall(135,410, 247, 15, 0)); 
    elements.add(new Wood(350, 410, 170, 12, 0));
    elements.add(new Portal(70, 500));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new SmallPowerUp(345, 120, 10));
    powerUps.add(new RazorPowerUp(230, 330, 10));
    return new Level(9, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{0,0,110});
  }
  Level level10() {
    float startX = 105;
    float startY = 95;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(90, 285, 160, 15, 0)); 
    elements.add(new Wall(375, 285, 160, 15, 0));
    elements.add(new Wall(374,435, 320, 15, 65)); 
    elements.add(new Portal(105, 490));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new FlipPowerUp(230, 275, 10));
    return new Level(10, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{214,202,44});
  }
  Level level11() {
    float startX = 75;
    float startY = 410;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(115, 235, 470, 20,65));  
    elements.add(new Wall(374,435, 320, 15, 65));
    
    elements.add(new Wall(115, 235, 470, 20,65));  
    elements.add(new Wall(374,435, 320, 15, 65)); 
    elements.add(new Portal(357, 113));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(11, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{214,202,44});
  }
  Level level12() {
    float startX = 370;
    float startY = 80;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(90, 514, 195, 10,45));  
    elements.add(new Wall(360,520, 195, 10,-45));
    elements.add(new Wall(275, 175, 25, 305,0));  
    elements.add(new Wall(140,175, 25, 305,0));
    elements.add(new Wood(75, 150, 120, 12, 0));
    elements.add(new Wood(75, 210, 120, 12, 0));
    
    elements.add(new ForceField(355, 300, 150));
    elements.add(new Stick(360, 150, 150));
    elements.add(new Portal(75,75));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new RazorPowerUp(210, 65, 10));
    return new Level(12, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{214,202,44});
  }
  Level level13() {
    float startX = 74;
    float startY = 82;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(350, 500, 15,160,0));  
    elements.add(new Wall(100,175, 160, 15,0));

    elements.add(new Portal(397,540));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new BigPowerUp(146, 428, 10));
    powerUps.add(new BigPowerUp(176, 380, 10));
    powerUps.add(new BigPowerUp(206, 341, 10));
    powerUps.add(new BigPowerUp(243, 311, 10));
    powerUps.add(new BigPowerUp(288, 275, 10));
    powerUps.add(new BigPowerUp(330, 238, 10));
    powerUps.add(new BigPowerUp(347, 196, 10));
    powerUps.add(new BigPowerUp(326, 154, 10));
    powerUps.add(new BigPowerUp(300, 104, 10));
    return new Level(13, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{214,202,44});
  }
  Level level14() {
    float startX = 81;
    float startY = 475;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(90, 240,210,10,45));  
    elements.add(new Wall(365,265, 210, 10,45));
    elements.add(new Wall(370,400, 220, 10,45));
    
    elements.add(new Wall(160,269, 15, 150,0));
    elements.add(new Wall(295,269, 15, 150,0));

    elements.add(new Portal(228,97));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new FlipPowerUp(223, 204, 10));
    powerUps.add(new FlipPowerUp(223, 276, 10));
    powerUps.add(new FlipPowerUp(223, 355, 10));
    return new Level(14, elements, powerUps, ball, startX, startY, -1, -1, false,false,new int[]{214,202,44});
  }
}