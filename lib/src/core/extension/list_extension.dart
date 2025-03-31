part of 'extension.dart';

extension ListExtension on List {
  String preparatisNameExt(String emptyName) {
    var names = emptyName;
    if (isNotEmpty) {
      names = '';
      for (var i = 0; i < length; i++) {
        if (i < length - 1) {
          names += '${this[i]}, ';
        } else {
          names += '${this[i]}';
        }
      }
    }
    return names;
  }
}
