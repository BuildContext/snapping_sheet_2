import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snapping_sheet_2/snapping_sheet.dart';
import 'package:snapping_sheet_2/src/below_sheet_size_calculator.dart';

void main() {
  group('Testing with dynamic size.', () {
    var sizeCalculator = BelowSheetSizeCalculator(
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
      expect(sizeCalculator.getSheetEndPosition(), 825.0);
    });
    test('Start position.', () {
      expect(sizeCalculator.getSheetStartPosition(), 0);
    });
    test('Visible height.', () {
      expect(sizeCalculator.getVisibleHeight(), 175);
    });
  });

  group('Testing with static size and not expanding on overflow.', () {
    var sizeCalculator = BelowSheetSizeCalculator(
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
      expect(sizeCalculator.getSheetEndPosition(), 325);
    });
    test('Start position.', () {
      expect(sizeCalculator.getSheetStartPosition(), null);
    });
    test('Visible height.', () {
      expect(sizeCalculator.getVisibleHeight(), 675);
    });
  });

  group('Testing with static size and expanding on overflow.', () {
    var sizeCalculator = BelowSheetSizeCalculator(
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
      expect(sizeCalculator.getSheetEndPosition(), 325);
    });
    test('Start position.', () {
      var test = sizeCalculator.getSheetStartPosition();
      expect(test, 0.0);
    });
    test('Visible height.', () {
      expect(sizeCalculator.getVisibleHeight(), 675);
    });
  });
}
