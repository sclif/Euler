// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p54/p54.dart' as p54;
import 'dart:io';
import 'dart:convert';

main() {
  int player1 = 0;
  String path = r'd:\Downloads\p054_poker.txt';
  File f = new File(path);
  Stream<String> stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .listen((a) {
      String s1 = a.substring(0, 14);
      String s2 = a.substring(15);
      
      var hand1 = new p54.PokerHand.fromString(s1);
      var hand2 = new p54.PokerHand.fromString(s2);
      var e1 = hand1.evaluate();
      var e2 = hand2.evaluate();
      
      if(e1 == e2){
        print('Complete tie! $s1 | $s2');
      }
      if(e1 > e2){
        player1++;
      }
    }, onDone: () => print(player1));
}