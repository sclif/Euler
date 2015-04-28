// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p12 library.
library p12;

import 'dart:math';

int calculate() {
  return 6 * 7;
}

List<int> getDivisors(int n){
  List<int> divisors = new List<int>();
  int limit = sqrt(n).floor();
  for(int i = 1; i <= limit; i++){
    if(n % i == 0){
      divisors.add(i);
      int c = (n/i).floor();
      if(c != i){
        divisors.add(c);
      }
    }
  }
  return divisors;
}