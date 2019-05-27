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
}
