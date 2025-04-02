part of 'package:madadio_client_mobile/src/presentation/pages/main/home/my_visit/purpose/purpose_page.dart';

mixin PurposeMixin on State<PurposePage> {
  late final PurposeBloc _bloc;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PurposeBloc>();
    _bloc.add(PurposeEvent.getMedicalByDoctor(
      doctorId: widget.args?.doctorId ?? '',
    ));
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent && !_bloc.state.isAdding) {
        _bloc.add(PurposeEvent.addMedicalByDoctor(
          doctorId: widget.args?.doctorId ?? '',
        ));
      }
    });
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
