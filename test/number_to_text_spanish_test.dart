import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_text_spanish/number_to_text_spanish.dart';

void main() {
  group('Números básicos', () {
    test('convierte unidades', () {
      expect(NumberToWordsES.numberToWords(0), 'cero');
      expect(NumberToWordsES.numberToWords(1), 'uno');
      expect(NumberToWordsES.numberToWords(9), 'nueve');
    });

    test('convierte números del 11 al 19', () {
      expect(NumberToWordsES.numberToWords(11), 'once');
      expect(NumberToWordsES.numberToWords(15), 'quince');
      expect(NumberToWordsES.numberToWords(19), 'diecinueve');
    });

    test('convierte decenas', () {
      expect(NumberToWordsES.numberToWords(20), 'veinte');
      expect(NumberToWordsES.numberToWords(30), 'treinta');
      expect(NumberToWordsES.numberToWords(45), 'cuarenta y cinco');
      expect(NumberToWordsES.numberToWords(99), 'noventa y nueve');
    });
  });

  group('Números grandes', () {
    test('convierte centenas', () {
      expect(NumberToWordsES.numberToWords(100), 'cien');
      expect(NumberToWordsES.numberToWords(101), 'ciento uno');
      expect(NumberToWordsES.numberToWords(200), 'doscientos');
      expect(NumberToWordsES.numberToWords(545), 'quinientos cuarenta y cinco');
      expect(NumberToWordsES.numberToWords(999), 'novecientos noventa y nueve');
    });

    test('convierte miles', () {
      expect(NumberToWordsES.numberToWords(1000), 'mil');
      expect(NumberToWordsES.numberToWords(1001), 'mil uno');
      expect(NumberToWordsES.numberToWords(2000), 'dos mil');
      expect(NumberToWordsES.numberToWords(2001), 'dos mil uno');
      expect(NumberToWordsES.numberToWords(10000), 'diez mil');
      expect(NumberToWordsES.numberToWords(100000), 'cien mil');
      expect(NumberToWordsES.numberToWords(999999), 'novecientos noventa y nueve mil novecientos noventa y nueve');
    });
  });

  group('Casos especiales y errores', () {
    test('maneja cero y números negativos', () {
      expect(NumberToWordsES.numberToWords(0), 'cero');
      expect(
        () => NumberToWordsES.numberToWords(-1),
        throwsException,
      );
    });

    test('maneja números fuera de rango', () {
      expect(
        () => NumberToWordsES.numberToWords(1000000),
        throwsException,
      );
    });
  });
  
  // Nuevos tests para edge cases
  
  group('Casos especiales en la gramática española', () {
    test('maneja correctamente los números del 21 al 29', () {
      expect(NumberToWordsES.numberToWords(21), 'veintiuno');
      expect(NumberToWordsES.numberToWords(22), 'veintidós');
      expect(NumberToWordsES.numberToWords(25), 'veinticinco');
      expect(NumberToWordsES.numberToWords(29), 'veintinueve');
    });
    
    test('maneja correctamente las centenas irregulares', () {
      expect(NumberToWordsES.numberToWords(500), 'quinientos');
      expect(NumberToWordsES.numberToWords(700), 'setecientos');
      expect(NumberToWordsES.numberToWords(900), 'novecientos');
    });
    
    test('maneja correctamente el uso de "y" en decenas', () {
      expect(NumberToWordsES.numberToWords(31), 'treinta y uno');
      expect(NumberToWordsES.numberToWords(42), 'cuarenta y dos');
      expect(NumberToWordsES.numberToWords(99), 'noventa y nueve');
      // Verificar que no se usa "y" en números del 11-19
      expect(NumberToWordsES.numberToWords(16), 'dieciséis');
      // Verificar que no se usa "y" en números del 21-29
      expect(NumberToWordsES.numberToWords(24), 'veinticuatro');
    });
  });
  
  group('Casos límite', () {
    test('maneja valores cercanos a los límites', () {
      expect(NumberToWordsES.numberToWords(999998), 'novecientos noventa y nueve mil novecientos noventa y ocho');
      expect(NumberToWordsES.numberToWords(999999), 'novecientos noventa y nueve mil novecientos noventa y nueve');
    });
    
    test('maneja casos especiales de miles', () {
      expect(NumberToWordsES.numberToWords(1100), 'mil cien');
      expect(NumberToWordsES.numberToWords(1101), 'mil ciento uno');
      expect(NumberToWordsES.numberToWords(2021), 'dos mil veintiuno');
      expect(NumberToWordsES.numberToWords(10500), 'diez mil quinientos');
    });
  });
  
  group('Entrada inválida', () {
    test('maneja valores nulos o undefined', () {
      expect(
        () => NumberToWordsES.numberToWords(null as dynamic),
        throwsException,
      );
    });
    
    test('maneja tipos incorrectos', () {
      expect(
        () => NumberToWordsES.numberToWords('string' as dynamic),
        throwsException,
      );
      expect(
        () => NumberToWordsES.numberToWords(3.14 as dynamic),
        throwsException,
      );
    });
  });
  
  group('Casos específicos conocidos por causar problemas', () {
    test('maneja correctamente los números con uno en diferentes posiciones', () {
      expect(NumberToWordsES.numberToWords(1), 'uno');
      expect(NumberToWordsES.numberToWords(21), 'veintiuno');
      expect(NumberToWordsES.numberToWords(31), 'treinta y uno');
      expect(NumberToWordsES.numberToWords(101), 'ciento uno');
      expect(NumberToWordsES.numberToWords(1001), 'mil uno');
    });
    
    test('maneja correctamente valores que requieren cambios de género', () {
      expect(NumberToWordsES.numberToWords(21), 'veintiuno');
      expect(NumberToWordsES.numberToWords(31), 'treinta y uno');
      expect(NumberToWordsES.numberToWords(41), 'cuarenta y uno');
    });
  });
}
