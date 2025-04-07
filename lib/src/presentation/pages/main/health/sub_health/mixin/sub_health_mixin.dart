part of 'package:madadio_client_mobile/src/presentation/pages/main/health/sub_health/sub_health_page.dart';

mixin SubHealthMixin on State<SubHealthPage> {
  late final TabController _tabController;
  late Map<String, List<SubHealthModel>> historyData;

  late Size size; // screen size
  int length = 7; // items length
  MaxNums maxNum = MaxNums(); // max number for high low visibility
  final ValueNotifier<bool> _isScrollable = ValueNotifier(true); // for 2 kinds of scrolling
  final GlobalKey _listviewKey = GlobalKey(); // key of scroll list
  final GlobalKey _dateWidgetKey = GlobalKey(); // date widget's key
  int? selectedIndex; // for feel to selected item
  final double seperateDistance = 6; // item ranges
  double? dateWidgetWidth;
  SubHealthModel? selectedItemData; // item data selected by scrolling
  Map<DateTime, List<SubHealthModel>> subHealthData =
      {}; // EXAMPLE: {'19 march': [PedometerModel, PedometerModel], ...}

  void _initControllers(TickerProvider t) {
    _tabController = TabController(length: 2, vsync: t);
  }

  bool _checkListenUpdate(HealthState previous, HealthState current) {
    _initial(_getChangedList(current));
    return _checkLoading(previous, current);
  }

  @override
  void initState() {
    super.initState();
    _initial(widget.args.subHealthList);
  }

  void _initial(final List<SubHealthModel> list) {
    _getSortedMapList(list);
    subHealthData = _getList(list);
    _getFirstDate();
    _onChangeIndex();
  }

  void _getSortedMapList(final List<SubHealthModel> list) {
    list.sort((a, b) {
      final DateTime? dateA = a.date?.toDateTimeForHealth;
      final DateTime? dateB = b.date?.toDateTimeForHealth;
      return dateA != null && dateB != null ? dateB.compareTo(dateA) : -1;
    });
    historyData = {};
    for (final SubHealthModel val in list) {
      if (kDebugMode) {
        print('#1# --> ${val.date}');
      }
      if (val.date?.ddMMMMForHealth == null) continue;
      if (!historyData.keys.contains(val.date?.ddMMMMForHealth)) {
        historyData[val.date!.ddMMMMForHealth] = [];
      }
      historyData[val.date!.ddMMMMForHealth]?.add(val);
    }
    setState(() {});
  }

  void _getFirstDate() {
    for (int i = subHealthData.length - 1; i > 0; i--) {
      if (subHealthData.values.elementAt(i).isNotEmpty) {
        selectedIndex = i;
        setState(() {});
        return;
      }
    }
    selectedIndex = null;
    setState(() {});
  }

  void _detectTapedItem(PointerEvent event) {
    final RenderBox box = _listviewKey.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    final Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        final target = hit.target;
        if (target is FooBox) {
          if (target.index != selectedIndex && target.index < length) {
            selectedIndex = target.index;
            _onChangeIndex();
            setState(() {});
          }
        }
      }
    }
  }

  void _onChangeIndex() {
    if (subHealthData[subHealthData.keys.elementAt(selectedIndex ?? 0)]?.isNotEmpty ?? false) {
      num distance = 0;
      num steps = 0;
      num hour = 0;
      num minutes = 0;
      for (final SubHealthModel val in subHealthData[subHealthData.keys.elementAt(selectedIndex ?? 0)] ?? []) {
        distance += val.distance ?? 0;
        steps += val.stepCount ?? 0;
        hour += val.hour ?? 0;
        if (minutes + (val.minutes ?? 0) >= 60) {
          hour += (minutes + (val.minutes ?? 0)) ~/ 60;
        }
        minutes = (minutes + (val.minutes ?? 0)) % 60;
      }
      selectedItemData = subHealthData[subHealthData.keys.elementAt(selectedIndex ?? 0)]?.first.copyWith(
            distance: distance,
            stepCount: steps,
            hour: hour,
            minutes: minutes,
          );
      if (widget.args.type == SubHealthType.pedometer) {
      } else {
        selectedItemData = subHealthData[subHealthData.keys.elementAt(selectedIndex ?? 0)]?.first;
      }
    } else {
      selectedItemData = SubHealthModel();
    }
  }

  Map<DateTime, List<SubHealthModel>> _getList(final List<SubHealthModel> list) {
    final Map<DateTime, List<SubHealthModel>> map = {};
    final Map<String, DateTime> checkList = {};
    final DateTime date = DateTime.now();
    for (int i = length - 1; i >= 0; i--) {
      map[date.subtract(Duration(days: i))] = [];
      checkList[map.keys.last.formatForChartBar] = map.keys.last;
    }
    maxNum = MaxNums();
    for (final SubHealthModel val in list) {
      if (checkList.containsKey(val.date?.ddMMMMForHealth)) {
        map[checkList[val.date?.ddMMMMForHealth]]?.add(val);
      }
    }
    switch (widget.args.type) {
      case SubHealthType.pedometer:
        for (final List<SubHealthModel> data in map.values) {
          if (data.isNotEmpty) {
            final num number = data.fold<num>(0, (val, element) => val + (element.distance ?? 0));
            if (maxNum.pedometer < number) {
              maxNum.pedometer = number;
            }
          }
        }
      case SubHealthType.arterialPressure:
        for (final List<SubHealthModel> data in map.values) {
          if (data.isNotEmpty) {
            if (maxNum.sistolicheskoe < (data.first.sistolicheskoe ?? 0)) {
              maxNum.sistolicheskoe = data.first.sistolicheskoe ?? 0;
            }
            if (maxNum.pulse < (data.first.pulse ?? 0)) {
              maxNum.pulse = data.first.pulse ?? 0;
            }
          }
        }
      case SubHealthType.bloodSugar:
        for (final List<SubHealthModel> data in map.values) {
          if (data.isNotEmpty) {
            if (maxNum.bloodSugar < (data.first.value ?? 0)) {
              maxNum.bloodSugar = data.first.value ?? 0;
            }
          }
        }
      case SubHealthType.twh:
        for (final List<SubHealthModel> data in map.values) {
          if (data.isNotEmpty) {
            if (maxNum.weight < (data.first.weight ?? 0)) {
              maxNum.weight = data.first.weight ?? 0;
            }
            if (maxNum.height < (data.first.height ?? 0)) {
              maxNum.height = data.first.height ?? 0;
            }
            if (maxNum.temperature < (data.first.bodyTemperature ?? 0)) {
              maxNum.temperature = data.first.bodyTemperature ?? 0;
            }
          }
        }
    }
    return map;
  }

  // ignore: use_setters_to_change_properties
  void _changeScroll(bool isScrollable) => _isScrollable.value = isScrollable;

  void _onTabBarTap(final int index, final List<SubHealthModel> list) {
    final int? lastSelectedIndex = selectedIndex;
    setState(() {
      selectedIndex = null;
      if (index == 0) {
        length = 7;
      } else if (index == 1) {
        length = 30;
      }
    });
    subHealthData = _getList(list);
    if (index == 0 && (lastSelectedIndex ?? 0) >= 23) {
      selectedIndex = 6 - (29 - lastSelectedIndex!);
      _onChangeIndex();
    } else if (index == 1 && lastSelectedIndex != null) {
      selectedIndex = min(29, 29 - (6 - lastSelectedIndex));
      _onChangeIndex();
    } else {
      _getFirstDate();
      _onChangeIndex();
    }
    setState(() {});
  }

  double get _dateWidgetLeftSize {
    if (selectedIndex == null) return 0;
    if (_dateWidgetWidth == null) {
      return max(0, (_itemWidth + seperateDistance) * selectedIndex!);
    }
    return _itemWidth >= _dateWidgetWidth!
        ? (_itemWidth + seperateDistance) * selectedIndex!
        : max(
            0,
            min(((_itemWidth + seperateDistance) * selectedIndex!) - ((_dateWidgetWidth! - _itemWidth) / 2),
                ((_itemWidth + seperateDistance) * (length - 1)) - (_dateWidgetWidth! - _itemWidth)),
          );
  }

  double get _itemWidth {
    const double horizontalPadding = 16 * 2;
    final double seperatedWidth = seperateDistance * 6;
    switch (widget.args.type) {
      case SubHealthType.pedometer:
        return (size.width - (horizontalPadding + seperatedWidth)) / (length == 7 ? 7 : 14);
      case SubHealthType.arterialPressure:
        return (size.width - (horizontalPadding + seperatedWidth)) / 7;
      case SubHealthType.bloodSugar:
        return (size.width - (horizontalPadding + seperatedWidth)) / (length == 7 ? 7 : 14);
      case SubHealthType.twh:
        return (size.width - (horizontalPadding + seperatedWidth)) / 7;
    }
  }

  double? get _dateWidgetWidth {
    if (dateWidgetWidth != null) return dateWidgetWidth!;
    try {
      if (_dateWidgetKey.currentContext?.findRenderObject() == null) {
        return null;
      }
      final double resWidth = (_dateWidgetKey.currentContext!.findRenderObject()! as RenderBox).size.width;
      dateWidgetWidth = resWidth;
      return resWidth;
    } on Exception catch (_) {
      return null;
    }
  }

  bool _buildWhen(HealthState previous, HealthState current) {
    switch (widget.args.type) {
      case SubHealthType.pedometer:
        return previous.pedometerList != current.pedometerList;
      case SubHealthType.arterialPressure:
        return previous.arterialPressureList != current.arterialPressureList;
      case SubHealthType.bloodSugar:
        return previous.bloodSugarList != current.bloodSugarList;
      case SubHealthType.twh:
        return previous.twhList != current.twhList;
    }
  }

  // ________________________________________________________________________

  // num _getMaxNumByType(SubHealthModel val) {
  //   switch (widget.args.type) {
  //     case SubHealthType.pedometer:
  //       return val.distance ?? 0;
  //     case SubHealthType.arterialPressure:
  //       return val.pulse ?? 0;
  //     case SubHealthType.bloodSugar:
  //       return val.value ?? 0;
  //     case SubHealthType.twh:
  //       return val.averageBmi ?? 0;
  //   }
  // }

  void _getNewListRequest() {
    switch (widget.args.type) {
      case SubHealthType.pedometer:
        widget.args.bloc.add(const HealthEvent.getPedometer());
      case SubHealthType.arterialPressure:
        widget.args.bloc.add(const HealthEvent.getArterialPressure());
      case SubHealthType.bloodSugar:
        widget.args.bloc.add(const HealthEvent.getBloodSugar());
      case SubHealthType.twh:
        widget.args.bloc.add(const HealthEvent.getTWH());
    }
  }

  bool _checkLoading(HealthState previous, HealthState current) {
    switch (widget.args.type) {
      case SubHealthType.pedometer:
        return previous.pedometerLoading && !current.pedometerLoading;
      case SubHealthType.arterialPressure:
        return previous.arterialPressureLoading && !current.arterialPressureLoading;
      case SubHealthType.bloodSugar:
        return previous.bloodSugarLoading && !current.bloodSugarLoading;
      case SubHealthType.twh:
        return previous.twhLoading && !current.twhLoading;
    }
  }

  bool _stateListIsNotEmpty(HealthState state) {
    switch (widget.args.type) {
      case SubHealthType.pedometer:
        return state.pedometerList.isNotEmpty;
      case SubHealthType.arterialPressure:
        return state.arterialPressureList.isNotEmpty;
      case SubHealthType.bloodSugar:
        return state.bloodSugarList.isNotEmpty;
      case SubHealthType.twh:
        return state.twhList.isNotEmpty;
    }
  }

  List<SubHealthModel> _getChangedList(HealthState state) {
    switch (widget.args.type) {
      case SubHealthType.pedometer:
        return List.generate(
          state.pedometerList.length,
          (index) => SubHealthModel.fromPedometer(state.pedometerList[index]),
        );
      case SubHealthType.arterialPressure:
        return List.generate(
          state.arterialPressureList.length,
          (index) => SubHealthModel.fromArterialPressure(state.arterialPressureList[index]),
        );
      case SubHealthType.bloodSugar:
        return List.generate(
          state.bloodSugarList.length,
          (index) => SubHealthModel.fromBloodSugar(state.bloodSugarList[index]),
        );
      case SubHealthType.twh:
        return List.generate(
          state.twhList.length,
          (index) => SubHealthModel.fromTemperatureWeightHeight(state.twhList[index]),
        );
    }
  }
}

class MaxNums {
  MaxNums({
    this.pedometer = 0,
    this.sistolicheskoe = 0,
    this.pulse = 0,
    this.bloodSugar = 0,
    this.temperature = 0,
    this.weight = 0,
    this.height = 0,
  });

  num pedometer;
  num sistolicheskoe;
  num pulse;
  num bloodSugar;
  num temperature;
  num weight;
  num height;
}
