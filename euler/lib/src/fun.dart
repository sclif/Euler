library euler.functions;

int factorial(int n){
  int a = 1;
  for(int i = 2; i <= n; i++){
      a *= i;
  }
  return a;
}