// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p51/p51.dart' as p51;
//import 'package:euler/euler.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

List<String> result = [];

main() async {
  int len = 3;
  do{
    print('LENGTH $len');
    await goPrimesOfLength(len++);
  } while (result.length == 0 && len < 15);
  print(result);
}

Future goPrimesOfLength(int len) async {
  Map<String, List<String>> templates = new Map<String, List<String>>();

  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  var stream = f.openRead();
  await stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .skipWhile((value) => value.length < len)
    .takeWhile((value) => value.length == len)
    .listen((a) {
      var map = p51.findDupes(a);
      if(map.isNotEmpty){
        var ts = p51.buildTemplates(a, map);
        ts.forEach((s){
          if(templates.containsKey(s)){
            templates[s].add(a);
          } else {
            templates[s] = [a];
          }
        });
      }
    }).asFuture().whenComplete((){
      templates.forEach((k,v){
        if(v.length > 7){
          v.sort();
          result.add(v[0]);
          print('$k => $v = ${v[0]}');
        }
      });
      print('$len: $result');
    });
}