// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library euler.test;

import 'package:unittest/unittest.dart';
import 'package:euler/euler.dart';

main() {
  group('A pandigital group of tests', () {

    test('Pandigital 123456', () {
      expect(Pandigital.isPandigital(123456), isTrue);
    });
  });
}
