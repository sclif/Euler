import 'package:euler/euler.dart';

void main() {
  int start = 100;
  int b = 1, d = getD(start);
  for(int i = start - 1; i > 1; i--){
    int a = getD(i);
    int tmp = a*d + b;
    b = d;
    d = tmp;
  }
  int numerator = 2*d + b;
  var digits = Number.getDigits(numerator);
  print(digits.reduce((a,b) => a+b));
}

int getD(int n){
  if(n%3 == 0){
    return 2*n ~/ 3;
  }
  return 1;
}