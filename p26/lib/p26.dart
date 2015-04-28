// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p26 library.
library p26;

import 'package:sprintf/sprintf.dart';

String toProperString(int base, int d){
  var r = base~/d;
  String s = sprintf("%d", [r]);
  return s;
}

String findCycle(String s, [int start = 0, int maxLength = 0]){
  if(maxLength == 0){
    maxLength = s.length;
  }
  String cycle = s[start];
  do{
    int idx = s.indexOf(cycle, start + 1);
    if(idx - start > maxLength){
      throw new Exception("no cycles found!");
    }
    cycle = s.substring(start, idx);
    int idx2 = s.indexOf(cycle, start + 1);
    if(idx == idx2){
      return cycle;
    }
  }while(true);
}