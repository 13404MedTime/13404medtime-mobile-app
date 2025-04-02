import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../args/medication_description_args.dart';

class MedicationDescriptionPage extends StatelessWidget {
  const MedicationDescriptionPage({
    super.key,
    this.args,
  });

  final MedicationDescriptionArgs? args;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppUtils.kPaddingAll16,
                sliver: SliverToBoxAdapter(
                  child: Ink(
                    padding: AppUtils.kPaddingHor16Ver12,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      borderRadius: AppUtils.kBorderRadius8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          args?.title ?? '',
                          style:
                              context.textStyle.regularBody.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                        if ((args?.description ?? '').isNotEmpty) ...[
                          AppUtils.kBoxHeight24,
                          // TODO: replace with alternative
                          // HtmlWidget(
                          //   args?.description ?? '',
                          //   buildAsync: false,
                          //   textStyle: context.textStyle.regularBody,
                          // ),
                        ],
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
