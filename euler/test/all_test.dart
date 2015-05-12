// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library euler.test;

import 'package:unittest/unittest.dart';
import 'package:euler/euler.dart';

main() {
  group('A pandigital group of tests', () {
    test('Pandigital 123456', () {
      expect(Number.isPandigital(123456), isTrue);
    });
    test('Pandigital 87123456', () {
      expect(Number.isPandigital(87123456), isTrue);
    });
    test('Pandigital 1', () {
      expect(Number.isPandigital(1), isTrue);
    });

    test('Pandigital 5711346', () {
      expect(Number.isPandigital(5711346), isFalse);
    });
    test('Pandigital 5710346', () {
      expect(Number.isPandigital(5710346), isFalse);
    });
    test('Pandigital 5713465', () {
      expect(Number.isPandigital(5713465), isFalse);
    });
    test('Pandigital 11111', () {
      expect(Number.isPandigital(11111), isFalse);
    });
  });

  group('A triangle group of tests', (){
    test('Triangle 55', () {
      expect(Number.isTriangle(55), isTrue);
    });
    test('Triangle 21', () {
      expect(Number.isTriangle(21), isTrue);
    });

    test('Triangle 65', () {
      expect(Number.isTriangle(65), isFalse);
    });
    test('Triangle 21', () {
      expect(Number.isTriangle(22), isFalse);
    });
  });

  group('A pentagon group of tests', (){
    test('Pentagon 22', (){
      expect(Number.isPentagon(22), isTrue);
    });
    test('Pentagon 145', (){
      expect(Number.isPentagon(145), isTrue);
    });

    test('Pentagon 142', (){
      expect(Number.isPentagon(142), isFalse);
    });
    test('Pentagon 112', (){
      expect(Number.isPentagon(112), isFalse);
    });
  });
  
  group('A hexagon group of tests', () {
    test('Hexagon 28', () {
      expect(Number.isHexagon(28), isTrue);
    });
    test('Hexagon 45', () {
      expect(Number.isHexagon(45), isTrue);
    });

    test('Hexagon 25', () {
      expect(Number.isHexagon(25), isFalse);
    });    
    test('Hexagon 55', () {
      expect(Number.isHexagon(55), isFalse);
    });
  });

  group('A Consisting of group of tests', (){
    test('13579', (){
      expect(Number.isConsistingOf(13579, [1,3,5,7,9]), isTrue);
    });
    test('2506559', (){
      expect(Number.isConsistingOf(2506559, [2,0,5,5,5,6,9]), isTrue);
    });

    test('false 13579', (){
      expect(Number.isConsistingOf(13579, [1,3,7,9]), isFalse);
    });
    test('false 13579', (){
      expect(Number.isConsistingOf(13579, [1,3,7,9,5,1]), isFalse);
    });
    test('false 13579', (){
      expect(Number.isConsistingOf(13579, [1,3,5,7,8]), isFalse);
    });
  });
}