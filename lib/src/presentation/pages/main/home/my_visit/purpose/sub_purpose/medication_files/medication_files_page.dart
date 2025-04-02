import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../bloc/sub_purpose/sub_purpose_bloc.dart';
import '../../../../../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import '../../args/medication_files_args.dart';
import 'widgets/medication_files_list.dart';

class MedicationFilesPage extends StatefulWidget {
  const MedicationFilesPage({
    super.key,
    this.args,
  });

  final MedicationFilesArgs? args;

  @override
  State<MedicationFilesPage> createState() => _MedicationFilesPageState();
}

class _MedicationFilesPageState extends State<MedicationFilesPage> {
  @override
  void initState() {
    super.initState();
    if (widget.args?.naznachenieId != null) {
      widget.args?.bloc?.add(GetFilesEvent(naznachenieId: widget.args!.naznachenieId!));
    }
  }

  late final double itemSize = (context.sizeOf.width - (32 + (16 * 2))) / 3;

  @override
  Widget build(BuildContext context) => widget.args?.bloc != null
      ? Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight - 12),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.args?.illName ?? '',
                    style: context.textStyle.appBarTitle,
                  ),
                ),
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async => widget.args?.bloc?.add(GetFilesEvent(naznachenieId: widget.args!.naznachenieId!)),
            child: BlocBuilder<SubPurposeBloc, SubPurposeState>(
              bloc: widget.args?.bloc,
              builder: (context, state) => Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      /// files
                      if (state.files.isNotEmpty) ...[
                        const SliverGap(16),
                        // for (int file = 0; i < state.files.length; i++)
                        for (final String dateTime in state.files.keys) ...[
                          if (dateTime != state.files.keys.last) const SliverGap(24),

                          /// date text
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: AppUtils.kPaddingHorizontal16,
                              child: Text(
                                dateTime,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                          const SliverGap(8),

                          /// files list
                          SliverToBoxAdapter(
                            child: MedicationFilesListWidget(
                              itemSize: itemSize,
                              files: state.files[dateTime] ?? [],
                            ),
                          ),
                        ]
                      ] else if (!state.isLoadingFiles) ...[
                        /// empty page
                        SliverFillRemaining(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/png/empty_survey.png', width: 234),
                              const Gap(16),
                              Text(
                                context.translate('empty_file'),
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1,
                                  color: context.color.onBackground50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (state.isLoadingFiles) const Center(child: CustomCircularProgressIndicator()),
                ],
              ),
            ),
          ),
        )
      : Scaffold(
          appBar: AppBar(),
        );
}
