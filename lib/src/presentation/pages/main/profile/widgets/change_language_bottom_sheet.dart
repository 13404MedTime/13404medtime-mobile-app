import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_options.dart';
import '../../../../../config/router/app_routes.dart';
import '../../../../../core/constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/main/profile/profile_edit/profile_edit_bloc.dart';
import '../../../../components/buttons/select_lang_button.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  State<ChangeLanguageBottomSheet> createState() => _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  String selectedLang = localSource.locale;

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);
    return Padding(
      padding: AppUtils.kPaddingHor16Ver24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.translate('language'),
            style: context.textStyle.appBarTitle,
          ),
          AppUtils.kBoxHeight24,
          SelectLangButton(
            isSelected: selectedLang == 'ru',
            onPressed: () {
              selectedLang = 'ru';
              setState(() {});
            },
            flag: ImageConstants.rusFlag,
            lang: 'Русский',
          ),
          AppUtils.kBoxHeight16,
          SelectLangButton(
            isSelected: selectedLang == 'en',
            onPressed: () {
              selectedLang = 'en';
              setState(() {});
            },
            flag: ImageConstants.enFlag,
            lang: 'English',
          ),
          AppUtils.kBoxHeight16,
          SelectLangButton(
            onPressed: () {
              selectedLang = 'uz';
              setState(() {});
            },
            isSelected: selectedLang == 'uz',
            flag: ImageConstants.uzbFlag,
            lang: 'O’zbekcha',
          ),
          // AppUtils.kSpacer,
          AppUtils.kBoxHeight16,
          ElevatedButton(
            onPressed: () {
              context.read<ProfileEditBloc>().add(UpdateUserLang(userLang: selectedLang));
              AppOptions.update(
                context,
                options.copyWith(locale: Locale(selectedLang)),
              );
              Navigator.pop(context);
              localSource.setLocale(selectedLang);
            },
            child: Text(
              context.translate('save'),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
