// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library p54.test;

import 'package:test/test.dart';
import 'package:p54/p54.dart' as p54;

void main() {
  test('poker', () {
    var hand1 = new p54.PokerHand.fromString("5H 5C 6S 7S KD");
    var hand2 = new p54.PokerHand.fromString("2C 3S 8S 8D TD");
    var e1 = hand1.evaluate();
    var e2 = hand2.evaluate();
    print('${e1} <> ${e2}');
    expect(e1 < e2, isTrue);
  });
  test('poker', () {
    var hand1 = new p54.PokerHand.fromString("5D 8C 9S JS AC");
    var hand2 = new p54.PokerHand.fromString("2C 5C 7D 8S QH");
    var e1 = hand1.evaluate();
    var e2 = hand2.evaluate();
    print('${e1} <> ${e2}');
    expect(e1 > e2, isTrue);
  });
  test('poker', () {
    var hand1 = new p54.PokerHand.fromString("2D 9C AS AH AC");
    var hand2 = new p54.PokerHand.fromString("3D 6D 7D TD QD");
    var e1 = hand1.evaluate();
    var e2 = hand2.evaluate();
    print('${e1} <> ${e2}');
    expect(e1 < e2, isTrue);
  });
  test('poker', () {
    var hand1 = new p54.PokerHand.fromString("4D 6S 9H QH QC");
    var hand2 = new p54.PokerHand.fromString("3D 6D 7H QD QS");
    var e1 = hand1.evaluate();
    var e2 = hand2.evaluate();
    print('${e1} <> ${e2}');
    expect(e1 > e2, isTrue);
  });
  test('poker', () {
    var hand1 = new p54.PokerHand.fromString("2H 2D 4C 4D 4S");
    var hand2 = new p54.PokerHand.fromString("3C 3D 3S 9S 9D");
    var e1 = hand1.evaluate();
    var e2 = hand2.evaluate();
    print('${e1} <> ${e2}');
    expect(e1 > e2, isTrue);
  });
  test('poker', () {
    var hand1 = new p54.PokerHand.fromString("4H 2D 4C 4D 4S");
    var hand2 = new p54.PokerHand.fromString("3C 3D 3S 3H 9D");
    var e1 = hand1.evaluate();
    var e2 = hand2.evaluate();
    print('${e1} <> ${e2}');
    expect(e1 > e2, isTrue);
  });
  test('poker', () {
    var hand1 = new p54.PokerHand.fromString("4D 6S 5H 7H 3C");
    var hand2 = new p54.PokerHand.fromString("3D 6D 7H QD QS");
    var e1 = hand1.evaluate();
    var e2 = hand2.evaluate();
    print('${e1} <> ${e2}');
    expect(e1 > e2, isTrue);
  });
}