import 'dart:async';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/base_functions.dart';
import '../../../injector_container.dart';
import '../../bloc/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  String? iosVersion;
  String? androidVersion;

  @override
  void initState() {
    super.initState();
    _getAppVersion();
    context.read<SplashBloc>().add(const CheckForReleaseEvent());
    context.read<SplashBloc>().add(const InitialSplashEvent());
  }

  Future<void> _getAppVersion() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: Duration.zero,
      ),
    );
    await remoteConfig.fetchAndActivate();
    if (remoteConfig.lastFetchStatus == RemoteConfigFetchStatus.success) {
      if (Platform.isAndroid) {
        androidVersion = remoteConfig.getString('android_version');
      } else if (Platform.isIOS) {
        iosVersion = remoteConfig.getString('ios_version');
      }
    }
  }

  bool isOldVersion(final String nowVersion, final String latestVersion) =>
      (num.tryParse(nowVersion.replaceAll('.', '')) ?? 0) < (num.tryParse(latestVersion.replaceAll('.', '')) ?? 0);

  bool appIsOld() {
    if (Platform.isAndroid && androidVersion != null) {
      return isOldVersion(packageInfo.version, androidVersion!);
    } else if (Platform.isIOS && iosVersion != null) {
      return isOldVersion(packageInfo.version, iosVersion!);
    }
    return false;
  }

  void _showDialog(final BuildContext context) {
    if (Platform.isAndroid) {
      showDialog<dynamic>(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text(
            context.translate('update_app'),
            style: context.textStyle.appBarTitle,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.translate('update_app_context'),
                style: context.textStyle.regularCallout,
              ),
              AppUtils.kBoxHeight24,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(
                        'https://play.google.com/store/apps/details?id=uz.udevs.madadio_client_mobile',
                      ),
                      mode: LaunchMode.externalNonBrowserApplication,
                    );
                  },
                  child: Text(context.translate('update')),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      showCupertinoDialog<dynamic>(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            context.translate('update_app'),
            style: context.textStyle.appBarTitle,
          ),
          content: Text(
            context.translate('update_app_context'),
            style: context.textStyle.regularCallout,
          ),
          actions: [
            CupertinoDialogAction(
              textStyle: context.textStyle.regularCallout,
              onPressed: () {
                launchUrl(
                  Uri.parse('https://apps.apple.com/us/app/madadio/id6466998471'),
                  mode: LaunchMode.externalNonBrowserApplication,
                );
              },
              child: Text(
                context.translate('update'),
                style: context.textStyle.regularCallout,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isTimerFinished) {
            if (appIsOld()) {
              _showDialog(context);
            } else {
              if (localSource.lastName == 'admin-doctor') {
                Navigator.pushReplacementNamed(
                  context,
                  localSource.lanSelected
                      ? localSource.hasProfile && localSource.userId.isNotEmpty
                          ? Routes.doctorMain
                          : Routes.auth
                      : Routes.langSelect,
                );
              } else {
                Navigator.pushReplacementNamed(
                  context,
                  localSource.lanSelected
                      ? localSource.hasProfile && localSource.userId.isNotEmpty
                          ? Routes.main
                          : Routes.auth
                      : Routes.langSelect,
                );
              }
            }
          }
          if (localSource.lanSelected && localSource.hasProfile) {
            sendAnalyticsEvent(
              tag: FirebaseAnalyticsEvents.signInAccount,
              parameters: {'user_name': localSource.firstName},
            );
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiOverlayStyle,
          child: Scaffold(
            backgroundColor: context.theme.colorScheme.surface,
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: context.padding.bottom + 32,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const Positioned.fill(
                  child: Center(
                    child: Image(image: AssetImage('assets/logo/logo_front.png')),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
