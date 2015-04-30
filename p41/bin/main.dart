// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p41/p41.dart' as p41;
import 'package:euler/euler.dart';
import 'dart:io';
import 'dart:convert';

main() {
  String path = 'd:\\data\\1400000000-primes.txt';
  int start = 1234567;
  int limit = 7654322;
  //52965439
  
  List<int> primes = new List<int>();
  
  int sum = 0;
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .skipWhile((value) => int.parse(value) < start)
    .takeWhile((value) => int.parse(value) < limit)
    .listen((a) => primes.add(a), onDone: () => print('${getMaxPandi(primes)} - PANDIGITAL'));
}

int getMaxPandi(List<int> ascSorted){
  for(int i = ascSorted.length - 1; i >= 0; i--){
    if(Pandigital.isPandigital(ascSorted[i])){
      return ascSorted[i];
    }
    else{
      print(ascSorted[i]);
    }
  }
  return 0;
}