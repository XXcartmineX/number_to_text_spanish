# number_to_text_spanish

El paquete `number_to_text_spanish` convierte números del 1 al 99999 en su representación textual en español.

## Features

- Convierte números enteros a texto en español.
- Soporte para números desde el 1 hasta el 99999.

## Getting started

Para comenzar a usar el paquete, asegúrate de tener Dart y Flutter configurados en tu ambiente de desarrollo. Luego, agrega el paquete a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  number_to_text_spanish: ^1.0.0
```

## Usage

```dart
import 'package:number_to_text_spanish/number_to_text_spanish.dart';

void main() {
  final text = NumberToText.convert(12345);
  print(text); // "doce mil trescientos cuarenta y cinco"
}
```

## Additional information


Para más información, consulta la documentación oficial. Si encuentras algún problema o tienes sugerencias, por favor abre una incidencia en nuestro repositorio de GitHub. Agradecemos tus contribuciones y comentarios.