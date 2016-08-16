import megamu.mesh.*;

PVector[] randomPoints(int nPoints, float boundX_top, float boundY_top) {
  PVector[] points = new PVector[nPoints];
  for (int i=0; i<nPoints; i++) {
    points[i] = new PVector(random(boundX_top), random(boundY_top));
  }
  return points;
}