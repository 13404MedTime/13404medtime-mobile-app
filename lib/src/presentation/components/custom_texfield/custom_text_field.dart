import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extension/extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.errorText,
    this.showError = false,
    this.enabledShowError = false,
    this.controller,
    this.keyboardType,
    this.inputAction,
    this.maxLines,
    this.onChanged,
    this.inputFormatters,
    this.obscureText,
    this.suffixIcon,
    this.titleText,
    this.enabled,
    this.onTap,
    this.readOnly = false,
    this.fillColor,
    this.minLines,
    this.onComplete,
    this.validator,
    this.autofocus,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.contentPadding,
    this.haveBorder = true,
    this.style,
    this.filled,
    this.prefixIconConstraints,
    this.focusNode,
    this.hintStyle,
    this.titleStyle,
    this.maxLength,
  });

  final String? hintText;
  final String? errorText;
  final bool showError;
  final bool enabledShowError;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final int? maxLines;
  final int? minLines;
  final String? titleText;

  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool readOnly;
  final Color? fillColor;
  final bool? autofocus;
  final bool? enabled;

  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final void Function()? onComplete;

  final dynamic Function(String?)? validator;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final EdgeInsets? contentPadding;
  final bool haveBorder;
  final TextStyle? style;
  final bool? filled;
  final BoxConstraints? prefixIconConstraints;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final int? maxLength;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (titleText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '$titleText',
                style: titleStyle ??
                    const TextStyle(
                      fontSize: 12,
                      height: 14 / 12,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          TextFormField(
            maxLength: maxLength,
            controller: controller,
            focusNode: focusNode,
            validator: (value) => validator!(value),
            textCapitalization: TextCapitalization.sentences,
            readOnly: readOnly,
            enabled: enabled ?? true,
            autofocus: autofocus ?? false,
            obscureText: obscureText ?? false,
            onTap: onTap,
            style: style ?? context.theme.textTheme.titleMedium,
            textInputAction: inputAction ?? TextInputAction.next,
            onChanged: onChanged,
            decoration: InputDecoration(
              counterText: '',
              fillColor: fillColor,
              filled: filled,
              suffixIcon: suffixIcon,
              prefixIconConstraints: prefixIconConstraints,
              prefixIcon: prefixIcon,
              errorText: showError ? errorText : null,
              errorStyle: const TextStyle(fontSize: 13),
              hintText: hintText,
              hintStyle: hintStyle,
              contentPadding: contentPadding,
              focusedBorder: showError
                  ? haveBorder
                      ? _errorHaveBorder
                      : _errorNoneBorder
                  : haveBorder
                      ? _successHaveBorder
                      : _successNoneBorder,
              enabledBorder: showError
                  ? haveBorder
                      ? _errorHaveBorder
                      : _errorNoneBorder
                  : _disabledBorder,
              errorBorder: haveBorder ? _errorHaveBorder : _errorNoneBorder,
              focusedErrorBorder: haveBorder ? _errorHaveBorder : _errorNoneBorder,
              disabledBorder: showError && enabledShowError ? _errorHaveBorder : _disabledBorder,
              prefixText: prefixText,
              prefixStyle: prefixStyle,
            ),
            cursorColor: context.theme.colorScheme.primary,
            keyboardType: keyboardType,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            inputFormatters: inputFormatters,
            onEditingComplete: onComplete,
          ),
        ],
      );
}

const InputBorder _successHaveBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xff22B99A)),
  borderRadius: AppUtils.kBorderRadius10,
);

const InputBorder _successNoneBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: AppUtils.kBorderRadius10,
);

const InputBorder _errorHaveBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFFEA2A42)),
  borderRadius: AppUtils.kBorderRadius10,
);

const InputBorder _errorNoneBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: AppUtils.kBorderRadius10,
);

const InputBorder _disabledBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: AppUtils.kBorderRadius10,
);
