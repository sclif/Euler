import 'package:euler/euler.dart';
import 'dart:math';

main(){
  int limit = 5;
  List<int> ints = [];
  List<int> result = [];
  int len = 8;
  for(int i = 216;;i++){
    int cube = pow(i, 3);
    var digits = Number.getDigits(cube);
    if(digits.length != len){
      len = digits.length;
      ints = [cube];
      continue;
    }
    ints.forEach((item) {
      if(Number.isConsistingOf(item, digits)){
        result.add(item);
      }
    });
    if(result.length == limit - 1){
      result.add(cube);
      break;
    }
    ints.add(cube);
    result = [];
  }
  print(result.first);
}