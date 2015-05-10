// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p49 library.
library p49;

List<int> getDigits(int n) {
  List<int> result = [];
  do{
    int r = n.remainder(10);
    result.add(r);
    n = n ~/ 10;
  } while (n > 9);
  result.add(n);
  return result;
}

int fromDigits(List<int> digits){
  int n = 0;
  for(int i = digits.length - 1, j = 1; i >= 0; i--, j *= 10){
    int d = digits[i];
    n += d*j;
  }
  return n;
}