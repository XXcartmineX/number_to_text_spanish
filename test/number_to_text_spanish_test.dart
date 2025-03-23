import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_text_spanish/number_to_text_spanish.dart';

void main() {
  test('convert number to text', () {
    expect(NumberToWordsES.numberToWords(2), 'dos');
    expect(NumberToWordsES.numberToWords(100), 'cien');
    expect(NumberToWordsES.numberToWords(1000), 'mil');
  });

  test('maneja cero y números negativos', () {
    expect(NumberToWordsES.numberToWords(0), 'cero');
    expect(
      () => NumberToWordsES.numberToWords(-1),
      throwsException,
    );
  });
}
