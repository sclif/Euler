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
    test('Triangle 22', () {
      expect(Number.isTriangle(22), isFalse);
    });
  });

  group('A square group of tests', (){
    test('square 49', () {
      expect(Number.isSquare(49), isTrue);
    });
    test('square 25', () {
      expect(Number.isSquare(25), isTrue);
    });

    test('square 65', () {
      expect(Number.isSquare(65), isFalse);
    });
    test('square 22', () {
      expect(Number.isSquare(22), isFalse);
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

  group('A heptagon group of tests', () {
    test('Heptagon 18', () {
      expect(Number.isHeptagon(18), isTrue);
    });
    test('Heptagon 55', () {
      expect(Number.isHeptagon(55), isTrue);
    });

    test('Heptagon 25', () {
      expect(Number.isHeptagon(25), isFalse);
    });
    test('Heptagon 56', () {
      expect(Number.isHeptagon(56), isFalse);
    });
  });

  group('An Octagon group of tests', () {
    test('Octagon 21', () {
      expect(Number.isOctagon(21), isTrue);
    });
    test('Octagon 65', () {
      expect(Number.isOctagon(65), isTrue);
    });

    test('Octagon 25', () {
      expect(Number.isOctagon(25), isFalse);
    });
    test('Octagon 56', () {
      expect(Number.isOctagon(56), isFalse);
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

  group('A getSqrtContinuedFractions of group of tests', (){
    test('13', (){
      expect(Number.getSqrtContinuedFractions(13), [3, 1, 1, 1, 1, 6]);
    });
    test('25', (){
      expect(Number.getSqrtContinuedFractions(25), [5]);
    });
    test('23', (){
      expect(Number.getSqrtContinuedFractions(23), [4,1,3,1,8]);
    });
    test('1', (){
      expect(Number.getSqrtContinuedFractions(1), [1]);
    });
    test('79', (){
      expect(Number.getSqrtContinuedFractions(79), [8,1,7,1,16]);
    });
  });

  group('A calculateFractionFromCF of group of tests', (){
    test('[2, 1, 2, 1, 1, 4, 1, 1, 6]', (){
      var f = Number.calculateFractionFromCF([2, 1, 2, 1, 1, 4, 1, 1, 6]);
      expect(f.numerator, 1264);
      expect(f.denominator, 465);
    });
    test('[1,2,2,2,2]', (){
      var f = Number.calculateFractionFromCF([1,2,2,2,2]);
      expect(f.numerator, 41);
      expect(f.denominator, 29);
    });
  });
}