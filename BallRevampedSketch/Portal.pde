public class Portal extends EnvironmentElement{
  boolean isTouching(Ball b){
     float closestX = constrain(b.x, x-width/2.0, x+width/2.0);
    float closestY = constrain(b.y, y-height/2.0, y+height/2.0);

    float distanceSq = sq(b.x-closestX) +sq(b.y-closestY);
    return distanceSq < sq(b.radius);
  }
}
