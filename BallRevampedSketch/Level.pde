class Level {
  int levelNumber;
  ArrayList<EnvironmentElement> elements;
  ArrayList<PowerUp> powerUps;
  Ball ball;
  float startX;
  float startY;
  int fuseIndex;
  int woodIndex;
  int[] colors;
  boolean isDark;
  boolean isFlipped;
  boolean nextLevel;


  Level(int levelNum, ArrayList<EnvironmentElement> elements, ArrayList<PowerUp> powerUps, Ball ball, float x, float y, int fuseIdx, int woodIdx, boolean isdark, int[] colors) {
    levelNumber = levelNum;
    this.elements = elements;
    this.powerUps = powerUps;
    this.ball = ball;
    startX = x;
    startY = y;
    fuseIndex = fuseIdx;
    woodIndex = woodIdx;
    isDark = isdark;
    this.colors = colors;
  }

  void run() {
    if (isFlipped) {
      ball.x = 450 - ball.x;
      ball.y = 600 - ball.y;
    }
    for (EnvironmentElement element : elements) {
      if (element instanceof Wood) {
        ball = ((Wood)element).explode(ball);
      }
      if (element.isTouching(ball) && !(element instanceof ForceField)) {
        if (element instanceof Portal && !((Portal)element).isFake) {
          nextLevel = true;
          deaths--;
        }
        if (element instanceof Wood && ball instanceof RazorBall) {
          ((Wood)element).isDestroyed = true;
        } else if (!(element instanceof Stick) && (!(element instanceof Wood) || (element instanceof Wood && !((Wood)element).isDestroyed))) {
          respawn();
        } else if (element instanceof Stick) {
          ((Stick)element).ballTouched = true;
        }
      } else if (element instanceof ForceField) {
        if (element.isTouching(ball) && !((ForceField)element).isDeactivated) {
          respawn();
        }
      }
      if (element instanceof Stick && (element.isTouching(ball) != ((Stick)element).ballTouched) && ((((Stick)element).ballAbove && ball.y > element.y) || 
        (!((Stick)element).ballAbove && ball.y < element.y)) ) {
        ((Stick)element).ballAbove = !((Stick)element).ballAbove;
        ((Stick)element).ballTouched = false;
        if (((Stick)element).passesLeft > 0) {
          ((Stick)element).passesLeft--;
        }
      }
      if (element instanceof Stick && ((Stick)element).passesLeft == 0) {
        for (EnvironmentElement Element : elements) {
          if (Element instanceof ForceField) {
            ((ForceField)Element).isDeactivated = true;
          }
        }
      }
      if (element instanceof LaserGun) {
        LaserGun ele = (LaserGun)element;
        if (ele.las!=null && ele.las.isTouching(ball)) {
          respawn();
          ele.las=null;
        }
      }
    }

    for (PowerUp powerup : powerUps) { 
      if (powerup.isTouching(ball)) {
        if (powerup instanceof FusePowerUp) {
          ( (FusePowerUp)powerup).use((Fuse)(elements.get(fuseIndex)));
        } else if (powerup instanceof FlipPowerUp) {
          ((FlipPowerUp)powerup).use(this);
        } else {
          if (powerup instanceof LightPowerUp) {
            isDark = false;
          }
          ball = powerup.use(ball);
        }
      }
    }
    if (woodIndex > -1 && fuseIndex > -1) {
      ((Wood)elements.get(woodIndex)).explode((Fuse)elements.get(fuseIndex));
    }
    if (ball instanceof LaserBall) {
      Laser[] lasers = ((LaserBall)ball).lasers;
      for (Laser laser : lasers) {
        if (laser != null) {
          for (EnvironmentElement element : elements) {
            if (element instanceof Lense && laser.isTouching((Lense)element)) {
              ((Lense)element).isDestroyed = true;
            }
          }
        }
      }
    }
    if (woodIndex > -1 && fuseIndex > -1) {
      ((Wood)elements.get(woodIndex)).explode((Fuse)elements.get(fuseIndex));
    }
    if (isFlipped) {
      ball.x = 450 - ball.x;
      ball.y = 600 - ball.y;
    }
    ball.move();
    ball.display();
    if (isDark) {
      stroke(0);
      strokeWeight(750);
      noFill();
      ellipse(ball.x, ball.y, 1000, 1000);
      strokeWeight(1);
    }
    if (ball.isDead) respawn();
  }
  void display() {
    background(colors[0], colors[1], colors[2]);
    rectMode(CENTER);

    fill(255, 0, 0);
    rect(startX-1, startY, 9, 11);
    textSize(12);
    fill(0);
    text("X", startX-5, startY+4);
    fill(145);
    for (EnvironmentElement element : elements) {
      element.display();
    }
    for (PowerUp powerup : powerUps) {
      powerup.display();
    }
    for (EnvironmentElement element : elements) {
      if (element instanceof Spikes ) {
        element.display();
        ((Spikes)element).spikeLevel+= ((Spikes)element).spikeSpeed;
        ((Spikes)element).spikeSpeed += .0017;
        element.l = ((Spikes)element).spikeLevel+25;
        element.y = element.l/2;
      }
    }
  }  
  void respawn() {
    deaths++;
    ball = new NormalBall(startX, startY, 24);
    this.isFlipped = false;
    for (PowerUp powerup : powerUps) {
      powerup.isUsed = false;
      if (powerup instanceof LightPowerUp) {
        isDark = true;
      }
    }
    for (EnvironmentElement element : elements) {
      if (element instanceof Wood) {
        ((Wood)element).isDestroyed = false;
      }
      if (element instanceof Fuse) {
        ((Fuse)element).reset();
      }
      if (element instanceof Stick) {
        ((Stick)element).passesLeft = 5;
        ((Stick)element).ballAbove = true;
        ((Stick)element).ballTouched = false;
      }
      if (element instanceof Lense) {
        ((Lense)element).isDestroyed=false;
      }
      if (element instanceof ForceField) {
        ((ForceField)element).isDeactivated = false;
      }
      if (element instanceof Spikes) {
        ((Spikes)element).reset();
      }
      if (element instanceof LaserGun)
        ((LaserGun)element).reset(ball);
    }
  }
}
