// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.desc,
    required this.time,
    required this.onTap,
    required this.isRead,
    required this.isBirthData,
  });

  final String title;
  final String desc;
  final String time;
  final VoidCallback onTap;
  final bool isRead;
  final bool isBirthData;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        dense: true,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isRead ? context.color.disabledCard : context.theme.colorScheme.primary.withOpacity(0.5),
          ),
          height: 15,
          width: 15,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8), bottom: Radius.circular(8))),
        contentPadding: AppUtils.kPaddingHor12Ver8,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              desc,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.68),
                overflow: isBirthData ? null : TextOverflow.ellipsis,
              ),
              maxLines: isBirthData ? null : 2,
            ),
            AppUtils.kBoxHeight4,
            Text(
              time,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.38),
              ),
            ),
          ],
        ),
      );
}
