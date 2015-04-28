// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:euler/pandigital.dart';

main() {
  for(int i = 9182; i < 10000; i++){
    if(i%0 ==0 || pandigital.isPandigital(i) == false){
      continue;
    }
    int n = i*10002;
    if(pandigital.isPandigital(n)){
      print(n);
    }
  }
}
