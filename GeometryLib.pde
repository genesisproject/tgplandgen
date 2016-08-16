import megamu.mesh.*;

static class GeomUtils {
  static PVector centroid(MPolygon polygon) {
    return centroid(toVectorArray(polygon.getCoords()));
  }
  
  static PVector centroid(PVector[] polygon) {
    int l = polygon.length;
    float a = signedArea(polygon);
    float sx=0, sy=0;
    for (int i=0; i<l; i++) {
      sx += (polygon[i%l].x + polygon[(i+1)%l].x)
            * (polygon[i%l].x * polygon[(i+1)%l].y - polygon[(i+1)%l].x * polygon[i%l].y);
      sy += (polygon[i%l].y + polygon[(i+1)%l].y)
            * (polygon[i%l].x * polygon[(i+1)%l].y - polygon[(i+1)%l].x * polygon[i%l].y);
    }
    
    float cx = sx * (1/(6*a));
    float cy = sy * (1/(6*a));
    
    return new PVector(cx, cy);
  }
  
  static float signedArea(PVector[] polygon) {
    int l = polygon.length;
    float t = 0;
    for (int i=0; i<l; i++) {
      t += (polygon[i%l].x * polygon[(i+1)%l].y - polygon[(i+1)%l].x * polygon[i%l].y);
    }
    return t * 0.5;
  }
  
  static float[][] toFloatArray(PVector[] points) {
    float[][] points_ = new float[points.length][2];
    for (int i=0; i<points.length; i++) {
      points_[i][0] = points[i].x;
      points_[i][1] = points[i].y;
    }
    return points_;
  }

  static PVector[] toVectorArray(float[][] points) {
    PVector[] points_ = new PVector[points.length];
    for (int i=0; i<points.length; i++) {
      points_[i] = new PVector(points[i][0], points[i][1]);
    }
    return points_;
  }
  
  static PVector[] toVectorArray(MPolygon polygon) {
    return toVectorArray(polygon.getCoords());
  }
  
  static PVector constrainPoint(PVector point, float lx, float ly, float hx, float hy) {
    return new PVector(constrain(point.x, lx, hx), constrain(point.y, ly, hy));
  }
  
  static PVector[] scalePolygon(PVector[] polygon, float scale) {
    PVector[] polygon_ = new PVector[polygon.length];
    for (int i=0; i<polygon.length; i++) {
      polygon_[i] = new PVector(polygon[i].x * scale, polygon[i].y * scale);
    }
    return polygon_;
  }

  static void dump(float[][] points) {
    println("Point array (len: " + points.length + "):");
    for (int i=0; i<points.length; i++) {
      println("\tn:" + i + " x: " + points[i][0] + " y: " + points[i][1]);
    }
  }
  
  static void dump(PVector[] points) {
    dump(toFloatArray(points));
  }
  
  static void drawPolygon(PGraphics g, PVector[] points) {
    g.stroke(0);
    g.strokeWeight(1);
    g.beginShape();
    for (PVector point : points) {
      g.vertex(point.x, point.y);
    }
    g.endShape(CLOSE);
  }
  
  static void drawPolygon(PGraphics g, PVector[] points, float scale) {
    drawPolygon(g, scalePolygon(points, scale));
  }
  
  static void drawPoints(PGraphics g, PVector[] points) {
    g.beginShape(POINTS);
    for (PVector point : points) {
      g.vertex(point.x, point.y);
    }
    g.endShape();
  }
  
  static void drawPoint(PGraphics g, PVector point) {
    g.point(point.x, point.y);
  }
}