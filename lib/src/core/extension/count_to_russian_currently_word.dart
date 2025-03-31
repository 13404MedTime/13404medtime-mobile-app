part of 'extension.dart';

/// bu [CountWordExt] extension rus tilidagi so'zlarning sonlarga nisbatan
/// o'zgarishi uchun kerak
///
///
///
///
extension CountWordExt on int {
  /// ## text1: Таблетка, text2: Таблеток, text3: Таблетки.
  String intRussianTextByNumber(final String text1, final String text2, final String text3) {
    if (this == 1) {
      return text1;
    } else if (this % 10 == 1 && this != 11) {
      return text1;
    } else if (this % 10 >= 2 && this % 10 <= 4 && (this < 10 || this > 20)) {
      return text3;
    } else {
      return text2;
    }
  }

  String numberToWordRussian(String? soglasnieWord, String? glasnieWord, String? myakhiZnakWord) {
    // TODO: here return first if not russian word
    if (this == 0 && localSource.locale == 'ru') {
      return myakhiZnakWord ?? '';
    }

    if (localSource.locale != 'ru') {
      return this > 0 ? soglasnieWord ?? '' : glasnieWord ?? '';
    }

    //TODO: here return russian word

    final List<String> units = ['', 'один', 'два', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять'];

    final List<String> teens = [
      'десять',
      'одиннадцать',
      'двенадцать',
      'тринадцать',
      'четырнадцать',
      'пятнадцать',
      'шестнадцать',
      'семнадцать',
      'восемнадцать',
      'девятнадцать'
    ];

    final List<String> tens = [
      '',
      '',
      'двадцать',
      'тридцать',
      'сорок',
      'пятьдесят',
      'шестьдесят',
      'семьдесят',
      'восемьдесят',
      'девяносто'
    ];

    final List<String> hundreds = [
      '',
      'сто',
      'двести',
      'триста',
      'четыреста',
      'пятьсот',
      'шестьсот',
      'семьсот',
      'восемьсот',
      'девятьсот'
    ];

    String convertLessThanHundred(int remainingDigits) {
      if (remainingDigits < 10) {
        return units[remainingDigits];
      } else if (remainingDigits < 20) {
        return teens[remainingDigits - 10];
      } else {
        final int tensDigit = (remainingDigits / 10).floor();
        final int onesDigit = remainingDigits % 10;
        return tens[tensDigit] + (onesDigit > 0 ? ' ${units[onesDigit]}' : '');
      }
    }

    String convertLessThanThousand(int number) {
      final int hundredsDigit = (number / 100).floor();
      final int remainingDigits = number % 100;
      return (hundredsDigit > 0 ? hundreds[hundredsDigit] : '') +
          (remainingDigits > 0 ? ' ${convertLessThanHundred(remainingDigits)}' : '');
    }

    String checkWord(String number) {
      final lastWord = number.replaceAll(' ', '').split('').last;
      final soglasnie = [
        'б',
        'в',
        'г',
        'д',
        'ж',
        'з',
        'й',
        'к',
        'л',
        'м',
        'н',
        'п',
        'р',
        'с',
        'т',
        'ф',
        'х',
        'ц',
        'ч',
        'ш',
        'щ',
      ];
      final glasnie = ['а', 'я', 'у', 'ю', 'о', 'е', 'ё', 'э', 'и', 'ы'];
      if (soglasnie.contains(lastWord)) {
        return soglasnieWord ?? '';
      } else if (glasnie.contains(lastWord)) {
        return glasnieWord ?? '';
      } else {
        return myakhiZnakWord ?? '';
      }
    }

    if (this < 1000) {
      final String wordNumber = convertLessThanThousand(this);
      return checkWord(wordNumber);
    } else {
      // You can extend this part to handle larger numbers if needed
      return myakhiZnakWord ?? '';
    }
  }
}
