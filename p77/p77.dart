import 'dart:math';


List<int> primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97];

main(){
  int target = 5000;

  int n = 2;
  int count = 0;
  do{
    count = groupCount(n, n);
    if(count == -1){
      print("can't be partitioned: $n");
    }
    n++;
  }while(count < target);
  print('found n=${n-1} with count=$count');
}

int groupCount(int n, int maxSize){
  if(n == 0){
    return 1;
  }
  if(n == 1){
    return -1;
  }
  int count = 0;
  for(int i = 0; primes[i] <= min(n, maxSize); i++){
    int tmp = groupCount(n - primes[i], primes[i]);
    if(tmp == -1){
      continue;
    }
    count += tmp;
  }
  return count;
}