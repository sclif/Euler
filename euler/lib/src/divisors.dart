library euler.number;

import 'dart:math';

class Divs {
  static List<int> getDivisorsFrom(int n, List<int> from) {
    List<int> result = [];
    while(!from.contains(n)){
      int limit = sqrt(n).toInt();
      for(int i in from){
        if(n % i == 0){
          result.add(i);
          n = n ~/ i;
          break;
        }
        if(i > limit){
          return result;
        }
      }
    }
    result.add(n);
    return result;
  }

  static int getNumberOfDistinct(List<int> list){
    Set<int> tmp = new Set<int>.from(list);
    return tmp.length;
  }
}