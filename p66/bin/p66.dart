import 'dart:math';
import 'package:euler/euler.dart';

main(){
  int minX = 0, D = 0, limit = 1000;
  for(int d = 1; d <= limit; d++){
    if(sqrt(d)%1 == 0){
      continue;
    }
    int x = findMinimalX(d);
    if(x > minX){
      minX = x;
      D = d;
    }
  }
  print(D);
}

int findMinimalX(int d){
  List<int> cf = Number.getSqrtContinuedFractions(d);
  List<int> next = [cf.first, cf[1]];
  cf.removeAt(0);
  int x = 0, y = 0, len = 1;
  bool found = false;
  do{
    var f = Number.calculateFractionFromCF(next);
    x = f.numerator;
    y = f.denominator;

    if(x*x - d*y*y == 1){
      found = true;
    } else {
      next.add(cf[len++ % cf.length]);
    }
  } while(!found);
  return x;
}