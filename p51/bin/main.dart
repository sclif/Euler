// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p51/p51.dart' as p51;
import 'package:euler/euler.dart';
import 'dart:io';
import 'dart:convert';

main() {
  
}

List<String> getPrimesOfLength(int len){
  List<String> result = [];
  
  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .skipWhile((value) => value.length < len)
    .takeWhile((value) => value.length == len)
    .listen((a) { 
      if(!Word.isDistinct(a)){
        result.add(a);
      }
    }, onDone: (){
      return result;
    });
}