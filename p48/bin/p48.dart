import 'dart:math';

main(){
  int sum = 0, limit = 1000, p10 = pow(10, 10);
  for(int i = 1; i <= limit; i++){
    sum += i.modPow(i,p10);
  }
  print(sum);
  print(sum.remainder(p10));
}