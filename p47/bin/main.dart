// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p47/p47.dart' as p47;
import 'package:euler/euler.dart';

import 'dart:io';
import 'dart:convert';


List<int> result = [];
List<int> primes = [];

int n = 210;

main() {
  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => result.length == 0 && int.parse(value) < 1000000)
    .listen((a) => continueSearch(int.parse(a)), onDone: (){
      print(result);
      //print(primes);
    });
}

void continueSearch(int limit){
  while(n < limit){
    if(getNOfDistDivs(n) == 4){
      if(getNOfDistDivs(n+3) == 4){
        print('$n ${n+3}');
        if(getNOfDistDivs(n+1) == 4){
          print('$n ${n+3} ${n+1}');
          if(getNOfDistDivs(n+2) == 4){
            result.add(n);
            result.add(n+1);
            result.add(n+2);
            result.add(n+3);
            return;
          } else {
            n += 3;
          }
        }else{
          n += 2;
        }
      }else{
        n += 4;
      }
    }else{
      n++;
    }
  }
  primes.add(limit);
}

int getNOfDistDivs(int a){
  List<int> divs = Divs.getDivisorsFrom(a, primes);
  int result = Divs.getNumberOfDistinct(divs);
  /*if(result == 4){
    print('$a = $divs');
  }*/
  return result;
}