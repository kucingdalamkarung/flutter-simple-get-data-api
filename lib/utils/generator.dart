import 'dart:math';

class GeneratorUtils {

  /// generate color with [minValue] of first color
  /// and [maxValue] of second color
  int generateRandomCode(int minValue, int maxValue) {
    return Random().nextInt((maxValue - minValue).abs() + 1) + min(minValue, maxValue);
  }

}