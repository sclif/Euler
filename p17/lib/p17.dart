// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p17 library.
library p17;

Map<int, String> _map = {
  1: "one",
  2: "two",
  3: "three",
  4: "four",
  5: "five",
  6: "six",
  7: "seven",
  8: "eight",
  9: "nine",
  10: "ten",
  11: "eleven",
  12: "twelve",
  13: "thirteen",
  14: "fourteen",
  15: "fifteen",
  16: "sixteen",
  17: "seventeen",
  18: "eighteen",
  19: "nineteen",
  20: "twenty",
  30: "thirty",
  40: "forty",
  50: "fifty",
  60: "sixty",
  70: "seventy",
  80: "eighty",
  90: "ninety"
};

final String _hundred = "hundred";
final String _and = "and";

String NumberInWords(int n){
  StringBuffer s = new StringBuffer();
  if(n>=100){
    int h = (n / 100).floor();
    s.write(_map[h]);
    s.write(_hundred);
    
    n = n%100;
    if(n == 0){
      return s.toString();
    }
    s.write(_and);
  }
  if(_map.containsKey(n)){
    s.write(_map[n]);
    return s.toString();
  }
  int c = n%10;
  s.write(_map[n - c]);
  s.write(_map[c]);
  return s.toString();
}