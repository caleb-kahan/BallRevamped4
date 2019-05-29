static class circleIntersection {
  static float[] circleCircleIntersects(float x1, float y1, float x2, float y2, float r1, float r2)
  {
    // Use change of coordinates to get:
    //   Cirlce 1: r1^2 = x^2 + y^2
    //   Circle 2: r2^2 = (x - a)^2 + (y - b)^2
    float a = x2 - x1;
    float b = y2 - y1;

    // Find distance between circles.
    float ds = a*a + b*b;
    float d = sqrt( ds );

    // Ensure that the combined radii lengths are longer than the distance between the circles,
    // i.e. tha the circles are close enough to intersect.
    if (r1 + r2 <= d)
      return null;

    // Ensure that one circle is not inside the other.
    if (d <= abs( r1 - r2 ))
      return null;

    // Find the intersections (formula derivations not shown here).
    float t = sqrt( (d + r1 + r2) * (d + r1 - r2) * (d - r1 + r2) * (-d + r1 + r2) );

    float sx1 = 0.5 * (a + (a*(r1*r1 - r2*r2) + b*t)/ds);
    float sx2 = 0.5 * (a + (a*(r1*r1 - r2*r2) - b*t)/ds);

    float sy1 = 0.5 * (b + (b*(r1*r1 - r2*r2) - a*t)/ds);
    float sy2 = 0.5 * (b + (b*(r1*r1 - r2*r2) + a*t)/ds);

    // Translate to get the intersections in the original reference frame.
    sx1 += x1;
    sy1 += y1;

    sx2 += x1;
    sy2 += y1;

    float[] r = new float[4];
    r[0] = sx1;
    r[1] = sy1;
    r[2] = sx2;
    r[3] = sy2;

    return r;
  }
  static float [] quadFormula(float A, float B, float C) {
    float [] roots = new float[2];
    float discrim = sqrt(B*B-4*A*C);
    roots[0]= (-1*B+discrim)/(2*A);
    roots[1]= (-1*B-discrim)/(2*A);
    return roots;
  }
  static float [] outputFinder(float h, float k, float r, float input, boolean isInputY) {
    if (isInputY) {
      float temp = k;
      k = h;
      h = temp;
    }
    float [] roots = new float[2];
    float constant = sqrt(-1*h*h+2*h*input+r*r-input*input);
    roots[0]=k-constant;
    roots[1]=k+constant;
    return roots;
  }
  static boolean circleInsideRectangle(float cX, float cY, float radius, float rX, float rY, float rW, float rL) {
    float p1X = rX - rW/2;
    float p1Y = rX + rL/2;
    float p2X = rX + rW/2;
    float p2Y = rX + rL/2;
    float p3X = rX - rW/2;
    float p3Y = rX - rL/2;
    float p4X = rX + rW/2;
    float p4Y = rX - rL/2;
    if (dist(cX, cY, p1X, p1Y)<radius && dist(cX, cY, p2X, p2Y)<radius && dist(cX, cY, p3X, p3Y)<radius && dist(cX, cY, p4X, p4Y)<radius)
      return true;
    return false;
  }
  static boolean intersectsRectangle(float cX, float cY, float radius, float rX, float rY, float rW, float rL) {
    float closestX = constrain(cX, rX-rW/2.0, x+rW/2.0);
    float closestY = constrain(cY, rY-rL/2.0, y+rL/2.0);
    float distanceSq = sq(cX-closestX) +sq(cY-closestY);
    return distanceSq < sq(radius);
  }
}

}
