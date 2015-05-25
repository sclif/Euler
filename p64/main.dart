import 'dart:math';

void main() {
  int limit = 10000;
  List<int> cycles = [];
  for(int i = 2; i < limit; i++){
    int m = sqrt(i).toInt();
    if((m+1)*(m+1) == i + 1){
      cycles.add(2);
      cycles.add(1);
      cycles.add(2);
      i += 3;
      continue;
    } else {
      var result = cf(i, m);
      cycles.add(result.length);
    }
  }
  print(cycles.where((item) => item.isOdd).length - 1);
}

List<int> cf(int n, int m){
  List<int> result = [];
  int denom = 1, compareTo = m;
  double root = sqrt(n);
  while(true){
    int a = denom ~/ (root - m);
    denom = (n - m*m) ~/ denom;
    m = -(m - denom*a);
    result.add(a);
    if(denom == 1 && m == compareTo){
      return result;
    }
  }
  return result;
}