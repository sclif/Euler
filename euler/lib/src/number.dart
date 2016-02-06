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

  static bool isSquare(int n){
    return sqrt(n)%1 == 0;
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

  static bool isHeptagon(int n){
    double root = sqrt(n*40 + 9);
    if(root%1 != 0){
      return false;
    }
    return (root.toInt() + 3) % 10 == 0;
  }

  static bool isOctagon(int n){
    double root = sqrt(n*3 + 1);
    if(root%1 != 0){
      return false;
    }
    return (root.toInt() + 1) % 3 == 0;
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

  static List<int> getSqrtContinuedFractions(int n){
    double root = sqrt(n);
    int m = root.toInt();
    List<int> result = [m];
    if(root != m){
      int denom = 1, mCopy = m;
      while(true){
        int a = denom ~/ (root - m);
        denom = (n - m*m) ~/ denom;
        m = denom*a - m;
        result.add(a);
        if(denom == 1 && m == mCopy){
          return result;
        }
      }
    }
    return result;
  }

  static Fraction calculateFractionFromCF(List<int> cf){
    int b = 1, d = cf.last;
    for(int i = cf.length - 2; i > 0; i--){
      int a = cf[i];
      int tmp = a*d + b;
      b = d;
      d = tmp;
    }
    return new Fraction(cf.first*d + b, d);
  }
}

class Fraction{
  int numerator;
  int denominator;

  Fraction(this.numerator, this.denominator);
}