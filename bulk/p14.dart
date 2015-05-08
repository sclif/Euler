import 'dart:math';

int Collatz(int a){
  if(a.isEven){
    return (a/2).floor();
  }
  return a*3+1;
}

List<int> CollatzSeq(int start){
  List<int> seq = new List<int>();
  int n = start;
  do
  {
    seq.add(n);
    n = Collatz(n);
  }while(n > 1);
  seq.add(1);
  return seq;
}

void main() {
  List<int> longest = new List<int>();
  for(int i = 1000000; i > 0; i--){
    var seq = CollatzSeq(i);
    if(seq.length > longest.length){
      longest = seq;
    }
  }  
  print(longest.length);
  print(longest);
  print(longest.reduce(max));
}