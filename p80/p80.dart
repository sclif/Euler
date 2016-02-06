import 'package:euler/euler.dart';
import 'dart:math';

void main(){
  int limit = 100;
  int tail = 100;

  int total = 0;
  for(int n = 2; n < limit; n++){
    int sum = calculateTailSum(n, tail);
    total += sum;
  }
  print(total);
}

int calculateTailSum(int n, int tail){
  var cf = Number.getSqrtContinuedFractions(n);
  if(cf.length == 1){
    return 0;
  }
  int count = tail, k = pow(10, tail + 2);
  int matchingLength = 0;
  List<int> prev = [];
  do{
    List<int> list = [cf[0]];
    for(int i = 0; i <= count; i++){
      var idx = 1 + (i % (cf.length - 1));
      list.add(cf[idx]);
    }
    var fraction = Number.calculateFractionFromCF(list);
    fraction.numerator *= k;
    var result = fraction.numerator ~/ fraction.denominator;
    var s = Number.getDigits(result);
    matchingLength = findCommonLength(prev, s);
    prev = s;
    count++;
  }while(matchingLength <= tail);
  return prev.take(tail).reduce((a,b) => a+b);
}

int findCommonLength(List<int> one, List<int> two){
  int count = 0;
  for(int i = 0; i < min(one.length, two.length) && one[i] == two[i]; i++){
    count++;
  }
  return count;
}