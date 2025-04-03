part of 'package:madadio_client_mobile/src/presentation/pages/main/home/show_all_my_visits/show_all_my_visits_page.dart';

mixin ShowAllMyVisitsMixin on State<ShowAllMyVisitsPage> {
  late final ShowAllMyVisitsBloc _bloc = context.read<ShowAllMyVisitsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(const SearchDoctorEvent(searchText: ''));
  }
}
