import 'dart:io';
import 'package:euler/euler.topo.dart';
import 'LeftRightUpDownMoveStrategy.dart';

void main(){
  var t = new File('p083_matrix.txt').readAsStringSync();
//  var t = new File('p083_sample.txt').readAsStringSync();

  var g = Grid.parse(t);
  var dijkstra = new Dijkstra(g, new LeftRightUpDownMoveStrategy(), (point, box) => point.x == box.m - 1 && point.y == box.n - 1);
  var minSum = dijkstra.searchMinimalSumPath(Point.zero(), double.MAX_FINITE.toInt());

  print(minSum);
}