// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p22/p22.dart' as p22;

main() {  
  var list = p22.readAsSorted("d:\\Downloads\\p022_names.txt");
//  print('${list.length} = ${list.take(10)} ...');
  int sum = 0;
  for(int i = 0; i < list.length; i++){
    sum += (i+1)*p22.evaluate(list[i]);
  }
  print(sum);
}
