// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:euler/euler.dart';
import 'dart:io';

main() {
  String path = r'd:\Downloads\p042_words.txt';
  int c = 0;
  
  File f = new File(path);
  var lines = f.readAsStringSync().replaceAll('"','').split(',');
  lines.forEach((a) {
        if(Number.isTriangle(Word.getAlphabeticValue(a))){
          c++;
        }
  });
  
  print(c);
}
