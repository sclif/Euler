import 'grid.dart';
import 'point.dart';
import 'moveStrategy.dart';

typedef bool FinishFunction(Point p, Size box);

min(Iterable seq) =>
    seq.fold(double.MAX_FINITE, (prev, element) => prev.compareTo(element) > 0 ? element : prev);


class Dijkstra{
  Grid _grid;
  MoveStrategy _crawler;
  FinishFunction _ff;

  List<Point> _path;
  int _initSum;

  Dijkstra(this._grid, this._crawler, this._ff){}

  int searchMinimalSumPath(Point start, [int initSum]){
    if(initSum == null) {
      _searchInitialSumPathValues(start);
    }else{
      this._initSum = initSum;
    }
//    print('initial min sum: ${this.sum}');
    _searchMinimalPath(0, start, []);
//    print(this.sum);
//    print('');
    return this.sum;
  }

  int get sum => _initSum == null ? _grid.get(_path.last).item2 : _initSum;
  List<Point> get path => _path;

  void _searchMinimalPath(int s, Point next, List<Point> path){
    path.add(next);
    var t = _grid.get(next);
    s += t.item1;
    if(t.item2 == null || t.item2 > s){
      /*if(t.item2 != null) {
        print('[$next] new min. ${t.item2} => $s');
      }*/
      _grid.setT(next, s);
    }else{
//      print('[$next] Rejected by minNod. Depth: ${path.length}. min=${t.item2} < S=$sum');
      return;
    }
    if(s > this.sum){
//    print('[$next] Rejected by minSum. Depth: ${path.length}. S=$s');
      return;
    }
    if(_ff(next, _grid)){
      _path = path;
      _initSum = null;
      return;
    }
    var options = _crawler.getMoveOptions(_grid, path);
    options.forEach((p) {
      var pathDup = new List.from(path);
      _searchMinimalPath(s, p, pathDup);
    });
  }

  void _searchInitialSumPathValues(Point start){
    List<Point> path = [start];
    var options = _crawler.getMoveOptions(_grid, path);
    while(_ff(path.last, _grid) == false){
      int minValue = min(options.map((x) => _grid.get(x).item1));
      Point minPoint = options.where((x) => _grid.get(x).item1 == minValue).first;
      path.add(minPoint);

      options = _crawler.getMoveOptions(_grid, path);
    }
    _path = path;
    var minSum = path.map((a) => _grid.get(a).item1).reduce((a,b) => a+b);
    _grid.setT(_path.last, minSum);
  }
}