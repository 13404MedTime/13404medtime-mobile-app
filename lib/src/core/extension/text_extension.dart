part of 'extension.dart';

extension TextExtension on String {
  String get removeHtmlTeg {
    String text = replaceAllMapped('<p>', (match) => '')
        .replaceAllMapped('</p>', (match) => '\n')
        .replaceAllMapped('&nbsp;', (match) => '');
    int i = 0;
    while (text.contains('<')) {
      if (i > 1000) break;
      final int index = text.indexOf('<');
      text = text.replaceRange(index, text.indexOf('>', index) + 1, '');
      i++;
    }
    return text;
  }

  String get checkPassportId {
    if (RegExp(r'^[a-zA-Z]{2}\s[0-9]{7}$').hasMatch(this)) {
      return toUpperCase();
    } else if (RegExp(r'^[a-zA-Z]{2}[0-9]{7}$').hasMatch(this)) {
      return replaceRange(2, 2, ' ').toUpperCase();
    } else {
      return '';
    }
  }

  bool get isNumber => int.tryParse(this).toString() == this;

  bool get isUz => localSource.locale == 'uz';

  bool get isEn => localSource.locale == 'en';

  bool get isRu => localSource.locale == 'ru';
}
