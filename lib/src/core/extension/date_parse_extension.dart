part of 'extension.dart';

extension ParseString on DateTime {
  DateTime get minusFiveHour => subtract(const Duration(hours: 5));

  String get formatDate => DateFormat('dd.MM.yyyy').format(this);

  String get formatDateWithTime => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  String get formatDateDayMonthTime => DateFormat('dd MMM HH:mm').format(this);

  String get formatForChartBar => DateFormat('dd MMMM', localSource.locale).format(this);

  String get getWeekdayShort => DateFormat('E').format(this);

  String get getWeekday => DateFormat('EEEE').format(this);

  String get formatDateTime => DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(this);

  String get toHHmm => DateFormat('HH:mm').format(this);

  String get formatDateTimeZero => DateFormat("yyyy-MM-dd'T'00:00:000'Z'").format(this);

  String get formatDateTimeZ => DateFormat("yyyy-MM-dd'T'00:00:00'Z").format(this);

  String get formatDateTimeLast => DateFormat("yyyy-MM-dd'T'23:59:999'Z'").format(this);

  String get dayDate => DateFormat('dd').format(this);
}

extension ParseExtension on String {
  DateTime? get toDateTime {
    if (isEmpty) return null;
    return DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
  }

  DateTime? get toDateTimeForHealth {
    if (isEmpty) return null;
    return DateFormat('dd.MM.yyyy HH:mm').parse(this);
  }

  DateTime? get hhmmToDateTime {
    if (isEmpty) return null;
    return DateFormat('HH:mm').parse(this);
  }

  DateTime? get ddmmyyyyToDateTime {
    if (isEmpty) return null;
    return DateFormat('dd.MM.yyyy').parse(this);
  }

  String Function() get date => () {
        if (isEmpty) return '';
        final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
        final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
        return DateFormat('dd.MM.yyyy').format(
          date.add(Duration(hours: duration)),
        );
      };

  String get fromApiDateTime {
    if (isEmpty) return '';
    final DateTime dateTime = DateFormat('yyyy-MM-dd HH:mmZ').parse(replaceAll('T', ' '));
    final String formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);
    return formattedDate;
  }

  String get fromApiDateTimeNotZ {
    if (isEmpty) return '';
    try {
      final DateTime dateTime = DateFormat('dd.MM.yyyy HH:mm').parse(replaceAll('T', ' '));
      final String formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);
      return formattedDate;
    } on Exception catch (_) {
      return fromApiDateTime;
    }
  }

  String get fromApiDateTimeForHealth {
    if (isEmpty) return '';
    final DateTime dateTime = DateFormat('dd.MM.yyyy HH:mm').parse(this);
    final String formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);
    return formattedDate;
  }

  String get toApiDateTime {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(
      date.add(Duration(hours: duration)),
    );
  }

  DateTime get toDateTime2 => DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);

  String get ddMMMM {
    if (isEmpty) return '';
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
    return DateFormat('dd MMMM', localSource.locale).format(date);
  }

  String get ddMMMMForHealth {
    if (isEmpty) return '';
    final DateTime date = DateFormat('dd.MM.yyyy HH:mm').parse(this);
    return DateFormat('dd MMMM', localSource.locale).format(date);
  }

  String get ddMMyyyy {
    if (isEmpty) return '';
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
    return DateFormat('dd.MM.yyyy', localSource.locale).format(date);
  }

  DateTime get notificationDateTime {
    if (isEmpty) return DateTime.now();
    final hour = split(':')[0];
    final minute = split(':')[1];

    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, int.parse(hour), int.parse(minute));
  }

  String get hhmm {
    if (isEmpty) return '';
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
    return DateFormat('HH:mm').format(date);
  }

  String get hhmmForHealth {
    if (isEmpty) return '';
    final DateTime date = DateFormat('dd.MM.yyyy HH:mm').parse(this);
    return DateFormat('HH:mm').format(date);
  }

  String get hhmmString {
    if (isEmpty) return '';
    return substring(0, length - 3);
  }

  String Function() get dateTime => () {
        if (isEmpty) return '';
        final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
        final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
        return DateFormat('dd.MM.yyyy HH:mm').format(
          date.add(Duration(hours: duration)),
        );
      };

  String get dateTime1 {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
    return DateFormat('dd.MM.yyyy').format(
      date.add(Duration(hours: duration)),
    );
  }

  String dateTime2() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('MM.dd.yyyy').parse(this);
    return DateFormat('yyyy-MM-dd').format(
      date.add(Duration(hours: duration)),
    );
  }

  String time1() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('HH:mm').parse(this);
    return DateFormat('HH:mm').format(
      date.add(Duration(hours: duration)),
    );
  }

  String get time {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(this);
    return DateFormat('HH:mm').format(
      date.add(Duration(hours: duration)),
    );
  }

  String get htmlToText => Bidi.stripHtmlIfNeeded(this);
}

extension MetricModelExtension on MetricModel {
  String getName(num number) =>
      (localSource.locale == 'uz'
          ? unitOfMeasureUz
          : localSource.locale == 'ru'
              ? number.russianTextByNumber(
                  unitOfMeasureRu1 ?? '',
                  unitOfMeasureRu3 ?? '',
                  unitOfMeasureRu2 ?? '',
                )
              : unitOfMeasureEng) ??
      '';
}
