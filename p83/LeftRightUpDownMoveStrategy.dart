import 'package:euler/euler.topo.dart';

class LeftRightUpDownMoveStrategy implements MoveStrategy{
  List<Point> getMoveOptions(Size size, List<Point> path){
    List<Point> options = [];
    var current = path.last;
    var prev = null;
    if(path.length > 1) {
      prev = path[path.length - 2];
    }
    //we don't want to move back in direction
    if((current.x < size.m - 1 ) && (prev == null || prev.x <= current.x)){
      //move to the right:
      options.add(current.right());
    }
    //we don't want to move back in direction
    if((current.y < size.n - 1) && (prev == null || prev.y <= current.y)){
      //move down;
      options.add(current.down());
    }
    //we don't want to move back in direction & if we are in top line
    if((current.x > 0 ) && (prev == null || prev.x >= current.x) && current.y > 0){
      //move to the left:
      options.add(current.left());
    }
    //we don't want to move back in direction & if we are in left column
    if((current.y > 0) && (prev == null || prev.y >= current.y) && current.x > 0){
      //move up
      options.add(current.up());
    }
    var filteredOptions = options.where((p) => !path.contains(p)).toList();
    /*if(filteredOptions.length != options.length){
      print(path);
      print('options = $options.');
      print('filtered= $filteredOptions.');
    }*/

    return filteredOptions;
  }
}