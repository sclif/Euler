// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p20 library.
library p20;
import 'package:sprintf/sprintf.dart';

int factorial(int n){
  int a = 1;
  for(int i = 2; i <= n; i++){
      a *= i;
  }
  return a;
}

int digitSum(int n){
  var s = sprintf("%d", [n]);
  int a = 0;
  for(int i = 0; i < s.length; i++){
    a += int.parse(s[i]);
  }
  return a;
}