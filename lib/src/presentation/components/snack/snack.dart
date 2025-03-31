import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

sealed class Snack {
  Snack._();

  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    bool? hasError = false,
  }) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: AppUtils.kPaddingAll16,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: hasError ?? false ? Colors.red : context.theme.colorScheme.primary,
          clipBehavior: Clip.antiAlias,
          dismissDirection: DismissDirection.none,
          content: Text(message),
        ),
      );
  }
}
