import 'dart:math';
import 'package:euler/euler.dart';

main(){
  int minX = 0, D = 0, limit = 13;
  for(int d = 13; d <= limit; d++){
    if(sqrt(d)%1 == 0){
      continue;
    }
    int x = findMinimalX(d);
    if(x > minX){
      //print('$x^2 - $d*y^2 = 1');
      minX = x;
      D = d;
    }else{
      //print('not max: $x^2 - $d*y^2 = 1');
    }
  }
  print('$D (x=$minX)');
}

int findMinimalX(int d){
  List<int> cf = Number.getSqrtContinuedFractions(d);
  List<int> next = [cf.first, cf[1]];
  int x = 0, y = 0, len = 2;
  bool found = false;
  do{
    var f = Number.calculateFractionFromCF(next);
    x = f.numerator;
    y = f.denominator;
    print('$d: $x/$y');

    if(x*x - d*y*y == 1){
      found = true;
    } else {
      next.add(cf[len++ % cf.length]);
    }
  } while(!found && len < 10);
  print('$d: RESULT $x / $y ($len)');
  return x;
}