// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p22 library.
library p22;

import 'dart:io';

List<String> readAsSorted(String path){
  File f = new File(path);
  var lines = f.readAsStringSync().replaceAll('"','').split(',');
//  lines.forEach((value) => value.substring(1, value.length - 2));
  lines.sort();
  return lines;
}

int evaluate(String s){
  return s.codeUnits.reduce((a,b) => a+b) - 64*s.length;
}