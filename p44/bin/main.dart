// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:euler/euler.dart';

main() {
  var fn = (n) => (n*(3*n - 1))~/2;
  int i = 1, result = 0;
  List<int> pentas = [];
  pentas.add(fn(i++));
  do{
    int p = fn(i);
    for(int p0 in pentas){
      int d = p - p0;
      if(!pentas.contains(d)){
        continue;
      }
      print('$p($i) $p0 => maybe');
      int s = p + p0;
      if(Number.isPentagon(s)){
        print('$p($i) $p0 => [$d $s]');
        result = d;
        break;
      }
    }
    i++;
    pentas.add(p);
  }while(result == 0);
  print(result);
}
