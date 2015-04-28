// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p19/p19.dart' as p19;

main() {
  int sum = 0;
  for(int y = 1901; y < 2001 ; y++){
    for(int m = DateTime.JANUARY; m <= DateTime.DECEMBER; m++){
      if(p19.isSunday(y, m)){
        sum++;
      }
    }
  }
  print(sum);
}