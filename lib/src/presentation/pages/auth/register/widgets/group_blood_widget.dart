import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../sub_pages/widgets/bottom_sheets/blood_group_sheet.dart';

class BloodGroupSelectionWidget extends StatelessWidget {
  const BloodGroupSelectionWidget({
    super.key,
    required this.selectedBloodGroup,
    required this.onChanged,
    required this.showError,
  });

  final String? selectedBloodGroup;
  final bool showError;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          InkWell(
            onTap: () {
              customModalBottomSheet<String>(
                context: context,
                height: 350,
                builder: (_, __) => ChoseBloodGroupBottomSheet(),
              ).then((value) {
                if (value != null) {
                  onChanged(value);
                }
              });
            },
            child: Ink(
              height: 67,
              decoration: BoxDecoration(
                color: context.color.disabledCard,
                borderRadius: AppUtils.kBorderRadius12,
                border: showError ? Border.all(color: Colors.red) : null,
              ),
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: Center(
                  child: Row(
                    children: [
                      selectedBloodGroup == null
                          ? Text(
                              context.translate('blood_type'),
                              style: TextStyle(
                                fontSize: 16,
                                color: context.theme.hintColor.withOpacity(0.5),
                              ),
                            )
                          : Text(selectedBloodGroup ?? ''),
                      AppUtils.kGap20,
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (showError) AppUtils.kBoxHeight2,
          if (showError)
            Text(
              context.translate('select_blood_type'),
              style: const TextStyle(fontSize: 13, color: Colors.red),
            )
        ],
      );
}
