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

    test('Pandigital 87123456', () {
      expect(Pandigital.isPandigital(87123456), isTrue);
    });

    test('Pandigital 1', () {
      expect(Pandigital.isPandigital(1), isTrue);
    });


    test('Pandigital 5711346', () {
      expect(Pandigital.isPandigital(5711346), isFalse);
    });

    test('Pandigital 5710346', () {
      expect(Pandigital.isPandigital(5710346), isFalse);
    });

    test('Pandigital 5713465', () {
      expect(Pandigital.isPandigital(5713465), isFalse);
    });

    test('Pandigital 11111', () {
      expect(Pandigital.isPandigital(11111), isFalse);
    });
  });
}
