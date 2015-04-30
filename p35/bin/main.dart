// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p35/p35.dart' as p35;
import 'dart:io';
import 'dart:convert';

main() {
  List<String> primes = [];
  String path = 'd:\\data\\1400000000-primes.txt';
  int limit = 1000000;
  
  int c = 0;
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => int.parse(value) < limit)
    .listen((a) => primes.add(a), onDone: () => print(p35.countCircular(primes)));
}