// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.desc,
    required this.cancelActionText,
    required this.defaultActionText,
    this.changeColor = false,
  });

  final String title;
  final String? desc;
  final String cancelActionText;
  final String defaultActionText;
  final bool changeColor;

  @override
  Widget build(BuildContext context) => Dialog(
        insetPadding: AppUtils.kPaddingAll24,
        child: Padding(
          padding: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              AppUtils.kBoxHeight16,
              if (desc != null) ...[
                Text(
                  desc!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Color(0xFF3C464E)),
                ),
                AppUtils.kBoxHeight16,
              ],
              SizedBox(
                child: Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          changeColor ? null : context.color.disabledCard,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        cancelActionText,
                        style: changeColor ? null : TextStyle(color: context.color.onBackground50),
                      ),
                    ),
                  ),
                  AppUtils.kBoxWidth16,
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          changeColor ? context.color.disabledCard : null,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(
                        defaultActionText,
                        style: changeColor ? TextStyle(color: context.color.onBackground50) : null,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      );
}
