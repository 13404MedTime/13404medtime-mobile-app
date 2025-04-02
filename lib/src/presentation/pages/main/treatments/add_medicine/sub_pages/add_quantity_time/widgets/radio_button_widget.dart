import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    super.key,
    required this.onTap,
    required this.isChecked,
    required this.title,
  });

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool) onTap;
  final bool isChecked;
  final String title;

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => widget.onTap(!widget.isChecked),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Radio(
                value: widget.isChecked,
                groupValue: true,
                onChanged: (val) => widget.onTap(val ?? !widget.isChecked),
              ),
            ),
            // CircleAvatar(
            //   backgroundColor: widget.isChecked
            //       ? context.theme.colorScheme.primary
            //       : context.theme.colorScheme.onSurface.withOpacity(0.1),
            //   radius: 9.5,
            //   child: widget.isChecked
            //       ? Center(
            //           child: Icon(
            //             Icons.check,
            //             color: context.theme.colorScheme.surface,
            //             size: 13,
            //           ),
            //         )
            //       : null,
            // ),
            AppUtils.kBoxWidth6,
            Text(
              widget.title,
              style: context.textStyle.regularCaption1.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
}
