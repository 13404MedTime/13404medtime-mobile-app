import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({super.key, required this.currentStep});

  final int currentStep;

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            height: 4,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: context.color.disabledCard,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOutSine,
            duration: const Duration(milliseconds: 500),
            width: (MediaQuery.of(context).size.width) * ((widget.currentStep + 1) / 3),
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.theme.colorScheme.primary,
            ),
          ),
        ],
      );
}
