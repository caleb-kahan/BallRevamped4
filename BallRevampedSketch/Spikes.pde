class Spikes extends Wall {
  float spikeLevel;
  Spikes() {
    super(225,10,450,10,0);
  }
  void display() {
    super.display();
    fill(160);
    for (float x = 0;x < 600;x+=25.5) {
      triangle(x,spikeLevel,x+25.5, spikeLevel,x+12.75,spikeLevel+30);
    }
  }
}