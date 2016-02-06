import 'dart:io';
import 'package:euler/euler.topo.dart';
import 'RightDownMoveStrategy.dart';

void main() {
  var t = new File('p081_matrix.txt').readAsStringSync();
//  var t = new File('p081_sample.txt').readAsStringSync();
  var g = Grid.parse(t);

  var dijkstra = new Dijkstra(g, new RightDownMoveStrategy(), (point, box) => point.x == box.m - 1 && point.y == box.n - 1);
  var minSum = dijkstra.searchMinimalSumPath(Point.zero());

  print(minSum);
}