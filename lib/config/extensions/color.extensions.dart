part of 'extensions.dart';

extension ColorFilter on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  List<Color> generateColorSpectrum(Color endColor, int steps) {
    List<Color> colors = [];

    // Ensure the number of steps is at least 2
    steps = steps.clamp(2, steps);

    // Generate colors for each step
    for (int i = 0; i < steps; i++) {
      double ratio = i / (steps - 1);
      colors.add(Color.lerp(this, endColor, ratio)!);
    }

    return colors;
  }
}
