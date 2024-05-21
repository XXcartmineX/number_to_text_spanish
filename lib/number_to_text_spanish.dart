library number_to_text_spanish;

class NumberToWordsES {
  static const Map<int, String> _units = {
    1: 'uno',
    2: 'dos',
    3: 'tres',
    4: 'cuatro',
    5: 'cinco',
    6: 'seis',
    7: 'siete',
    8: 'ocho',
    9: 'nueve',
  };

  static const Map<int, String> _teens = {
    10: 'diez',
    11: 'once',
    12: 'doce',
    13: 'trece',
    14: 'catorce',
    15: 'quince',
    16: 'dieciséis',
    17: 'diecisiete',
    18: 'dieciocho',
    19: 'diecinueve',
  };

  static const Map<int, String> _tens = {
    20: 'veinte',
    30: 'treinta',
    40: 'cuarenta',
    50: 'cincuenta',
    60: 'sesenta',
    70: 'setenta',
    80: 'ochenta',
    90: 'noventa',
  };

  static const Map<int, String> _hundreds = {
    1: 'ciento',
    2: 'doscientos',
    3: 'trescientos',
    4: 'cuatrocientos',
    5: 'quinientos',
    6: 'seiscientos',
    7: 'setecientos',
    8: 'ochocientos',
    9: 'novecientos',
  };

  static String numberToWords(int number) {
    if (number == 0) {
      return 'cero';
    } else if (number < 10) {
      return _units[number] ?? '';
    } else if (number < 20) {
      return _teens[number] ?? '';
    } else if (number < 100) {
      int tensDigit = number ~/ 10;
      int unitsDigit = number % 10;
      return '${_tens[tensDigit * 10] ?? ''}${unitsDigit > 0 ? ' y ' + (_units[unitsDigit] ?? '') : ''}';
    } else if (number < 1000) {
      if (number == 100) {
        return 'cien';
      }
      int hundredsDigit = number ~/ 100;
      int rest = number % 100;
      return '${_hundreds[hundredsDigit] ?? ''}${rest > 0 ? ' ' + numberToWords(rest) : ''}';
    } else if (number < 10000) {
      int thousandsDigit = number ~/ 1000;
      int rest = number % 1000;
      if (thousandsDigit == 1 && rest == 0) {
        return 'mil';
      }
      return '${number == 1000 ? "mil" : _units[thousandsDigit]! + " mil"}${rest > 0 ? ' ' + numberToWords(rest) : ''}';
    } else if (number < 100000) {
      int tensThousandsDigit = number ~/ 10000;
      int rest = number % 10000;
      if (number < 20000) {
        return numberToWords(tensThousandsDigit * 10000 + rest);
      }
      int thousandsPart = number ~/ 1000;
      int remainder = number % 1000;
      return '${numberToWords(thousandsPart)} mil${remainder > 0 ? ' ' + numberToWords(remainder) : ''}';
    } else {
      throw Exception('Number out of range');
    }
  }
}
