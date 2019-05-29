class Spikes extends Wall {
  float spikeLevel;
  float spikeSpeed;
  Spikes() {
    super(225,2.5,450,5,0);
    spikeLevel = -10;
    spikeSpeed = .01;
  }
  void display() {
    fill(0);
    stroke(0);
    if (spikeLevel > 21) {
      rect(x,(spikeLevel-21)/2,w,spikeLevel-21);
    }
    fill(50);
    rect(x,spikeLevel-21,w,14);
    fill(110);
    rect(x,spikeLevel-7,w,14);
    fill(160);
    for (float x = 0;x < 450;x+=19.5) {
      triangle(x,spikeLevel,x+19.5, spikeLevel,x+9.75,spikeLevel+25);
    }
  }
  void reset() {
    spikeLevel = -10;
    spikeSpeed = .01;
    l = 15;
  }
}
