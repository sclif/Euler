// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p20/p20.dart' as p20;
import 'package:sprintf/sprintf.dart';

main() {
  int n = p20.factorial(100);
  int sum = p20.digitSum(n);
  print(sum);
}