import 'dart:html';
import 'dart:math';


const int C_WIDTH = 800;
const int C_HEIGHT = 600;

class Point2D {
  double x, y;
  Point2D(this.x, this.y);
}

class Point3D {
  num x;
  num y;
  num z;
  
  Point3D(this.x, this.y, this.z);
  
  Point3D rotateX(a) {
    double y, z;
    y = this.y * cos(a) - this.z * sin(a);
    z = this.y * sin(a) + this.z * cos(a);
    return new Point3D(this.x, y, z);
  }
  
  Point3D rotateY(a) {
    double x, z;
    z = this.z * cos(a) - this.x * sin(a);
    x = this.z * sin(a) + this.x * cos(a);
    return new Point3D(x, this.y, z);
  }
  
  Point3D rotateZ(a) {
    double x, y;
    x = this.x * cos(a) - this.y * sin(a);
    y = this.x * sin(a) + this.y * cos(a);
    return new Point3D(x, y, this.z);
  }
  
  Point2D project(width, height, fov, distance) {
    double factor, x, y;
    factor = fov / (distance + this.z);
    x = this.x * factor * width / 2;
    y = this.y * factor * height / 2;
    return new Point2D(x, y);
  }
}

class Shape {
  List<Point3D> vertices;
  List<List<int>> faces;
  Shape(this.vertices, this.faces);
}

final Shape cube = new Shape(
  [
    new Point3D(-1, 1, -1),
    new Point3D(1, 1, -1),
    new Point3D(1, -1, -1),
    new Point3D(-1, -1, -1), 
    new Point3D(-1, 1, 1), 
    new Point3D(1, 1, 1), 
    new Point3D(1, -1, 1), 
    new Point3D(-1, -1, 1), 
  ],  
  [[0,1,2,3],[1,5,6,2],[5,4,7,6],[4,0,3,7],[0,4,5,1],[3,2,6,7]]
);


final CanvasRenderingContext2D context =
  (querySelector("#canvas") as CanvasElement).context2D;


void main() {
  window.requestAnimationFrame(loop);
}

num start;
void loop(ts) {
  context.fillRect(0, 0, C_WIDTH, C_HEIGHT);
}