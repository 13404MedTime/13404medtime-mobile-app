part of 'package:madadio_client_mobile/src/presentation/pages/main/treatments/add_medicine/add_medicine_page.dart';

mixin AddMedicineMixin on State<AddMedicinePage> {
  late PageController pageController;
  late final AddMedicineBloc _bloc;

  @override
  void initState() {
    super.initState();
    initController();
    _bloc = context.read<AddMedicineBloc>();
    _bloc.add(const GetMetricsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    disposeController();
  }

  String getPageTitles(int index) {
    switch (index) {
      case 0:
        return context.translate('for_which_medication');
      case 1:
        return context.translate('when_you_like_receive');
      case 2:
        return context.translate('when_you_like_receive');
      default:
        return '';
    }
  }

  void initController() {
    pageController = PageController();
  }

  void disposeController() {
    pageController.dispose();
  }
}
