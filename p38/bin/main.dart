// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:euler/euler.dart';

main() {
  for(int i = 9182; i < 10000; i++){
    if(i%10 == 0 || Number.isPandigital(i) == false){
      continue;
    }
    int n = i*100002;
    print(n);
    if(Number.isPandigital(n)){
      print('$n : PANDIGITAL');
    }
  }
}
