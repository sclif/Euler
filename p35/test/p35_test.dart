// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library p35_test;

import 'package:p35/p35.dart';
import 'package:unittest/unittest.dart';

void main() => defineTests();

void defineTests() {
  group('main tests', () {
    test('shiftLeft singular', () {
      expect(shiftLeft('2'), '2');
    });
    test('shiftLeft multiple', () {
      expect(shiftLeft('225698'), '256982');
    });
  });
}
