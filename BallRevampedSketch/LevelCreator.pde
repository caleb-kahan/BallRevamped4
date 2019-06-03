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
      case 15:
        return level15();
      case 16:
        return level16();
      case 17:
        return level17();
      case 18:
        return level18();
      case 19:
        return level19();
      case 20:
        return level20();
      case 21:
        return level21();
      case 22:
        return level22();
      case 23:
        return level23();   
      default :
        return leveltest();
    }
  }
  Level leveltest() {
    float startX = 255;
    float startY = 50;
    Ball ball = new NormalBall(startX, startY,24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    //elements.add(new Wood(270, 270, 100, 100, 0));
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    elements.add(new LaserGun(200,200,90,ball));
    //elements.add(new Portal(400, 500));
    //elements.add(new Fuse(new float[] {225, 150, 150, 150, 150, 300, 250, 300}));
    //elements.add(new ForceField(350, 350, 100));
   // elements.add(new Stick(350, 150, 100));
    //elements.add(new Lense(200, 200, false));
    //elements.add(new Spikes());
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    /*powerUps.add(new SmallPowerUp(100, 100, 10));
    powerUps.add(new BigPowerUp(150, 100, 10));
    powerUps.add(new WeightlessPowerUp(100, 300, 10));
    powerUps.add(new HeavyPowerUp(100, 400, 10));
    powerUps.add(new RazorPowerUp(100, 500, 10));*/
    //powerUps.add(new BombPowerUp(200, 100, 10));
    //*/

    //powerUps.add(new LaserPowerUp(300, 400, 10));
    /*powerUps.add(new FusePowerUp(225, 150, 10));
    powerUps.add(new FlipPowerUp(100, 150, 10));*/
    //powerUps.add(new LightPowerUp(100, 150, 10));
    //powerUps.add(new BurningPowerUp(200,200,30,10));
    return new Level(24, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{255,255,255}); //if you uncomment out everything, change -1,-1 to 6,0
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
    return new Level(1, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{0,0,110});
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
    return new Level(2, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{0,0,110});
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
    return new Level(3, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{0,0,110});
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
    return new Level(4, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{0,0,110});
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
    return new Level(5, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{0,0,110});
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
    return new Level(6, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{0,0,110});
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
    return new Level(7, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{0,0,110});
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
    return new Level(8, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{0,0,110});
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
    return new Level(9, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{0,0,110});
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
    return new Level(10, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{214,202,44});
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
    return new Level(11, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{214,202,44});
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
    return new Level(12, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{214,202,44});
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
    return new Level(13, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{214,202,44});
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
    return new Level(14, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{214,202,44});
  }
  Level level15() {
    float startX = 81;
    float startY = 523;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(145,390,15,400,0));  
    elements.add(new Wall(280,200,15,410,0)); 
    elements.add(new Wall(356,400,150,15,0));
    elements.add(new Portal(360,505));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new BurningPowerUp(81,465,30,10));
    return new Level(15, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{139,22,22});
  }
  Level level16() {
    float startX = 384;
    float startY = 530;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(325,500, 15,185,0));  
    elements.add(new Wall(211, 345, 15,185,0));  
    elements.add(new Wall(114, 360, 15,450,0));  
    elements.add(new Wall(325, 263, 245,20,0));  
    elements.add(new Wall(209, 144, 210,20,0));  

    elements.add(new Portal(58,540));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new WeightlessPowerUp(385, 414, 10));
    return new Level(16, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{139,22,22});
  }
  Level level17() {
    float startX = 60;
    float startY = 75;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(315,130, 15,260,0));  
    elements.add(new Wood(375,250, 120,12,0));
    elements.add(new Fuse(new float[] {190, 250, 190,350,318,350,318, 250}));

    elements.add(new Portal(375,60));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new FusePowerUp(190, 250, 10));
    return new Level(17, elements, powerUps, ball, startX, startY, 6, 5, false,new int[]{53,63,23});
  }
  Level level18() {
    float startX = 375;
    float startY = 500;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(300,355, 15,450,0));  
    elements.add(new Wall(155,240, 15,450,0));
    elements.add(new Wood(80,130, 140,12,0));

    elements.add(new Portal(85,70));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new BombPowerUp(375, 390, 10));
    return new Level(18, elements, powerUps, ball, startX, startY, -1, -1, false,new int[]{53,63,23});
  }
  Level level19() {
    float startX = 55;
    float startY = 80;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(140,160,250,18,0));  
    elements.add(new Wall(320,310, 250,18,0));
    elements.add(new Wall(140,465, 250,18,0));
    elements.add(new Spikes());
    elements.add(new Portal(205,540));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    return new Level(19, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{178,19,102});
  }
  Level level20() {
    float startX = 375;
    float startY = 65;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(150,170,15,325,0));  
    elements.add(new Wall(316,220, 15,425,0));
    elements.add(new ForceField(235, 180, 155));
    elements.add(new Stick(80, 225, 150));
    elements.add(new Portal(232,92));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new HeavyPowerUp(375,180,10));
    return new Level(20, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{200,200,200});
  }
  Level level21() {
    float startX = 100;
    float startY = 450;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(140,270,15,15,0));  
    elements.add(new Wall(205,410,15,15,0)); 
    elements.add(new Wall(340,410,15,15,0));
    elements.add(new Wall(300,150,15,300,0));
    elements.add(new Lense(80, 270, false));
    elements.add(new Lense(270, 410, false));
    elements.add(new Lense(366, 166, false));
    elements.add(new Portal(375,75));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new LaserPowerUp(253,117,10));
    return new Level(21, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{200,200,200});
  }
  Level level22() {
    float startX = 80;
    float startY = 100;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(156,210,15,420,0));  
    elements.add(new Wall(235,290,153,15,0)); 
    elements.add(new Wall(370,160,150,15,0));
    elements.add(new Lense(303, 226, true));
    elements.add(new Lense(303, 86, true));
    elements.add(new Portal(375,79));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new LaserPowerUp(304,438,10));
    powerUps.add(new FlipPowerUp(119,206,10));
    powerUps.add(new FlipPowerUp(41,407,10));
    return new Level(22, elements, powerUps, ball, startX, startY, -1, -1,false,new int[]{200,200,200});
  }
  Level level23() {
    float startX = 226;
    float startY = 63;
    Ball ball = new NormalBall(startX, startY, 24);
    ArrayList<EnvironmentElement> elements = new ArrayList<EnvironmentElement>();
    elements.add(new Wall(440, 300, 15, 580, 0)); 
    elements.add(new Wall(10, 300, 15, 580, 0)); 
    elements.add(new Wall(225, 10, 450, 15, 0)); 
    elements.add(new Wall(225, 590, 450, 15, 0)); 
    
    elements.add(new Wall(355,100,250,12,45));  
    elements.add(new Wall(176,102,270,12,45)); 
    elements.add(new Wall(100,245,260,12,45));
    elements.add(new Wall(185,425,200,12,45)); 
    elements.add(new Wall(85,420,200,12,45));
    elements.add(new Portal(60,300));
    ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
    powerUps.add(new SmallPowerUp(80,100,10));
    powerUps.add(new LightPowerUp(348,340,10));
    return new Level(23, elements, powerUps, ball, startX, startY, -1, -1,true,new int[]{51,153,255});
  }
}
