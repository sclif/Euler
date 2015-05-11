import 'package:euler/euler.dart';

main(){
  int limit = 1000000;
  int top = 100;
  int c = 0;

  for(int r = 1; r <= top ~/ 2; r++){
    for(int k = 1; k <= ; k++)
  }
  for(int n = 24; n <= top; n++){
    int N = n ~/2;
    for(int r = 1; r <= N; r++){
      int a = C(r, n - r);
      if (a > limit){
        if(n % 2 == 1){
          c += (N - r)*2;
        } else {
          c += (N - r)*2 - 1;
        }
        break;
      }
    }
  }
  print(c + 4);
}

int C(int r, int k){
  int result = 1;
  for(int i = 1; i <= k; i++){
    result *= r + i;
  }
  return result ~/ factorial(k);
}