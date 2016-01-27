class PyTriple{
  int a;
  int b;
  int c;

  PyTriple(this.a,this.b,this.c);

  int p () => a+b+c;

  String toString () => '[$a $b $c] => ${p()}';

  List<PyTriple> next(){
    List<PyTriple> result = new List();

    int a1 = -a + 2*b + 2*c;
    int b1 = -2*a + b + 2*c;
    int c1 = -2*a + 2*b + 3*c;

    int a2 = a + 2*b + 2*c;
    int b2 = 2*a + b + 2*c;
    int c2 = 2*a + 2*b + 3*c;

    int a3 = a - 2*b + 2*c;
    int b3 = 2*a - b + 2*c;
    int c3 = 2*a - 2*b + 3*c;

    result.add(new PyTriple(a1,b1,c1));
    result.add(new PyTriple(a2,b2,c2));
    result.add(new PyTriple(a3,b3,c3));

    return result;
  }
}