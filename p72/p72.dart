import 'dart:io';
import 'dart:convert';
import 'dart:math';

class Phi {
  int n;
  Set<int> divisors;

  Phi(int phi, Iterable<int> divs){
    n = phi;
    divisors = new Set<int>.from(divs);
  }
  String toString(){
    return '$n $divisors';
  }
}


main(){
  int limit = 7;
  int max = pow(10, limit - 1);

  Map<int, Phi> phi = new Map<int, Phi>();
  phi[1] = new Phi(1, [1]);

  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  var stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => value.length < limit)
    .listen((a) {
      int prime = int.parse(a);
      phi[prime] = new Phi(prime - 1, [1, prime]);
      int prod = prime;
      while (true){
        int tmp = prod*prime;
        if(tmp > max){
          break;
        }
        phi[tmp] = new Phi(prod*phi[prime].n, [1, prime]);
        prod = tmp;
      }
    }, onDone: (){
      var primes = new List<int>.from(phi.keys);
      primes.sort();
      for(int a = 1; a < primes.length; a++){
        int p1 = primes[a];
        var copy = new List<int>.from(phi.keys);
        for(int p2 in copy){
          if(p2 <= p1 || p1*p2 > max){
            continue;
          }
          var intersection = phi[p1].divisors.intersection(phi[p2].divisors);
          int d = intersection.fold(1, (a,b) => a*b);
          phi[p1*p2] = new Phi(phi[p1].n*phi[p2].n*d ~/ phi[d].n, phi[p1].divisors.union(phi[p2].divisors));
        }
      }

      int sum = 0;
      for(int i = 2; i <= max; i++){
        if(!phi.containsKey(i)){
          print(i);
        }
        else{
          sum += phi[i].n;
        }
      }
      print(sum);
    });
}