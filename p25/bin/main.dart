// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p25/p25.dart' as p25;
import 'dart:math';

main() {
  int limit = pow(10, 999);
  int f1 = 1, f2 = 1, counter = 2;
  do{
    int f = f2 + f1;
    f2 = f1;
    f1 = f;
    counter++;
  }while(f1 < limit);
  print(f1);
  print(counter);
}
