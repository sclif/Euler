// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p43/p43.dart' as p43;

main() {
  int sum = 0;
  
  List<int> digits = [0,1,2,3,4,5,6,7,8,9];
  for(int i = 6; i < 59; i++){
    int n = 17 * i;
    int a = n ~/ 100;
    int b = (n - a*100) ~/ 10;
    int c = n - a*100 - b*10;
    List<int> remainedDigits = new List<int>.from(digits);
    remainedDigits.remove(a);
    if(remainedDigits.contains(b) == false){
      continue;
    }
    remainedDigits.remove(b);
    if(remainedDigits.contains(c) == false){
      continue;
    }
    remainedDigits.remove(c);
    
    List<String> result = p43.divisibleBy(n, 0, remainedDigits);
    if(result != null && result.length > 0){
      result.forEach((a) => sum += int.parse(a));
    }
  }
  
  print(sum);
}
