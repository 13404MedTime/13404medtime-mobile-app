import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';

class PressureMeasureBottomSheetWidget extends StatefulWidget {
  const PressureMeasureBottomSheetWidget({super.key, this.args});

  final SubHealthBottomSheetArgs? args;

  @override
  State<PressureMeasureBottomSheetWidget> createState() => _PressureMeasureBottomSheetWidgetState();
}

class _PressureMeasureBottomSheetWidgetState extends State<PressureMeasureBottomSheetWidget> {
  late SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
    sistolicheskoe:
        widget.args?.sistolicheskoe != null && widget.args!.sistolicheskoe! <= 250 ? widget.args!.sistolicheskoe! : 120,
    diastolicheskoe: widget.args?.diastolicheskoe != null && widget.args!.diastolicheskoe! <= 250
        ? widget.args!.diastolicheskoe!
        : 80,
  );

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppUtils.kBoxHeight24,
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Text(
                    context.translate('pressure'),
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
            ),
            AppUtils.kBoxHeight32,
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        context.translate('upper'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      AppUtils.kBoxHeight12,
                      SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: AppUtils.kBorderRadius8,
                          child: CupertinoPicker(
                            backgroundColor: context.theme.colorScheme.background,
                            itemExtent: 37,
                            squeeze: 1,
                            scrollController: FixedExtentScrollController(
                              initialItem: args.sistolicheskoe! - 1,
                            ),
                            children: [
                              for (int i = 0; i < 250; i++)
                                SizedBox(
                                  height: 37,
                                  child: Center(
                                    child: Text((i + 1).toString()),
                                  ),
                                )
                            ],
                            onSelectedItemChanged: (index) {
                              args.sistolicheskoe = index + 1;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppUtils.kBoxWidth24,
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        context.translate('lower'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      AppUtils.kBoxHeight12,
                      SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: AppUtils.kBorderRadius8,
                          child: CupertinoPicker(
                            backgroundColor: context.theme.colorScheme.background,
                            itemExtent: 37,
                            squeeze: 1,
                            scrollController: FixedExtentScrollController(
                              initialItem: args.diastolicheskoe! - 1,
                            ),
                            children: [
                              for (int i = 0; i < 250; i++)
                                SizedBox(
                                  height: 37,
                                  child: Center(
                                    child: Text('${i + 1}'),
                                  ),
                                )
                            ],
                            onSelectedItemChanged: (index) {
                              args.diastolicheskoe = index + 1;
                              // minute = index * 10;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppUtils.kBoxHeight32,
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, args);
              },
              child: Text(context.translate('save')),
            ),
            AppUtils.kBoxHeight24,
          ],
        ),
      );
}
