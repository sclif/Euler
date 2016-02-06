import 'package:euler/euler.topo.dart';

class RightUpDownMoveStrategy implements MoveStrategy{
  List<Point> getMoveOptions(Size size, List<Point> path){
    List<Point> options = [];
    var current = path.last;
    var prev = null;
    if(path.length > 1) {
      prev = path[path.length - 2];
    }
    if(current.x < size.m - 1){
      //move to the right:
      options.add(current.right());
    }
    //we don't want to move back in direction
    if((current.y < size.n - 1) && (prev == null || prev.y <= current.y)){
      //move down;
      options.add(current.down());
    }
    //we don't want to move back in direction
    if((current.y > 0) && (prev == null || prev.y >= current.y)){
      //move up
      options.add(current.up());
    }

    return options;
  }
}