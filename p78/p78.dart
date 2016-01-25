Map<int, int> p = new Map();

main(){
  p[0] = 1;
  p[1] = 1;
  int target = 1000000;

  int n = 2;
  int count = 0;
  do{
    count = groupCount(n);
    n++;
  }while(count % target > 0);
  print('found n=${n-1} with count=$count');
}


int groupCount(int n){
  int r = 0;
  for(int i = 1; i <= n; i++){
    int a = n - i*(3*i - 1) ~/ 2;
    int b = n - i*(3*i + 1) ~/ 2;
    int t = (a < 0 ? 0 : p[a]) + (b < 0 ? 0: p[b]);
    r += i%2 == 0 ? -t : t;
  }
  p[n] = r;
  return r;
}