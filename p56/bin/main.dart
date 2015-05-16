import 'package:sprintf/sprintf.dart';
import 'dart:math';

main(){
  int limitA = 100;
  int limitB = 100;
  int _max = 0, maxA = 0, maxB = 0;
  for(int a = 2; a < limitA; a++){
    if(a % 10 == 0){
      continue;
    }
    for(int b = 2; b < limitB; b++){
      int sum = digitSum(pow(a,b));
      if(sum > _max) {
        _max = sum;
        maxA = a;
        maxB = b;
      }
    }
  }
  print('$maxA^$maxB => $_max');
}

int digitSum(int n){
  var s = sprintf("%d", [n]);
  int a = 0;
  for(int i = 0; i < s.length; i++){
    a += int.parse(s[i]);
  }
  return a;
}