// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p52/p52.dart' as p52;
import 'package:euler/euler.dart';
import 'dart:math';

main() {
  int l = 6;
  int result = 0;
  for(int l = 6; result == 0; l++){
    int n = int.parse('1'+stuffWith('1',l-1));
    int limit = int.parse('17'+stuffWith('0',l-2));
    //print('$n -> $limit');
    while(result == 0 && n < limit){
      var digits = Number.getDigits(n);
      if(Number.isConsistingOf(n*2, digits) &&
         Number.isConsistingOf(n*3, digits) &&
         Number.isConsistingOf(n*4, digits) &&
         Number.isConsistingOf(n*5, digits) &&
         Number.isConsistingOf(n*6, digits)){
        result = n;
      }
      n++;
    }
  }
  print(result);
}

String stuffWith(String stuff, int count){
  StringBuffer b = new StringBuffer();
  for(int i = 0; i < count; i++){
    b.write(stuff);
  }
  return b.toString();
}