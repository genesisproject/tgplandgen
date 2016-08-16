import megamu.mesh.*;

Land land;

PVector[] poly = {new PVector(0, 0), new PVector(1, 0), new PVector(1, 1)};
PVector cent = GeomUtils.centroid(poly);

void setup() {
  size(640, 480);
  background(255);
  stroke(0);
  fill(230);
  randomSeed(0xc0de);
  
  //land = new Land();
  
  float[][] subjPoints_ = {{50, 150}, {200, 50}, {350, 150}, {350, 300},
    {250, 300}, {200, 250}, {150, 350}, {100, 250}, {100, 200}};
  float[][] clipPoints_ = {{100, 100}, {300, 100}, {300, 300}, {100, 300}};
  PVector[] subjPolygon = GeomUtils.toVectorArray(subjPoints_);
  PVector[] clipPolygon = GeomUtils.toVectorArray(clipPoints_);
  noFill();
  GeomUtils.drawPolygon(g, subjPolygon);
  GeomUtils.drawPolygon(g, clipPolygon);
  PVector[] resultPolygon = SutherlandHodgman.clip(subjPolygon, clipPolygon);
}

void draw() {
  //background(255);
  //land.drawUnderlay(this.g);
}

void keyPressed() {
  if (key == 'r') {
    land = new Land();
  }
}