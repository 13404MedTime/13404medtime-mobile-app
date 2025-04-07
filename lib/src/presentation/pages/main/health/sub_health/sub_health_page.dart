import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/health/sub_health_response.dart';
import '../../../../bloc/health/health_bloc.dart';
import '../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../args/health_args.dart';
import 'args/sub_health_bottom_sheet_args.dart';
import 'widgets/custom_barchart.dart';
import 'widgets/custom_tab_bar.dart';
import 'widgets/sub_health_bottom_sheets/blood_sugar_bottom_sheets/blood_sugar_detail_sheet.dart';
import 'widgets/sub_health_bottom_sheets/pedometer_bottom_sheets/pedometer_bottom_sheet.dart';
import 'widgets/sub_health_bottom_sheets/pressure_bottom_sheets/pressure_bottom_sheet.dart';
import 'widgets/sub_health_bottom_sheets/twh_bottom_sheets/temperature_weight_height_bottom_sheet.dart';
import 'widgets/sub_health_first_info.dart';
import 'widgets/sub_health_history.dart';
import 'widgets/sub_health_medium_info.dart';

part 'mixin/sub_health_mixin.dart';

class SubHealthPage extends StatefulWidget {
  const SubHealthPage({
    super.key,
    required this.args,
  });

  final SubHealthArgs args;

  @override
  State<SubHealthPage> createState() => _SubHealthPageState();
}

class _SubHealthPageState extends State<SubHealthPage>
    with SubHealthMixin, TickerProviderStateMixin {
  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    _initControllers(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = context.mediaQuery.size;
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<HealthBloc, HealthState>(
        bloc: widget.args.bloc,
        buildWhen: _buildWhen,
        listenWhen: _checkListenUpdate,
        listener: (_, state) => _getNewListRequest(),
        builder: (_, state) => Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, kToolbarHeight + 30),
              child: Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getTitle(widget.args.type, context),
                      style: context.textStyle.appBarTitle,
                    ),
                    AppUtils.kBoxHeight24,
                    CustomTabBarWidget(
                      onTap: (index) =>
                          _onTabBarTap(index, _getChangedList(state)),
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text: context.translate('weeks'),
                          height: 28,
                        ),
                        Tab(
                          text: context.translate('months'),
                          height: 28,
                        ),
                      ],
                    ),
                    AppUtils.kBoxHeight8,
                  ],
                ),
              ),
            ),
          ),
          body: ValueListenableBuilder<bool>(
            valueListenable: _isScrollable,
            builder: (context, val, child) => CustomScrollView(
              physics: val ? null : const NeverScrollableScrollPhysics(),
              slivers: [
                /// barchart
                SliverToBoxAdapter(
                  child: ColoredBox(
                    color: context.theme.colorScheme.onSecondary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppUtils.kBoxHeight16,
                        SubHealthFirstInfoWidget(
                          data: selectedItemData ?? SubHealthModel(),
                          type: widget.args.type,
                        ),
                        AppUtils.kBoxHeight8,
                        CustomBarchartWidget(
                          type: widget.args.type,
                          listviewKey: _listviewKey,
                          dateWidgetKey: _dateWidgetKey,
                          length: length,
                          subHealthData: subHealthData,
                          itemWidth: _itemWidth,
                          seperatedDistance: seperateDistance,
                          dateLeftSize: _dateWidgetLeftSize,
                          isScrollable: val,
                          detectTapedItem: _detectTapedItem,
                          clearSelection: (val) {},
                          changeScroll: _changeScroll,
                          selectedIndex: selectedIndex,
                          maxNum: maxNum,
                        ),
                        AppUtils.kBoxHeight12,
                      ],
                    ),
                  ),
                ),
                const SliverGap(24),

                /// medium info
                SubHealthMediumInfoWidget(
                  type: widget.args.type,
                  list: _getChangedList(state),
                ),
                if (_stateListIsNotEmpty(state)) ...[
                  const SliverGap(24),
                  SliverPadding(
                    padding: AppUtils.kPaddingHorizontal16,
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        context.translate('history'),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SliverGap(16),
                  SubHealthHistoryWidget(
                    historyList: historyData,
                    type: widget.args.type,
                    tabIndex: length == 7 ? 0 : 1,
                  ),
                ],
                const SliverGap(24),
              ],
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: Platform.isAndroid,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: context.color.onSurface20,
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: const Offset(0, -2),
                  )
                ],
              ),
              child: BottomNavigationButton(
                child: ElevatedButton(
                  onPressed: () async {
                    late final SubHealthBottomSheetArgs? result;
                    switch (widget.args.type) {
                      case SubHealthType.pedometer:
                        result = await customModalBottomSheet<
                            SubHealthBottomSheetArgs?>(
                          context: context,
                          builder: (_, controller) =>
                              const PedometerBottomSheetWidget(),
                        );
                      case SubHealthType.arterialPressure:
                        if (!mounted) return;
                        result = await customModalBottomSheet<
                            SubHealthBottomSheetArgs?>(
                          context: context,
                          builder: (_, controller) =>
                              const PressureBottomSheetWidget(),
                        );
                      case SubHealthType.bloodSugar:
                        if (!mounted) return;

                        result = await customModalBottomSheet<
                            SubHealthBottomSheetArgs?>(
                          context: context,
                          builder: (_, controller) =>
                              const BloodSugarMainBottomSheet(),
                        );
                      case SubHealthType.twh:
                        if (!mounted) return;
                        result = await customModalBottomSheet<
                            SubHealthBottomSheetArgs?>(
                          context: context,
                          builder: (_, controller) =>
                              const TemperatureWeightHeightBottomSheet(),
                        );
                    }
                    if (result is SubHealthBottomSheetArgs) {
                      widget.args.bloc.add(
                        HealthEvent.addSubHealth(
                          type: widget.args.type,
                          request: {
                            'data': result.toJson(widget.args.type),
                          },
                        ),
                      );
                      isUpdate = true;
                      if (widget.args.type == SubHealthType.pedometer) {
                        widget.args.bloc.add(
                            const UpdatedPedometerIsUpdatedEvent(
                                isUpdate: true));
                      } else if (widget.args.type ==
                          SubHealthType.arterialPressure) {
                        widget.args.bloc.add(
                          const UpdatedArterialPressureIsUpdatedEvent(
                            isUpdate: true,
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    context.translate('add'),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  String _getTitle(SubHealthType type, BuildContext context) {
    switch (type) {
      case SubHealthType.pedometer:
        return context.translate('pedometer');
      case SubHealthType.arterialPressure:
        return context.translate('blood_pressure');
      case SubHealthType.bloodSugar:
        return context.translate('blood_sugar');
      case SubHealthType.twh:
        return '${context.translate('temp_weight_height')}, ${context.translate('bmi')}';
    }
  }
}
