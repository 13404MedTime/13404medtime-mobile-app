part of '../disease_history_page.dart';

mixin DiseaseHistoryMixin on State<DiseaseHistoryPage> {
  late final DiseaseHistoryBloc _bloc = context.read<DiseaseHistoryBloc>();
  final ScrollController scrollController = ScrollController();
  late final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _initial(widget.args);
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent &&
          _searchController.text.isEmpty &&
          !_bloc.state.isScrollLoading) {
        _bloc.add(const ScrollGetListEvent());
      }
    });
  }

  Future<void> _onTextChanged(String? newText) async {
    if (newText != null) {
      if (_debounce?.isActive ?? false) {
        _debounce!.cancel();
      }
      _debounce = Timer(const Duration(milliseconds: 500), () async => _searchItems(newText));
    }
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _searchController.dispose();
    _bloc.close();
  }

  void _searchItems(String searchedItem) {
    _bloc.add(DiseaseHistoryEvent.getSearchedItems(searchedItem: searchedItem));
  }

  void _initial(DiseaseHistoryArgs args) {
    _bloc.add(DiseaseHistoryEvent.started(
      diseaseItemsList: args.diseaseItemsList,
      medicationTimes: args.medicationTimes,
      medicalHistoryDrugs: args.medicalHistoryDrugs,
      medicalHistoryDrugNames: args.medicalHistoryDrugNames,
    ));
  }

  String getTimeText(final SubPurposeMedicationTimesItem data, final MedicineTakingModel? preparatiData) =>
      '${data.data.count?.formatNum ?? 0} ${preparatiData?.unitOfMeasureIdData?.getName(data.data.count ?? 0) ?? ''} ${context.translate('drug_time').replaceFirst('\${i}', data.time)} ${data.data.beforeAfterFood != null ? takeTime(data.data.beforeAfterFood!) : ''}';

  String takeTime(String text) {
    switch (text) {
      case 'after':
        return context.translate('after_food');
      case 'before':
        return context.translate('before_food');
      case 'during':
        return context.translate('during_food');
      default:
        return '';
    }
  }
}
