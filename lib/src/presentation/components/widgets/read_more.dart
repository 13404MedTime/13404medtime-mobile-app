import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

class ReadMoreText extends StatefulWidget {
  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLength = 100,
  });

  final String text;
  final int maxLength;

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final textSpan = TextSpan(
            text: widget.text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: context.theme.colorScheme.onBackground,
            ),
          );
          final textPainter = TextPainter(
            text: textSpan,
            maxLines: widget.maxLength, // Show only 3 lines initially
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: constraints.maxWidth);

          if (textPainter.didExceedMaxLines) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.onBackground,
                  ),
                  maxLines: isExpanded ? null : 3,
                  overflow: isExpanded ? null : TextOverflow.ellipsis,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? context.translate('wrap') : context.translate('unwrap'),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Text(widget.text);
          }
        },
      );
}
