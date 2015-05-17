import 'dart:math';
import 'dart:io';
import 'dart:convert';

main(){
  Set<int> primes = new Set<int>();
  int limit = 10; //you never know how many primes you'll need...
  double baseline = 0.1;

  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  var stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => value.length < limit)
    .listen((a) {
      primes.add(int.parse(a));
    }, onDone: (){
      int a = 0, b = 5;
      int n = 3;
      int percent = 100;
      for(; n < sqrt(pow(10, limit)); n += 2, b += 4){
        int c1 = n*(n - 1) + 1;
        int c2 = n*(n - 2) + 2;
        int c3 = n*(n - 3) + 3;

        if(primes.contains(c1)){
          a++;
        }
        if(primes.contains(c2)){
          a++;
        }
        if(primes.contains(c3)){
          a++;
        }

        double stats = a/b;
        if((stats*100).toInt() != percent){
          percent = (stats*100).toInt();
          print('$percent% n=$n');
        }
        if(stats < baseline){
          break;
        }
      }
      print(n);
    });
}