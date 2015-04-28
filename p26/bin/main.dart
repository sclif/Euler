// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p26/p26.dart' as p26;
import 'dart:math';

main() {
  int limit = 1000, start = 11;
//  print(p26.findCycle("142857142857", 7, 7));
  
  List<String> s = new List<String>();
  for(int i = start; i < limit; i+=2){
    int base = pow(10, limit*3);
    var r = p26.toProperString(base, i);
    String c = p26.findCycle(r, i-1, i);
    print("$i: $c (${c.length})");
    s.add(c);
  }
}
