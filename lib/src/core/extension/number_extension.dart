part of 'extension.dart';

extension NumberExtension on num {
  String get formatNum {
    if (this % 1 == 0) return toInt().toString();
    final String numString = toString();
    if (numString.substring(numString.indexOf('.')).length > 2) {
      return toStringAsFixed(2);
    } else {
      return numString;
    }
  }

  /// ## text1: Таблетка, text2: Таблеток, text3: Таблетки.
  String russianTextByNumber(final String text1, final String text2, final String text3) {
    if (this % 1 == 0) {
      return floor().intRussianTextByNumber(text1, text2, text3);
    }
    final int? num = int.tryParse(toString().replaceAll('0', '').split('').last);
    return num != null ? num.intRussianTextByNumber(text1, text2, text3) : text1;
    // if (this == 1) {
    //   return text1;
    // } else if (this % 10 == 1 && floor() != 11) {
    //   return text1;
    // } else if (floor() % 10 >= 2 &&
    //     floor() % 10 <= 4 &&
    //     (floor() < 10 || floor() > 20)) {
    //   return text3;
    // } else {
    //   return text2;
    // }
  }
}
