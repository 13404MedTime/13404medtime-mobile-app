part of 'package:madadio_client_mobile/src/presentation/pages/main/home/survey/widgets/survey_items_widget.dart';

mixin SurveyItemsMixin {
  String getValueAfterLastUnderscore(String fileName) {
    final List<String> parts = fileName.split('_');
    if (parts.length > 1) {
      if (parts.last.length > 7) {
        return '${parts.last.substring(0, 7)}...';
      }
      return parts.last;
    } else {
      if (fileName.length > 7) {
        return '${fileName.substring(0, 7)}...';
      }
      return fileName;
    }
  }

  String getValueAfterLastUnderscore2(String fileName) {
    final List<String> parts = fileName.split('/');
    // const int length = 30;
    if (parts.length > 1) {
      // if (parts.last.length > length) {
      //   return '${parts.last.substring(0, length)}...';
      // }
      return parts.last;
    } else {
      // if (fileName.length > length) {
      //   return '${fileName.substring(0, length)}...';
      // }
      return fileName;
    }
  }
}
