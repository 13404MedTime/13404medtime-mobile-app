import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

class SelectLangButton extends StatelessWidget {
  const SelectLangButton({
    super.key,
    required this.onPressed,
    required this.flag,
    required this.lang,
    this.isSelected = false,
  });

  final void Function() onPressed;
  final String flag;
  final String lang;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: AppUtils.kBorderRadius8,
        onTap: onPressed,
        splashColor: Colors.transparent,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.theme.colorScheme.onSecondary,
          ),
          padding: AppUtils.kPaddingHor16Ver24,
          child: SizedBox(
            height: 24,
            child: Row(
              children: [
                Image(
                  image: AssetImage(flag),
                  height: 24,
                  width: 36,
                ),
                AppUtils.kBoxWidth16,
                Text(
                  lang,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2A2828),
                  ),
                ),
                AppUtils.kSpacer,
                if (isSelected)
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Radio(
                      value: isSelected,
                      groupValue: true,
                      onChanged: (val) => onPressed(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
