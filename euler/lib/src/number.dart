library euler.number;

import 'dart:math';

class Number {
  static bool isPandigital(int n) {
    String s = n.toString();
    if (s.length > 9) {
      return false;
    }
    List<bool> f = new List<bool>.filled(s.length, false);
    for (int i = 0; i < s.length; i++) {
      int idx = s.codeUnitAt(i) - 49;
      if (idx < 0 || idx > s.length - 1 || f[idx]) {
        return false;
      }
      f[idx] = true;
    }
    return true;
  }

  static bool isTriangle(int n) {
    double root = sqrt(n * 8 + 1);
    if (root%1 != 0) {
      return false;
    }
    return root.toInt().isOdd;
  }

  static bool isPentagon(int n) {
    double root = sqrt(n * 24 + 1);
    if (root%1 != 0) {
      return false;
    }
    return (root.toInt() + 1) % 6 == 0;
  }

  static bool isHexagon(int n){
    double root = sqrt(n*8 + 1);
    if(root%1 != 0){
      return false;
    }
    return (root.toInt() + 1) % 4 == 0;
  }

  static bool isConsistingOf(int n, List<int> digits){
    var tmp = new List<int>.from(digits);
    while(n > 9){
      int r = n.remainder(10);
      int idx = tmp.indexOf(r);
      if(idx == -1){
        return false;
      }
      tmp.removeAt(idx);
      n = n ~/ 10;
    }
    return tmp.length == 1 && tmp[0] == n;
  }

  static List<int> getDigits(int n) {
    List<int> result = [];
    do{
      int r = n.remainder(10);
      result.insert(0, r);
      n = n ~/ 10;
    } while (n > 0);
    return result;
  }

  static int fromDigits(List<int> digits){
    int n = 0;
    for(int i = digits.length - 1, j = 1; i >= 0; i--, j *= 10){
      int d = digits[i];
      n += d*j;
    }
    return n;
  }

  static int revert(int n){
    var digits = getDigits(n);
    int r = fromDigits(digits.reversed.toList());
    return r;
  }
}