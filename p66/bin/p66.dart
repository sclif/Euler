import 'dart:math';

main(){
  int minX = 0, D = 0, limit = 1000;
  for(int d = 101; d <= limit; d++){
    if(sqrt(d)%1 == 0){
      continue;
    }
    int x = findMinimalX(d);
    if(x > minX){
      print('$x^2 - $d*y^2 = 1');
      minX = x;
      D = d;
    }else{
      print('not max: $x^2 - $d*y^2 = 1');
    }
  }
  print('$D (x=$minX)');
}

int findMinimalX(int d){
  int x = 1, a = 2 - d%2;
  bool found = false;
  do{
    x += a;
    //print('$d $x');
    int r = x*x - 1;
    if(r % d == 0){
      r = r ~/ d;
      if(sqrt(r)%1 == 0){
        found = true;
      }
    }
  } while(!found);
  return x;
}