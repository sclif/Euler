import 'package:euler/euler.dart';

main() {
  int n = 989, r1 = 0, r2 = 0;
  do{
    n += 6;
    r1 = checkCombinedon(n);
    r2 = checkCombinedon(n+2);
  } while (r1 == 0 && r2 == 0);
  print('$n => $r1 $r2');
}

int checkCombinedon(int t){
  int result = 0;
  int pr = (t - 1)*(t + 1);
  if(pr % 24 != 0){
    print('ooooopsie, something is fundamentally wrong in your assumptions, master ..!.,');
  }
  int p = pr ~/ 24;
  if(Number.isTriangle(p) && Number.isPentagon(p) && Number.isHexagon(p)){
    result = p;
  }
  return result;
}