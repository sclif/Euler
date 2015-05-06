// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p32/p32.dart' as p32;
import 'package:euler/euler.dart';

main() {
  List<int> total = [];
  for(int i = 1; i < 100; i++){
    for(int j = 1000~/i; j <= 10000~/i; j++){
      int n = int.parse('$i$j${i*j}');
      if(n >= 123456789 && Number.isPandigital(n)){
        print('$i x $j = ${i*j}');
        if(total.contains(i*j)){
          print('^ NOT INCLUDED');
        }else{
          total.add(i*j);
        }
      }
    }
  }
  print('total: ${total.reduce((a,b) => a+b)}');
}
