part of 'package:madadio_client_mobile/src/presentation/pages/main/home/my_visit/purpose/sub_purpose/sub_purpose_page.dart';

mixin SubPurposeMixin on State<SubPurposePage> {
  late final SubPurposeBloc _bloc;
  int currentIndex = 0;

  void _changeCurrentTile(int value) {
    currentIndex = value;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SubPurposeBloc>();
    _bloc.add(SubPurposeEvent.getMedicationData(naznachenieId: widget.args?.naznachenieId ?? ''));
  }

  String getTimeText(final SubPurposeMedicationTimesItem data, final MedicineTakingModel preparatiData) =>
      '${data.data.count?.formatNum ?? 0} ${preparatiData.unitOfMeasureIdData?.getName(data.data.count ?? 0) ?? ''} ${context.translate('drug_time').replaceFirst('\${i}', data.time)} ${data.data.beforeAfterFood != null ? takeTime(data.data.beforeAfterFood!) : ''}';

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

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
