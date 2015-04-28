// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p12/p12.dart' as p12;

main() {
  int limit = 500, k = 8, triangular = 28;
  List<int> divisors = [];
  do{
    triangular += k++; 
    divisors = p12.getDivisors(triangular);
  }while(divisors.length < limit);
  print("$triangular (len=${divisors.length}, k = $k) : $divisors");
}
