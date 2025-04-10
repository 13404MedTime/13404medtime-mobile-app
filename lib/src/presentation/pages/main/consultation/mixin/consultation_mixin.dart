part of '../consultation_page.dart';

mixin ConsultationMixin on State<ConsultationPage> {
  late final TextEditingController _searchController = TextEditingController();

  // late final FocusNode _searchFocusNode = FocusNode();
  late final ConsultationBloc _bloc = context.read<ConsultationBloc>();

  @override
  void initState() {
    super.initState();
    _initial();
  }

  void _initial() {
    _bloc.add(const ConsultationEvent.searchDoctorsTypes());
    _searchController.addListener(() {
      // _bloc.add(ConsultationEvent.searchDoctorsTypes(
      //     searchText: _searchController.text));
      // setState(() {});
    });
    // _searchFocusNode.addListener(() {
    //   setState(() {});
    // });
  }
}
