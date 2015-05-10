// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p49/p49.dart' as p49;
import 'dart:io';
import 'dart:convert';

Map<int, List<int>> _map = new Map<int, List<int>>();

main() {
  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .skipWhile((value) => value.length < 4)
    .takeWhile((value) => value.length == 4)
    .listen((a) => addToGroup(int.parse(a)), onDone: (){
      var result = lookupPeriodicTrio();
      print(result);
    });
}

void addToGroup(int n){
  List<int> digits = p49.getDigits(n);
  digits.sort();
  int sorted = p49.fromDigits(digits);
  if(_map.containsKey(sorted)){
    _map[sorted].add(n);
  } else {
    _map[sorted] = [n];
  }
}

List<List<int>> lookupPeriodicTrio(){
  var result = new List<List<int>>(); 
  for(List<int> group in _map.values){
    if(group.length < 3){
      continue;
    }
    print(group);
    for(int i = 0; i < group.length; i++){
      for(int j = i + 1; j < group.length; j++){
        int diff = group[j] - group[i];
        for(int k = j + 1; k < group.length; k++){
          if (group[k] - group[j] == diff){
            result.add([group[i], group[j], group[k]]);
          }
        }
      }
    }
  }
  return result;
}