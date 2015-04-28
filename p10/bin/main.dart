// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p10/p10.dart' as p10;
import 'dart:io';
import 'dart:convert';

main() {
  String path = 'd:\\data\\1400000000-primes.txt';
  int limit = 2000000;
  
  int sum = 0;
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => int.parse(value) < limit)
    .listen((a) => sum += int.parse(a), onDone: () => print(sum));
//  print(sum);
}
