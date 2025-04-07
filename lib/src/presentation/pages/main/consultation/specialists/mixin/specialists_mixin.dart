part of 'package:madadio_client_mobile/src/presentation/pages/main/consultation/specialists/specialists_page.dart';

mixin SpecialistsMixin on State<SpecialistsPage> {
  late final TextEditingController _searchController = TextEditingController();
  late final FocusNode _searchFocusNode = FocusNode();
  late final SpecialistsBloc _bloc = context.read<SpecialistsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(SpecialistsEvent.searchDoctors(
      categoryGuid: widget.args?.doctorsType?.guid ?? '',
    ));
    _searchController.addListener(() {
      _bloc.add(SpecialistsEvent.searchDoctors(
        searchText: _searchController.text,
        categoryGuid: widget.args?.doctorsType?.guid ?? '',
      ));
      setState(() {});
    });
  }
}
