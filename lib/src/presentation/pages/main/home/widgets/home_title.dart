import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({
    super.key,
    this.onTap,
    this.title = '',
    this.subtitle = '',
    this.haveSubtitle = true,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;
  final bool haveSubtitle;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
        sliver: SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                if (haveSubtitle) ...[
                  AppUtils.kSpacer,
                  TextButton(
                    onPressed: onTap ?? () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}
