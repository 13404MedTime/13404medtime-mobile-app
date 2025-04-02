import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/connectivity/internet_connection_checker.dart';
import '../../../core/connectivity/network_info.dart';
import '../../../core/extension/extension.dart';
import '../../../injector_container.dart';

class InternetConnectionPage extends StatefulWidget {
  const InternetConnectionPage({super.key});

  @override
  InternetConnectionPageState createState() => InternetConnectionPageState();
}

class InternetConnectionPageState extends State<InternetConnectionPage> {
  late NetworkInfo networkInfo;
  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void initState() {
    super.initState();
    networkInfo = sl<NetworkInfo>();
    listener = networkInfo.onStatusChange.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(InternetConnectionStatus status) async {
    switch (status) {
      case InternetConnectionStatus.connected:
        Navigator.of(context).pop();
      case InternetConnectionStatus.disconnected:
        break;
    }
  }

  @override
  void dispose() {
    unawaited(listener.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: context.theme.colorScheme.onPrimary,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(36),
                child: SvgPicture.asset(
                  'assets/svg/no_internet.svg',
                  height: context.mediaQuery.size.height * 310 / 812,
                  width: context.mediaQuery.size.width * 306 / 375,
                ),
              ),
              const Text(
                'Нет доступа к интернету',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Проверьте подключение к интернету',
                style: TextStyle(
                  color: Color(0xff818C99),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: ElevatedButton(
              child: const Text('Попробовать снова'),
              onPressed: () async {
                await Future<void>.delayed(const Duration(milliseconds: 300));
                final isConnected = await networkInfo.isConnected;
                if (isConnected) {
                  if (!mounted) return;
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ),
      );
}
