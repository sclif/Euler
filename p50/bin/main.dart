// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p50/p50.dart' as p50;
import 'dart:io';
import 'dart:convert';

main() {
  List<int> primes = [];
  int limit = 1000000;
  
  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => value.length < 7)
    .listen((a){
      int n = int.parse(a);
      primes.add(n);
  }, onDone: (){
    int maxLength = 0, result = 0;
    for(int i in primes){
      int sum = 0, l = 0;
      int idx = primes.indexOf(i);
      while(sum < limit){
        sum += primes[idx++];
        l++;
      }
      if(l < maxLength){
        break;
      }
      idx--;
      while(!primes.contains(sum)){
        sum -= primes[idx--];
        l--;
      }
      if(l > maxLength){
        maxLength = l;
        result = sum;
      }
    }
    print('$result ($maxLength)');
  });
}