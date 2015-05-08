import 'dart:math';

Map<int, int> getDivisorPairs(int n){
  List<int> divisors = new List<int>();
  int limit = sqrt(n).floor();
  for(int i = 1; i <= limit; i++){
    if(n % i == 0){
      divisors.add(i);
    }
  }
  return new Map.fromIterable(divisors,
    key: (item) => item,
    value: (item) => n ~/ item);
}

main(){
  Map<int, int> pc = new Map<int,int>();
  for(int r = 2; r <= 200; r += 2){
    int st = r*r ~/ 2;
    var divs = getDivisorPairs(st);
    for(int s in divs.keys){
      int t = divs[s];
      int x = r + s;
      int y = r + t;
      int z = r + s + t;
      int p = x + y + z;

      if(p <= 1000){
        if(pc.containsKey(p)){
          pc[p]++;
        } else {
          pc[p] = 1;
        }
        print('[$x $y $z] p=$p');
      }
    }
  }
  print(pc);
}