import 'package:euler/euler.dart';

main() {
  int limit = 1000, n = 5;
  do{
    checkCombinedon(n);
    checkCombinedon(n+2);
    n += 6;
  } while (n < limit);
}

void checkCombinedon(int t){
  int pr = (t - 1)*(t + 1);
  if(pr % 24 != 0){
    print('ooooopsie, something is fundamentally wrong in your assumptions, master ..!.,');
  }
  int p = pr ~/ 24;
  if(Number.isTriangle(p)/* && Number.isPentagon(p)*/ && Number.isHexagon(p)){
    print(p);
  }
}