// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p30/p30.dart' as p30;

main() {
  int sum = 0;
  for(int i = 243; i < 295277; i++){
    int p = p30.fifthPowerDigitSum(i);
    if(p == i){
      print(p);
      sum += p;
    }
  }
  print('sum=$sum');
}
