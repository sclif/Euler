library euler.number;

import 'dart:math';

class Number{
  static bool isPandigital(int n){
    String s = n.toString();
    if(s.length > 9){
      return false;
    }
    List<bool> f = new List<bool>(s.length);
    for(int i = 0; i < s.length; i++){
      int idx = s.codeUnitAt(i) - 49;
      if(idx < 0 || idx > s.length - 1 || f[idx]){
        return false;
      }
      f[idx]=true;
    }
    return true;
  }

  static bool isTriangle(int n){
    double root = sqrt(n*8 + 1);
    int r = root.toInt();
    if(root - r > 0){
      return false;
    }
    return r.isOdd;
  }
}