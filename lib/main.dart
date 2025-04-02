import 'dart:io';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'src/app_options.dart';
import 'src/config/router/app_routes.dart';
import 'src/core/extension/extension.dart';
import 'src/core/l10n/app_localizations.dart';
import 'src/core/services/notification_service.dart';
import 'src/injector_container.dart';
import 'src/presentation/bloc/log_bloc_observer.dart';
import 'src/presentation/bloc/main/main_bloc.dart';
import 'src/presentation/bloc/main/profile/profile_bloc.dart';
import 'src/presentation/bloc/main/profile/profile_edit/profile_edit_bloc.dart';
import 'src/presentation/components/native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// firebase crashlytics
  await notificationServiceInitialize();

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }

  await init();
  await sl.allReady();

  /// yandex appmetrica
  await AppMetrica.activate(
    AppMetricaConfig(
      '3bd8bd17-215a-4999-9216-45fe5df58e0b',
      appVersion: packageInfo.version,
    ),
  );

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = _HttpOverrides();

  await Permission.notification.isDenied.then(
    (value) {
      if (value) {
        Permission.notification.request();
      }
    },
  );

  runApp(
    ModelBinding(
      initialModel: AppOptions(
        themeMode: ThemeMode.light,
        locale: Locale(localSource.locale),
      ),
      child: const MainApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
          BlocProvider<ProfileBloc>(create: (_) => sl<ProfileBloc>()),
          BlocProvider<ProfileEditBloc>(create: (_) => sl<ProfileEditBloc>()),
        ],
        child: MaterialApp(
          /// title
          title: 'MedTime',
          debugShowCheckedModeBanner: false,
          navigatorKey: rootNavigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,

          /// theme style
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.options.themeMode,

          /// lang
          locale: context.options.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,

          /// pages
          initialRoute: Routes.initial,
          onUnknownRoute: AppRoutes.onUnknownRoute,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      );
}

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)..badCertificateCallback = (_, __, ___) => true;
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply
