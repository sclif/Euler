import 'dart:io';
import 'package:euler/euler.topo.dart';
import 'RightUpDownMoveStrategy.dart';

void main(){
  var t = new File('p082_matrix.txt').readAsStringSync();
//  var t = new File('p082_sample.txt').readAsStringSync();

  var g = Grid.parse(t);
  var height = g.n;

  int minSum = null;

  for (int j = 0; j < height; j++) {
    g = Grid.parse(t);
    var dijkstra = new Dijkstra(g, new RightUpDownMoveStrategy(), (point, box) => point.x == box.m - 1);
    var sum = dijkstra.searchMinimalSumPath(new Point(0, j), minSum);
    if(minSum == null || minSum > sum){
      minSum = sum;
    }
  }
  print('final: $minSum');
}