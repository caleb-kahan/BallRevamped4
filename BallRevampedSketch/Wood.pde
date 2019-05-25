public class Wood extends Wall {
  boolean isDestroyed;
  Wood(float cenX, float cenY, float wid, float heigh, float angle) {
    super(cenX, cenY, wid, heigh, angle);
    isDestroyed=false;
  }
  void display() {
    if (!isDestroyed) {
      pushMatrix();
      color from = color(245, 222, 179);
      color to = color(160, 82, 45);
      translate(x, y);
      rotate(radians(angleRotation));  
      if (w>l) {
        for (float i = -l/2, j=0; i<l/2; i+=l/200, j+=0.005) {
          color lerp = lerpColor(from, to, j);
          stroke(lerp);
          line(-w/2, i, w/2, i);
        }
      }
      else {
        for (float i = -w/2, j=0; i<w/2; i+=w/200, j+=0.005) {
          color lerp = lerpColor(from, to, j);
          stroke(lerp);
          line(-l/2, i, l/2, i);
        }
      }
      popMatrix();
    }
  }
  Ball explode(Ball ball) {
    if (ball instanceof BombBall && ((BombBall)ball).time < 0) {
      float newBallX = ball.x-x;
      float newBallY = ball.y-y;
      float angle = atan(newBallY/newBallX);
      if(newBallX<0) angle+=PI;
      float distance= sqrt(sq(newBallX)+sq(newBallY));
      float subAngle = radians(angleRotation);
      newBallX= distance*(cos(angle)*cos(subAngle) + sin(angle)*sin(subAngle));
      newBallY = distance*(sin(angle)*cos(subAngle) - cos(angle)*sin(subAngle));      
      float closestX = constrain(newBallX, -w/2.0, w/2.0);
      float closestY = constrain(newBallY, -l/2.0, l/2.0); 
      float distanceSq = sq(newBallX-closestX) +sq(newBallY-closestY);  
      if (distanceSq < sq(3*ball.radius)) {
        isDestroyed = true;
      }
      float xVel = ball.xSpeed;
      float yVel = ball.ySpeed;
      ball = new NormalBall(ball.x, ball.y,24);
      ball.xSpeed = xVel;
      ball.ySpeed = yVel;
    }
    return ball;
  }
}
