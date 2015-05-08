// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'dart:io';
import 'dart:convert';

List<int> primes = [3,5,7,11,13,17,19];
int n = 21;

main() {
  int disproof = 0;
  
  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .skipWhile((value) => int.parse(value) < 20)
    .takeWhile((value) => disproof == 0)
    .listen((a) => disproof = catchUpWith(int.parse(a)), onDone: () => print('$disproof'));
}

int catchUpWith(int limit){
  while(n < limit){
    bool found = false;
    for(int p in primes){
      var root = sqrt((n - p) ~/ 2);
      if(root%1 == 0){
        print('$n = $p + 2*${root.toInt()}^2');
        found = true;
        break;
      }
    }
    if(!found){
      return n;
    }
    n += 2;
  }
  primes.add(limit);
  n = limit + 2;
  
  return 0;
}