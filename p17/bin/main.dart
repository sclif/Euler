// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p17/p17.dart' as p17;

main() {
  var sum = 0;
  for(int i = 1; i < 1000; i++){
    var s = p17.NumberInWords(i);
    sum += s.length;
  }
  print("${sum + 11}");
}
