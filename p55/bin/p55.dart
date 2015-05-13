import 'package:euler/euler.dart';

main(){
  int count = 0;
  for(int i = 1; i < limit; i++){
    bool b = isLychrel(i);
    if(b){
      count++;
    }
  }
  print(count);
}

int limit = 10000;
Map<int, bool> ints = new Map<int, bool>();

bool isLychrel(int n){
  if(ints.containsKey(n)){
    return ints[n];
  }
  int c = 0;
  List<int> l = [];
  while(c < 50){
    int r = Number.revert(n);
    if(r < limit){
      l.add(r);
    }
    n += r;
    if(ints.containsKey(n)){
      ints[r] = ints[n];
      return ints[n];
    }
    bool isPalindrome = Word.isPalindrome(n.toString());
    if(isPalindrome){
      l.forEach((a) => ints[a] = false);
      return false;
    }
    if(n < limit){
      l.add(n);
    }
    c++;
  }
  l.forEach((a) => ints[a] = true);
  return true;
}