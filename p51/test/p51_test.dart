// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library p51_test;

import 'package:p51/p51.dart';
import 'package:unittest/unittest.dart';

void main() => defineTests();

void defineTests() {
  group('dupes tests', () {
    test('123456', () {
      expect(findDupes('123456').length, 0);
    });
    test('12523456', () {
      expect(findDupes('12523456').length, 2);
    });
  });
  group('main tests', () {
    test('1234456', () {
      String s = '1234456';
      var dupes = findDupes(s);
      var temps = buildTemplates(s, dupes);
      expect(temps, ["123**56"]);
    });
    test('12523456', () {
      String s = '12523456';
      var dupes = findDupes(s);
      var temps = buildTemplates(s, dupes);
      expect(temps, ["1*5*3456", "12*234*6"]);
    });
    test('2125234562', () {
      String s = '2125234562';
      var dupes = findDupes(s);
      var temps = buildTemplates(s, dupes);
      expect(temps, ["*1*5234562", "*125*34562", "*12523456*", "21*5*34562", "21*523456*", "2125*3456*", "212*234*62"]);
    });
  });
}
