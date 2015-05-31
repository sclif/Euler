import 'package:euler/euler.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:math';

int N = 0;
double min = 10;

List<int> primes = [];

main(){
  String path = 'd:\\data\\1400000000-primes.txt';
  int limit = 10000000;
  
  bool found = false;

  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => value.length < 8)
    .listen((a) => primes.add(int.parse(a)),
      onDone: () {
        int result = checkPairs(limit);
        print(result);
      });
}

int checkPairs(int limit){
  int start = sqrt(limit)~/1;
  int idx = 0;
  for(int i = 0; i < primes.length; i++){
    int prime = primes[i];
    if(prime > start){
      idx = i;
      break;
    }
  }
  int p1 = start, p2 = start;
  for(int i = idx; i < primes.length; i++){
    p1 = primes[i];
    for(int j = idx; j > 0; j--){
      p2 = primes[j];

      int n = p1*p2;
      if(n > limit){
        continue;
      }
      int phi = (p1 - 1)*(p2 - 1);

      var k = n/phi;
      if(k < min){


        var digits = Number.getDigits(n);
        if(Number.isConsistingOf(phi, digits)){
          min = k;
          N = n;
        }
      }
    }
  }
  return N;
}