import 'package:flutter/material.dart';

import '../../../app_options.dart';
import '../../../config/router/app_routes.dart';
import '../../../core/constants/image_constants.dart';
import '../../../core/extension/extension.dart';
import '../../components/buttons/bottom_navigation_button.dart';
import '../../components/buttons/select_lang_button.dart';

class SelectLangPage extends StatefulWidget {
  const SelectLangPage({super.key});

  @override
  State<SelectLangPage> createState() => _SelectLangPageState();
}

class _SelectLangPageState extends State<SelectLangPage> {
  late String selectedLang;
  late bool isLoading;

  @override
  void initState() {
    selectedLang = localSource.locale;
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppUtils.kSpacer,
            const Center(
              child: Image(image: AssetImage('assets/logo/logo_front.png')),
            ),
            AppUtils.kSpacer,
            Text(
              context.translate('choose_language'),
              style: ThemeTextStyles.light.appBarTitle,
            ),
            AppUtils.kBoxHeight20,
            SelectLangButton(
              onPressed: () {
                selectedLang = 'ru';
                AppOptions.update(
                  context,
                  options.copyWith(locale: Locale(selectedLang)),
                );
              },
              isSelected: selectedLang == 'ru',
              flag: ImageConstants.rusFlag,
              lang: 'Русский',
            ),
            AppUtils.kBoxHeight16,
            SelectLangButton(
              onPressed: () {
                selectedLang = 'en';
                AppOptions.update(
                  context,
                  options.copyWith(locale: Locale(selectedLang)),
                );
              },
              isSelected: selectedLang == 'en',
              flag: ImageConstants.enFlag,
              lang: 'English',
            ),
            AppUtils.kBoxHeight16,
            SelectLangButton(
              onPressed: () {
                selectedLang = 'uz';
                AppOptions.update(
                  context,
                  options.copyWith(locale: Locale(selectedLang)),
                );
              },
              isSelected: selectedLang == 'uz',
              flag: ImageConstants.uzbFlag,
              lang: 'O’zbekcha',
            ),
            AppUtils.kSpacer,
            AppUtils.kSpacer,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationButton(
        child: ElevatedButton(
          onPressed: () {
            if (!isLoading) {
              isLoading = true;
              localSource
                ..setLocale(selectedLang)
                ..setLangSelected(true);
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
              isLoading = false;
            }
          },
          child: Text(context.translate('continue')),
        ),
      ),
    );
  }
}
