// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:convert';

List<String> primes = [];
int maxLength = 1;

void addIfTruncatable(String s){
  if(s.length == 1 || (isOddly(s) && (isTruncatableRight(s) || isTruncatableLeft(s)))){
    primes.add(s);
    if(s.length > maxLength){
      maxLength = s.length;
      print('$maxLength $s...');
    }
  }  
}

bool isOddly(String s){
  if(s.lastIndexOf('0') > 0){
    return false;
  }
  if(s.lastIndexOf('2') > 0){
    return false;
  }
  if(s.lastIndexOf('4') > 0){
    return false;
  }
  if(s.lastIndexOf('6') > 0){
    return false;
  }
  if(s.lastIndexOf('8') > 0){
    return false;
  }
  return true;
}

int getBiTruncatableSum(){
  int sum = 0;
  for(int i = primes.length - 1; i >= 0; i--){
    String s = primes[i];
    if(s.length > 1 && isTruncatableRight(s) && isTruncatableLeft(s)){
      print(s);
      sum += int.parse(s);
    }
  }
  return sum;
}

bool isTruncatableRight(String s){
  String next = s.substring(0, s.length-1);
  
  if(primes.contains(next) == false){
    return false;
  }
  if(next.length == 1){
    return true;
  }
  
  return isTruncatableRight(next);
}

bool isTruncatableLeft(String s){
  String next = s.substring(1);
  
  if(primes.contains(next) == false){
    return false;
  }
  if(next.length == 1){
    return true;
  }
  
  return isTruncatableLeft(next);
}

main() {
  /*
  print(isOddly('1223'));
  print(isOddly('2357913579'));
  print(isOddly('23579135279'));
  
  primes.add("2");
  primes.add("3");
  print(isTruncatableRight('23'));
  print(isTruncatableLeft('23'));
  */
  String path = 'd:\\data\\1400000000-primes.txt';
  
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => value.length - maxLength < 2)
    .listen((a) => addIfTruncatable(a), onDone: () => print(getBiTruncatableSum()));
}
