import megamu.mesh.*;

int land_nPoints = 255;

class Land {
  Land() {
    generatePoints();
    voronoiPolygons = new ArrayList<PVector[]>();
    updateVoronoi();
    //relaxPoints();
    //relaxPoints(); // implies updateVoronoi();
  }
  
  void generatePoints() {
    points = randomPoints(land_nPoints, 640, 480);
    //PVector[] points = {new PVector(200, 200), new PVector(220, 200), new PVector(230, 200), new PVector(225, 225), new PVector(230, 230)};
    //this.points = points;
  }
  
  void updateVoronoi() {
    voronoi = new Voronoi(GeomUtils.toFloatArray(points));
    for (MPolygon polygon : voronoi.getRegions()) {
      //voronoiPolygons.add(GeomUtils.rectClipPolygon(GeomUtils.toVectorArray(polygon),
        //0, 0, width, height));
    }
  }
  
  void drawUnderlay(PGraphics g) {
    for (PVector[] polygon : voronoiPolygons) {
      g.stroke(0);
      g.strokeWeight(1);
      fill(255);
      GeomUtils.drawPolygon(g, polygon);
      g.strokeWeight(2);
      g.stroke(0x9B, 0x14, 0x14);
      PVector centroid = GeomUtils.centroid(polygon);
      
      GeomUtils.drawPoint(g, centroid);
      
      g.stroke(0xCE, 0x4B, 0x4B);
      g.strokeWeight(3);
      //g.point(centroid.x, centroid.y);
    }
    
    g.stroke(0);
    g.strokeWeight(4);
    GeomUtils.drawPoints(g, points);
  }
  
  PVector[] points;
  Voronoi voronoi;
  ArrayList<PVector[]> voronoiPolygons;
}