import 'dart:math';

class ColorItem {
  int alpha;
  int red;
  int green;
  int blue;
}

// Generate random colors with different alpha
class ColorGenerator {
  static final color_range = 256;

  static ColorItem GenerateNewColor() {
    var next_color = new ColorItem();
    next_color.alpha = Random().nextInt(color_range);
    next_color.blue = Random().nextInt(color_range);
    next_color.green = Random().nextInt(color_range);
    next_color.red = Random().nextInt(color_range);
    return next_color;
  }
}
