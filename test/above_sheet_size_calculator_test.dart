import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snapping_sheet_2/snapping_sheet.dart';
import 'package:snapping_sheet_2/src/above_sheet_size_calculator.dart';

void main() {
  group('Testing with dynamic size.', () {
    var sizeCalculator = AboveSheetSizeCalculator(
      axis: Axis.vertical,
      currentPosition: 200,
      grabbingHeight: 50,
      maxHeight: 1000,
      sheetData: SnappingSheetContent(
        child: SizedBox(),
        draggable: (details) => false,
        sizeBehavior: SheetSizeFill(),
      ),
    );
    test('End position.', () {
      expect(sizeCalculator.getSheetEndPosition(), 225);
    });
    test('Start position.', () {
      expect(sizeCalculator.getSheetStartPosition(), 0);
    });
    test('Visible height.', () {
      expect(sizeCalculator.getVisibleHeight(), 775);
    });
  });

  group('Testing with static size and not expanding on overflow.', () {
    var sizeCalculator = AboveSheetSizeCalculator(
      axis: Axis.vertical,
      currentPosition: 700,
      grabbingHeight: 50,
      maxHeight: 1000,
      sheetData: SnappingSheetContent(
        child: SizedBox(),
        draggable: (details) => false,
        sizeBehavior: SheetSizeStatic(
          expandOnOverflow: false,
          size: 500,
        ),
      ),
    );
    test('End position.', () {
      expect(sizeCalculator.getSheetEndPosition(), 725);
    });
    test('Start position.', () {
      expect(sizeCalculator.getSheetStartPosition(), null);
    });
    test('Visible height.', () {
      expect(sizeCalculator.getVisibleHeight(), 275);
    });
  });

  group('Testing with static size and expanding on overflow.', () {
    var sizeCalculator = AboveSheetSizeCalculator(
      axis: Axis.vertical,
      currentPosition: 700,
      grabbingHeight: 50,
      maxHeight: 1000,
      sheetData: SnappingSheetContent(
        child: SizedBox(),
        draggable: (details) => false,
        sizeBehavior: SheetSizeStatic(
          expandOnOverflow: true,
          size: 500,
        ),
      ),
    );
    test('End position.', () {
      expect(sizeCalculator.getSheetEndPosition(), 725);
    });
    test('Start position.', () {
      expect(sizeCalculator.getSheetStartPosition(), null);
    });
    test('Visible height.', () {
      expect(sizeCalculator.getVisibleHeight(), 275);
    });
  });
}
