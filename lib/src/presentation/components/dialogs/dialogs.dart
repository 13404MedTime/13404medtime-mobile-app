import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/router/routes_arguments.dart';
import '../../../core/extension/extension.dart';
import '../custom_texfield/custom_text_field.dart';
import '../loading_widgets/modal_progress_hud.dart';

Future showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
}) async {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        shadowColor: Theme.of(context).dialogTheme.shadowColor,
        surfaceTintColor: Theme.of(context).dialogTheme.surfaceTintColor,
        title: Text(title),
        content: Text(
          content,
          style: Theme.of(context).dialogTheme.contentTextStyle,
        ),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(
                cancelActionText,
                style: Theme.of(context).dialogTheme.contentTextStyle,
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            child: Text(
              defaultActionText,
              style: Theme.of(context).dialogTheme.contentTextStyle,
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  } else {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title, style: Theme.of(context).dialogTheme.titleTextStyle),
        content: Text(
          content,
          style: Theme.of(context).dialogTheme.contentTextStyle,
        ),
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          CupertinoDialogAction(
            child: Text(
              defaultActionText,
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}

Future showChooseFile({
  required BuildContext context,
  required String title,
  required String leftButtonText,
  required String rightButtonText,
  bool isUploadedFile = false,
  Widget? centerWidget,
}) async =>
    showDialog(
      context: context,
      builder: (context) => ModalProgressHUD(
        inAsyncCall: isUploadedFile,
        child: Dialog(
          insetPadding: AppUtils.kPaddingAll16,
          backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
          shadowColor: Theme.of(context).dialogTheme.shadowColor,
          surfaceTintColor: Theme.of(context).dialogTheme.surfaceTintColor,
          child: const ChooseFileButtonWidget(),
        ),
      ),
    );

class ChooseFileButtonWidget extends StatefulWidget {
  const ChooseFileButtonWidget({super.key});

  @override
  State<ChooseFileButtonWidget> createState() => _ChooseFileButtonWidgetState();
}

class _ChooseFileButtonWidgetState extends State<ChooseFileButtonWidget> {
  File? file;
  late TextEditingController _fileName;

  @override
  void initState() {
    super.initState();
    _fileName = TextEditingController();
  }

  @override
  void dispose() {
    _fileName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  context.translate('add_file'),
                  style: context.textStyle.appBarTitle,
                ),
                AppUtils.kSpacer,
                InkWell(
                  borderRadius: AppUtils.kBorderRadius50,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: context.color.disabledCard,
                      shape: BoxShape.circle,
                    ),
                    padding: AppUtils.kPaddingAll6,
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            AppUtils.kBoxHeight24,
            InkWell(
              onTap: file == null
                  ? () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
                      );

                      //--- get size end
                      if (result?.files.single.path != null) {
                        file = File(result!.files.single.path!);
                        setState(() {});
                      }
                    }
                  : null,
              borderRadius: AppUtils.kBorderRadius8,
              child: Ink(
                padding: AppUtils.kPaddingHor16Ver12,
                child: file != null
                    ? CustomTextField(
                        controller: _fileName,
                        fillColor: context.color.disabledCard,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: context.theme.hintColor.withOpacity(0.5),
                        ),
                        errorText: context.translate('obligatory_field'),
                        showError: _fileName.text.isEmpty,
                        filled: true,
                        onChanged: (value) {
                          setState(() {
                            _fileName.text = value ?? '';
                          });
                        },
                        titleText: context.translate('enter_name'),
                        titleStyle: const TextStyle(
                          fontSize: 16,
                          height: 14 / 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_file,
                            color: context.theme.colorScheme.primary,
                          ),
                          AppUtils.kBoxWidth12,
                          Text(
                            context.translate('choose_file'),
                            style: context.textStyle.buttonStyle.copyWith(
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            AppUtils.kBoxHeight8,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.color.disabledCard,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      context.translate('cancel'),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
                AppUtils.kBoxWidth12,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (file != null && _fileName.text.trim().isNotEmpty) {
                        Navigator.pop(
                            context,
                            SurveyPageUploadFileArgument(
                              selectedFileName: _fileName.text.trim(),
                              file: file ?? File(''),
                            ));
                      }
                    },
                    child: Text(
                      context.translate('save'),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}

// ignore: non_constant_identifier_names
Future SuccessfulOrPermissionDialog({
  required BuildContext context,
  required void Function()? onTap,
  required String title,
  required String content,
  required String buttonTittle,
}) async =>
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Ink(
          padding: AppUtils.kPaddingAll16,
          decoration: const BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: context.textStyle.appBarTitle,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Ink(
                      height: 30,
                      width: 30,
                      padding: AppUtils.kPaddingAll4,
                      decoration: BoxDecoration(
                        color: context.color.disabledCard,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              AppUtils.kBoxHeight16,
              Text(
                content,
                style: context.textStyle.lightBlackFontSize14Weight500,
              ),
              AppUtils.kBoxHeight16,
              ElevatedButton(
                onPressed: onTap,
                child: Text(buttonTittle),
              ),
            ],
          ),
        ),
      ),
    );

Future<T?> customYesNoDialog<T>({
  required BuildContext context,
  bool? barrierDismissible,
  required String title,
  required String content,
  String? cancelButtonText,
  String? acceptButtonText,
  void Function()? cancelOnTap,
  void Function()? closeOnTap,
  required void Function() acceptOnTap,
}) =>
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (context) => Dialog(
        child: Ink(
          padding: AppUtils.kPaddingAll16,
          decoration: const BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 7,
                      style: context.textStyle.appBarTitle,
                    ),
                  ),
                  // InkWell(
                  //   onTap: closeOnTap ?? () => Navigator.pop(context),
                  //   child: Ink(
                  //     height: 30,
                  //     width: 30,
                  //     padding: AppUtils.kPaddingAll4,
                  //     decoration: BoxDecoration(
                  //       color: context.color.disabledCard,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Icon(
                  //       Icons.close,
                  //       size: 18,
                  //       color: context.theme.colorScheme.onSurface,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              AppUtils.kBoxHeight16,
              Text(
                content,
                style: context.textStyle.lightBlackFontSize14Weight500,
              ),
              AppUtils.kBoxHeight16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          context.colorScheme.background,
                        ),
                        foregroundColor: MaterialStatePropertyAll(
                          context.color.black,
                        ),
                      ),
                      onPressed: cancelOnTap ??
                          () {
                            Navigator.pop(context);
                          },
                      child: Text(cancelButtonText ?? context.translate('no')),
                    ),
                  ),
                  AppUtils.kBoxWidth12,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: acceptOnTap,
                      child: Text(acceptButtonText ?? context.translate('yes')),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
