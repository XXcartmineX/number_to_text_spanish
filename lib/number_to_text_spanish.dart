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

  // Mapa para los números del 21 al 29
  static const Map<int, String> _twenties = {
    21: 'veintiuno',
    22: 'veintidós',
    23: 'veintitrés',
    24: 'veinticuatro',
    25: 'veinticinco',
    26: 'veintiséis',
    27: 'veintisiete',
    28: 'veintiocho',
    29: 'veintinueve',
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

  // Modificamos la firma para aceptar dynamic y así poder validar correctamente
  static String numberToWords(dynamic number) {
    // Validamos que el valor no sea nulo
    if (number == null) {
      throw Exception('Valor nulo no permitido');
    }
    
    // Validamos que el valor sea un entero
    if (number is! int) {
      throw Exception('Solo se permiten números enteros');
    }
    
    if (number < 0) {
      throw Exception('No se admiten números negativos');
    }
    
    if (number >= 1000000) {
      throw Exception('Número fuera de rango');
    }
    
    if (number == 0) {
      return 'cero';
    } else if (number < 10) {
      return _units[number] ?? '';
    } else if (number < 20) {
      return _teens[number] ?? '';
    } else if (number >= 21 && number <= 29) {
      // Manejar especialmente los números del 21 al 29
      return _twenties[number] ?? '';
    } else if (number < 100) {
      int tensDigit = number ~/ 10;
      int unitsDigit = number % 10;
      return '${_tens[tensDigit * 10]}${unitsDigit > 0 ? ' y ${_units[unitsDigit]}' : ''}';
    } else if (number < 1000) {
      if (number == 100) {
        return 'cien';
      }
      int hundredsDigit = number ~/ 100;
      int rest = number % 100;
      return '${_hundreds[hundredsDigit]}${rest > 0 ? ' ${numberToWords(rest)}' : ''}';
    } else if (number < 1000000) {
      int thousandsPart = number ~/ 1000;
      int remainder = number % 1000;
      
      if (thousandsPart == 1) {
        return 'mil${remainder > 0 ? ' ${numberToWords(remainder)}' : ''}';
      }
      
      return '${numberToWords(thousandsPart)} mil${remainder > 0 ? ' ${numberToWords(remainder)}' : ''}';
    } else {
      throw Exception('Número fuera de rango');
    }
  }
}
