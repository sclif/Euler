// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p51/p51.dart' as p51;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:math';

List<String> result = [];

main() async {
  int len = 5;
  do{
    print('LENGTH $len');
    await goPrimesOfLength(len++);
  } while (result.length == 0);
  print(result);
}

Future goPrimesOfLength(int len) async {
  Map<int, Map<String, List<String>>> index = new Map<int, Map<String, List<String>>>();

  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  var stream = f.openRead();
  await stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .skipWhile((value) => value.length < len)
    .takeWhile((value) => value.length == len)
    .listen((a) {
//      _pruneIndex(a, index, len);
      var map = p51.findDupes(a);
      if(map.isNotEmpty){
        var ts = p51.buildTemplates(a, map);
        ts.forEach((s){
          int idx = s.indexOf("*");
            int key = idx == 0? 0 :int.parse(s.substring(0, idx));
            if (index.containsKey(key)) {
              var templates = index[key];
              if (templates.containsKey(s)) {
                templates[s].add(a);
              } else {
                templates[s] = [a];
              }
            } else {
              var m = new Map<String, List<String>>();
              m[s] = [a];
              index[key] = m;
            }
        });
      }
    }).asFuture().whenComplete((){
      index.forEach((key, templates) {
        templates.forEach((k, v) {
          if (v.length > 7) {
            v.sort();
            result.add(v[0]);
            print('$k => $v = ${v[0]}');
          }
        });
      });
      print('$len: $result');
    });
}

String _prev = "0";

void _pruneIndex(String s, Map<int, Map<String, List<String>>> index, int len){
  int i = 0;
  for(; i < _prev.length; i++){
    if(s[i] != _prev[i]){
      break;
    }
  }
  int limit = int.parse(s.substring(0, i + 1));
  int start = int.parse(_prev.substring(0, i + 1));
  for(int j = 0 ; j < _prev.length - i - 2; j++) {
    for(int k = start*pow(10, j); k < limit*pow(10,j); k++){
      if(index.containsKey(k)){
        var templates = index[k];
        bool b = false;
        templates.forEach((k, v) {
          if (v.length > 7 && !b) {
            b = true;
          }
        });
        if(!b){
          index.remove(k);
        }
      }
    }
  }
  _prev = s;
}