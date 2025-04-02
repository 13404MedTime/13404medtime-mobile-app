import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class MyTreatmentsItemWidget extends StatelessWidget {
  const MyTreatmentsItemWidget({
    super.key,
    required this.medicineName,
    required this.medicineDescription,
    required this.medicineTime,
    // required this.dailyTimes,
    required this.showMedicineLeft,
    required this.medicineLeft,
    required this.onDelete,
  });

  final String medicineName;
  final String medicineTime;
  final String medicineDescription;

  final bool showMedicineLeft;
  final String medicineLeft;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        medicineName,
                        style: context.textStyle.regularCallout.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    AppUtils.kBoxWidth4,
                    const SizedBox(width: 28),
                  ],
                ),
                AppUtils.kBoxHeight4,
                Text(
                  medicineDescription,
                  style: context.textStyle.regularFootnote.copyWith(
                    color: context.theme.colorScheme.onSurface,
                    fontSize: 12,
                  ),
                ),
                AppUtils.kBoxHeight8,
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 20,
                      color: context.theme.colorScheme.onSurface,
                    ),
                    AppUtils.kBoxWidth6,
                    Text(
                      medicineTime,
                      style: context.textStyle.regularFootnote.copyWith(
                        color: context.theme.colorScheme.onSurface,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                if (showMedicineLeft) ...[
                  AppUtils.kBoxHeight8,
                  Ink(
                    padding: AppUtils.kPaddingHor8Ver4,
                    decoration: BoxDecoration(
                      color: context.color.onSurface20,
                      borderRadius: AppUtils.kBorderRadius8,
                    ),
                    child: Text(
                      medicineLeft,
                      style: context.textStyle.regularFootnote.copyWith(
                        color: context.theme.colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: onDelete,
              borderRadius: AppUtils.kBorderRadius100,
              child: Ink(
                padding: AppUtils.kPaddingAll8,
                child: Icon(
                  Icons.delete_outline,
                  color: context.theme.colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      );
}
