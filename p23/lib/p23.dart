// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p23 library.
library p23;
import 'package:p12/p12.dart';

bool isAbundant(int n){
  var divs = getDivisors(n);
  divs.remove(n);
  int sum = divs.reduce((a,b) => a+b);
//  print(divs);
//  print(sum);
  return sum > n;
}