import 'package:euler/euler.topo.dart';

class RightDownMoveStrategy implements MoveStrategy{
  List<Point> getMoveOptions(Size size, List<Point> path){
    List<Point> options = [];
    var current = path.last;
    if(current.x < size.m - 1){
      //move to the right:
      options.add(current.right());
    }
    if(current.y < size.n - 1){
      //move down;
      options.add(current.down());
    }

    return options;
  }
}