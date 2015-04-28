// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p23/p23.dart' as p23;

main() {
  int limit = 28123;
  List<int> abs = [];
  List<int> ints = new List<int>.generate(limit, (int index) => index + 1);
  for(int i in ints.skip(10)){
    if(p23.isAbundant(i)){
      abs.add(i);
    }
  }
  
  for(int i = 0; i < abs.length; i++){
    print("$i from ${abs.length}");
    for(int j = i; j < abs.length; j++){
      int sum = abs[i] + abs[j];
//      print('[$i:$j] = $sum');
      if(ints.contains(sum)){
        ints.remove(sum);
      }
    }
  }
  print(ints[ints.length-1]);
  print('${ints.skip(100).take(10)}... = ${ints.length}');
  print(ints.reduce((a,b) => a+b));
}
