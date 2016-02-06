import 'size.dart';
import 'point.dart';
import 'package:tuple/tuple.dart';

class Grid<T> extends Size{
  List<Tuple2<int, T>> grid = [];

  Grid(this.grid, int m, int n):super(m,n);

  static Grid parse(String str){
    Grid g = new Grid([], 0, 0);
    str.trim().split("\n").forEach((line) {
      var items = line.split(",").map((s) => new Tuple2(int.parse(s), null));
      if(g.m == 0){
        g.m = items.length;
      }
      g.grid.addAll(items);
      g.n++;
    });
    return g;
  }

  Tuple2<int, T> get(Point p){
    int idx = m*p.y + p.x;
    if(idx >= grid.length){
      print("${p.x}:${p.y}");
    }
    return grid[idx];
  }

  void set(Point p, Tuple2<int, T> t){
    int idx = m*p.y + p.x;
    grid[idx] = t;
  }

  void setT(Point p, T t){
    var tuple = this.get(p);
    this.set(p, tuple.withItem2(t));
  }
}