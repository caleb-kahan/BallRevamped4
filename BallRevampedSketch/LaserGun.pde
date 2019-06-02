public class LaserGun extends EnvironmentElement {
  int nextShot;
  Laser l;
  Ball b;
  boolean shootingMode;
  LaserGun(float cenX, float cenY, float angle) {
    super(cenX, cenY,0 , 0, 0);
  }
  void display() {
    ArrayList<float[]> circle1 = new ArrayList<float[]>();
    ArrayList<float[]> circle2 = new ArrayList<float[]>();
    ArrayList<float[]> circle3 = new ArrayList<float[]>();
    float radius = sqrt(12);
    float distSmall = radius*(tan(degrees(30)));
    float distBig = radius*(cos(degrees(30)));


    float c1Y= y-distSmall;
    float c2Y= y-distSmall;
    float c3Y = y + distBig;
    float c3X = x;
    float c1X = x-radius;
    float c2X = x+radius;
    /*loadPixels();
     for (int a = (int)(c1X -radius)-1; a<c1X+radius; a++) {
     for (int b = (int)(c1Y-radius)-1; b<c1Y+radius; b++) {
     if (dist(a, b, c1X, c1Y)<radius)
     circle1.add(new float[]{a, b, pixels[b*width+a]});
     }
     }
     for (int a = (int)(c2X -radius)-1; a<c2X+radius; a++) {
     for (int b = (int)(c2Y-radius)-1; b<c2Y+radius; b++) {
     if (dist(a, b, c2X, c2Y)<radius)
     circle2.add(new float[]{a, b, pixels[b*width+a]});
     }
     }
     for (int a = (int)(c3X -radius)-1; a<c3X+radius; a++) {
     for (int b = (int)(c3Y-radius)-1; b<c3Y+radius; b++) {
     if (dist(a, b, c3X, c3Y)<radius)
     circle3.add(new float[]{a, b, pixels[b*width+a]});
     }
     }*/
    PGraphics pg = createGraphics(20, 20);
    pg.beginDraw();
    pg.background(0, 0, 0, 0);
    pg.translate(10, 10);
    pg.fill(0);
    pg.noStroke();
    float dia = radius*2;
    pg.ellipse(c1X, c1Y, dia, dia);
    pg.ellipse(c2X, c2Y, dia, dia);
    pg.ellipse(c3X, c3Y, dia, dia);
    pg.endDraw();
    PImage msk = pg.get();
    PImage umb = get((int)(x-10), (int)(y-10), 20, 20);
    umb.mask(msk);
  }
  boolean isTouching(Ball ball) {
    return false;
  }
}
