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
}