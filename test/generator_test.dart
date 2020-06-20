import 'package:colorchangeflutterapp/color_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Chack that 2 generated colors are different
  test('Generating not equal colors test', () {
    var color1 = ColorGenerator.GenerateNewColor();
    var color2 = ColorGenerator.GenerateNewColor();

    var result = color1.red != color2.red ||
        color1.green != color2.green ||
        color1.blue != color2.blue ||
        color1.alpha != color2.alpha;
    expect(result, true);
  });

  // Chack that given color is correct and usable
  test('Generating color test', () {
    var color1 = ColorGenerator.GenerateNewColor();

    var result = color1.red < 255 &&
        color1.green < 255 &&
        color1.blue < 255 &&
        color1.alpha < 255;
    expect(result, true);
  });
}
