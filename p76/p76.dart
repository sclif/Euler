import 'dart:math';

main(){
  print(groupCount(100, 99));
}

int groupCount(int n, int maxSize){
  if(n == 0){
    return 1;
  }
  int count = 0;
  for(int i = 1; i <= min(n, maxSize); i++){
    count += groupCount(n - i, i);
  }
  return count;
}