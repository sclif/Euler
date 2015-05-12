import 'package:euler/euler.dart';

main(){
  int limit = 1000000;
  int top = 100;
  int c = 0;

  for(int n = 23; n <= top; n++){
    int N = n ~/ 2;
    for(int r = 1; r <= N; r++){
      int a = C(r, n - r);
      if (a > limit){
        if(n % 2 == 1){
          c += (N - r + 1)*2;
        } else {
          c += (N - r)*2 + 1;
        }
        //print('$c [C($n, $r) => $a]');
        break;
      }
    }
  }
  print(c);
}

int C(int r, int k){
  int result = 1;
  for(int i = 1; i <= k; i++){
    result *= r + i;
  }
  return result ~/ factorial(k);
}