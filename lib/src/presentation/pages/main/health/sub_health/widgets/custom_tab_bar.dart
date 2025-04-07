import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    required this.onTap,
    required this.controller,
    required this.tabs,
    super.key,
  });

  final TabController controller;
  final List<Tab> tabs;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) => Material(
        shape: const RoundedRectangleBorder(
          borderRadius: AppUtils.kBorderRadius9,
        ),
        color: context.color.disabledCard,
        child: TabBar(
          onTap: onTap,
          padding: const EdgeInsets.all(4),
          controller: controller,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius7,
            color: context.theme.colorScheme.surface,
            border: Border.all(width: 0.05, color: const Color(0x33000000)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
                offset: Offset(0, 2),
                blurRadius: 2,
              )
            ],
          ),
          labelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          tabs: tabs,
        ),
      );
}
