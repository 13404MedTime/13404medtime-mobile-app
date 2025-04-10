part of '../treatments_page.dart';

mixin TreatmentsMixin on State<TreatmentsPage> {
  late final _bloc = context.read<TreatmentsBloc>();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc.add(const GetMedicineTakingEvent());
    scrollController.addListener(
      () {
        if (scrollController.offset == scrollController.position.maxScrollExtent &&
            !_bloc.state.isAdding &&
            _bloc.state.medicineTakingList.isNotEmpty) {
          _bloc.add(const TreatmentsEvent.addMedicineTaking());
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(() {})
      ..dispose();
    super.dispose();
  }
}
