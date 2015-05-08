void main() {
  int f2 = 1, f1 = 1;
  String s = "";
  do
  {
    int f = f2 + f1;
    a++;
    f2 = f1;
    f1 = f;
  }while(f1.toString().length < 10);
  print("F($a) = $f1");
}