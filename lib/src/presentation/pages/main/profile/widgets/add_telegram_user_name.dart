import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../components/custom_texfield/custom_text_field.dart';

class AddTelegramUserName extends StatelessWidget {
  const AddTelegramUserName({
    super.key,
    required this.telegramNicNameController,
    required this.telegramNicNameFocusNode,
    required this.onChanged,
    required this.onPressed,
  });

  final TextEditingController telegramNicNameController;
  final FocusNode telegramNicNameFocusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Material(
        color: context.theme.colorScheme.onSecondary,
        borderRadius: AppUtils.kBorderRadius8,
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.translate('for_convenient_and_quick_communication_with_doctor_leave_your_telegram'),
                style: context.textStyle.regularCaption1.copyWith(
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              AppUtils.kBoxHeight8,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      style: context.theme.textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                      ),
                      contentPadding: AppUtils.kPaddingAll16T8B0,
                      fillColor: context.color.disabledCard,
                      filled: true,
                      controller: telegramNicNameController,
                      onChanged: (value) {
                        onChanged(value!);
                      },
                      focusNode: telegramNicNameFocusNode,
                      prefixIcon: Icon(
                        AppIcons.telegram,
                        size: 28,
                        color: context.color.black,
                      ),
                      hintText: '@${context.translate('user_name')}',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: context.theme.hintColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  AppUtils.kBoxWidth8,
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      context.translate('save'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
