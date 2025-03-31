import 'dart:io';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/router/app_routes.dart';
import '../extension/extension.dart';

final String defaultSystemLocale = Platform.localeName.split('_').first;

String get defaultLocale => switch (defaultSystemLocale) {
      'ru' => 'ru',
      'en' => 'ru',
      'uz' => 'uz',
      _ => 'ru',
    };

String get defaultTheme => SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

String dateFormatter(String str) {
  final DateTime date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(str);
  return DateFormat('dd.MM.yyyy').format(date);
}

Future<void> lounchUrlTo(String link) async {
  final Uri url = Uri.parse(link);
  final nativeAppLaunchSucceeded = await launchUrl(
    url,
    mode: LaunchMode.externalNonBrowserApplication,
  );
  if (!nativeAppLaunchSucceeded) {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw ArgumentError('Could not launch $url');
    }
  }
}

String getLocalText(String uz, String ru, [String en = '']) {
  if (localSource.locale.isUz) {
    if (uz.isNotEmpty) return uz;
    if (ru.isNotEmpty) return ru;
    if (en.isNotEmpty) return en;
  } else if (localSource.locale.isRu) {
    if (ru.isNotEmpty) return ru;
    if (uz.isNotEmpty) return uz;
    if (en.isNotEmpty) return en;
  } else {
    if (en.isNotEmpty) return en;
    if (ru.isNotEmpty) return ru;
    if (uz.isNotEmpty) return uz;
  }
  return '';
}

Map<String, String> getBirthText() {
  // return {
  //   'uz_title': "Tug'ilgan kuningiz bilan!",
  //   'uz_body': "Tug'ilgan kuningiz bilan, tabriklarimizni chin yurakdan qabul qiling! Har doim muvaffaqiyatli, baxtli va sog'lom odam bo'ling, ajoyib natijalar muvaffaqiyat keltirsin. Biz hamkorligimizdan juda xursandmiz va siz bizning mijozimiz ekanligingizdan faxrlanamiz!",
  //   'ru_title': 'Поздравляем с Днем Рождения!',
  //   'ru_body': ' От чистого сердца примите поздравления в связи с Вашим днем рождения! Будьте всегда преуспевающим, счастливым и здоровым человеком, пусть отличные результаты приносят успех. Мы очень рады нашему сотрудничеству и гордимся, что Вы являетесь нашим клиентом!',
  //   'en_title': ' От чистого сердца примите поздравления в связи с Вашим днем рождения! Будьте всегда преуспевающим, счастливым и здоровым человеком, пусть отличные результаты приносят успех. Мы очень рады нашему сотрудничеству и гордимся, что Вы являетесь нашим клиентом!',
  //   'en_body': ' От чистого сердца примите поздравления в связи с Вашим днем рождения! Будьте всегда преуспевающим, счастливым и здоровым человеком, пусть отличные результаты приносят успех. Мы очень рады нашему сотрудничеству и гордимся, что Вы являетесь нашим клиентом!',
  // };
  if (localSource.locale.isUz) {
    return {
      "Tug'ilgan kuningiz bilan!":
          "Tug'ilgan kuningiz bilan, tabriklarimizni chin yurakdan qabul qiling! Har doim muvaffaqiyatli, baxtli va sog'lom odam bo'ling, ajoyib natijalar muvaffaqiyat keltirsin. Biz hamkorligimizdan juda xursandmiz va siz bizning mijozimiz ekanligingizdan faxrlanamiz!",
    };
  } else if (localSource.locale.isRu) {
    return {
      'Поздравляем с Днем Рождения!':
          ' От чистого сердца примите поздравления в связи с Вашим днем рождения! Будьте всегда преуспевающим, счастливым и здоровым человеком, пусть отличные результаты приносят успех. Мы очень рады нашему сотрудничеству и гордимся, что Вы являетесь нашим клиентом!',
    };
  } else {
    return {
      'Happy Birthday!':
          'From the bottom of your heart, please accept congratulations on your birthday! Be always a successful, happy and healthy person, let excellent results bring success. We are very pleased with our cooperation and proud that you are our client!',
    };
  }
}

Future<void> sendAnalyticsEvent({
  required String tag,
  required Map<String, Object> parameters,
}) async {
  try {
    await AppMetrica.reportEventWithMap(tag, parameters.cast<String, Object>());
    await FirebaseAnalytics.instance.logEvent(
      name: tag,
      parameters: parameters,
    );
    debugPrint('sentAnalyticsEvent, tag:$tag');
  } on Exception catch (e) {
    debugPrint('sentAnalyticsEvent, error: ${e.toString()}');
  }
}
