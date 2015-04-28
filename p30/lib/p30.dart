// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p30 library.
library p30;
import 'dart:math';

int fifthPowerDigitSum(int n) {
  String s = n.toString();
  int sum = 0;
  for(int i=0;i<s.length;i++){
    String d = s[i];
    sum += pow(int.parse(d), 5);
  }
  return sum;
}
